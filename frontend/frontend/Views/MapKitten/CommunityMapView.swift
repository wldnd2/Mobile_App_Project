//
//  CommunityMapView.swift
//  frontend
//
//  Created by 전지웅 on 2023/06/02.
//

import SwiftUI
import MapKit

struct CommunityMapView: View {
  @State private var communities: [Community] = []
  @State private var annotations: [MKPointAnnotation] = []
  
  var body: some View {
    VStack {
      if communities.isEmpty {
        Text("Loading...")
          .padding()
      } else {
        MapView(annotations: annotations)
          .edgesIgnoringSafeArea(.all)
      }
    }
    .onAppear {
      fetchData()
    }
  }
  
  func fetchData() {
    guard let url = URL(string: "http://localhost:8080/community/list") else {
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, _, error in
      if let error = error {
        print("Error: \(error)")
        return
      }
      
      if let data = data {
        do {
          let response = try JSONDecoder().decode([Community].self, from: data)
          DispatchQueue.main.async {
            self.communities = response
            self.setupAnnotations()
          }
        } catch {
          print("Error decoding JSON: \(error)")
        }
      }
    }.resume()
  }
  
  func setupAnnotations() {
    var tempAnnotations: [MKPointAnnotation] = []
    for community in communities {
      if let latitude = Double(community.latitude), let longitude = Double(community.longitude) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        tempAnnotations.append(annotation)
      }
    }
    annotations = tempAnnotations
  }
}

struct Community: Decodable, Identifiable {
  let id = UUID()
  let communityId: Int
  let communityWriter: String
  let communityImg: String
  let communityContent: String
  let communityDate: String
  let communityLike: Int
  let latitude: String
  let longitude: String
}

struct MapView: UIViewRepresentable {
  var annotations: [MKPointAnnotation]
  
  func makeUIView(context: Context) -> MKMapView {
    let mapView = MKMapView()
    mapView.delegate = context.coordinator
    return mapView
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
    uiView.removeAnnotations(uiView.annotations)
    uiView.addAnnotations(annotations)
    uiView.showAnnotations(annotations, animated: true)
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MapView
    
    init(_ parent: MapView) {
      self.parent = parent
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
      let identifier = "Marker"
      var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
      
      if annotationView == nil {
        annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        annotationView?.canShowCallout = true
      } else {
        annotationView?.annotation = annotation
      }
      
      return annotationView
    }
  }
}

struct CommunityMapView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityMapView()
    }
}
