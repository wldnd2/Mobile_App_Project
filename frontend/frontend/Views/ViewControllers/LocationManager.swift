//
//  LocationManager.swift
//  frontend
//
//  Created by 전지웅 on 2023/05/26.
//

import SwiftUI
import CoreLocation
import MapKit
import Combine

class LocationManager: NSObject, ObservableObject, MKMapViewDelegate, CLLocationManagerDelegate{
  // porperty
  @Published var mapView: MKMapView = .init()
  @Published var manager: CLLocationManager = .init()
  
  // serach bar text
  @Published var searchText: String = ""
  var cancellable : AnyCancellable?
  @Published var fetchedPlaces:[CLPlacemark]?
  
  // user loaction
  @Published var userLocation: CLLocation?

  // Final location
  @Published var pickedLocation: CLLocation?
  @Published var pickedPlaceMark: CLPlacemark?
  
  override init(){
    super.init()
    manager.delegate = self
    mapView.delegate = self
    
    // request location access
    manager.requestWhenInUseAuthorization()
    
    // search textfield watching
    cancellable = $searchText
      .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
      .removeDuplicates()
      .sink(receiveValue: {value in
        if value != ""{
          self.fetchPlaces(value: value)
        }else{
          self.fetchedPlaces = nil
        }
      })
  }
  
  func fetchPlaces(value: String){
    Task{
      do{
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = value.lowercased()
        let respone = try await MKLocalSearch(request: request).start()
        await MainActor.run(body: {
          self.fetchedPlaces = respone.mapItems.compactMap({item -> CLPlacemark? in
            return item.placemark
          })
        })
      }
      catch{
        print("error!!!")
      }
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error)
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let currentLoaction = locations.last else{return}
    self.userLocation = currentLoaction
  }
  
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    switch manager.authorizationStatus{
    case.authorizedAlways, .authorizedWhenInUse: manager.requestLocation()
    case.denied: handleLocationError()
    case.notDetermined: manager.requestWhenInUseAuthorization()
    default:
      break
    }
  }
  
  func handleLocationError(){
    // handle error
  }
  
  // add draggable pin to mapView
  func addDraggablePin(coordinate: CLLocationCoordinate2D){
    let annotation = MKPointAnnotation()
    annotation.coordinate = coordinate
    annotation.title = "고양이 위치"
    mapView.addAnnotation(annotation)
  }
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    let marker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "CATPIN")
    marker.isDraggable = true
    marker.canShowCallout = false
    return marker
  }
  
  func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
    guard let newLocation = view.annotation?.coordinate else {return}
    self.pickedLocation = .init(latitude: newLocation.latitude, longitude: newLocation.longitude)
    updatePlacemark(location: .init(latitude: newLocation.latitude, longitude: newLocation.longitude))
  }
  
  func updatePlacemark(location: CLLocation){
    Task{
      do{
        guard let place = try await reverseLocationCoordinates(location: location) else {return}
        await MainActor.run(body: {
          self.pickedPlaceMark = place
        })
      }
      catch{
        print("ERROR")
      }
    }
  }
  
  // diplay new location data
  func reverseLocationCoordinates(location: CLLocation)async throws->CLPlacemark?{
    let place = try await CLGeocoder().reverseGeocodeLocation(location).first
    return place
  }
}
