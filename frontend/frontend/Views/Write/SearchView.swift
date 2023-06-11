//
//  SearchView.swift
//  frontend
//
//  Created by 전지웅 on 2023/05/26.
//

import SwiftUI
import MapKit




struct SearchView: View {
  @EnvironmentObject var locationInfo: location
  
  @Binding var mapchoose: Bool
  
  @StateObject var locationManager: LocationManager = .init()
  @State var navigationTag: String?
  var body: some View {
    VStack{
      HStack(spacing: 15){
        Button{
          mapchoose = false
        } label: {
          Image(systemName: "chevron.left")
            .font(.title3)
            .foregroundColor(.primary)
        }
        Text("위치 검색")
          .font(.title3)
          .fontWeight(.semibold)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      
      HStack(spacing: 10){
        Image(systemName: "magnifyingglass")
          .foregroundColor(.gray)
        TextField("위치를 검색해주세요", text: $locationManager.searchText)
      }
      .padding(.vertical, 12)
      .padding(.horizontal)
      .background(
        RoundedRectangle(cornerRadius: 10, style: .continuous)
          .strokeBorder(.gray)
      )
      .padding(.vertical, 10)
      
      if let places = locationManager.fetchedPlaces,!places.isEmpty{
        List{
          ForEach(places,id: \.self){place in
            Button{
              if let coordinate = place.location?.coordinate{
                locationManager.pickedLocation = .init(latitude: coordinate.latitude, longitude: coordinate.longitude)
                locationManager.mapView.region = .init(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                locationManager.addDraggablePin(coordinate: coordinate)
                locationManager.updatePlacemark(location: .init(latitude: coordinate.latitude, longitude: coordinate.longitude))
              }
              
              navigationTag = "MAPVIEW"
            }label: {
              HStack(spacing: 15){
                Image(systemName: "mappin.circle.fill")
                  .font(.title2)
                  .foregroundColor(.gray)
                
                VStack(alignment: .leading, spacing: 6){
                  Text(place.name ?? "")
                    .font(.title3.bold())
                    .foregroundColor(.primary)
                  
                  Text(place.locality ?? "")
                    .font(.caption)
                    .foregroundColor(.gray)
                }
              }
            }
          }
        }
        .listStyle(.plain)
      }
      else {
        // live location button
        Button{
          if let coordinate = locationManager.userLocation?.coordinate{
            locationManager.mapView.region = .init(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            locationManager.addDraggablePin(coordinate: coordinate)
            locationManager.updatePlacemark(location: .init(latitude: coordinate.latitude, longitude: coordinate.longitude))
          }
          
          navigationTag = "MAPVIEW"
        } label: {
          Label {
            Text("현재 사용자 위치")
              .font(.callout)
          } icon: {
            Image(systemName: "location.north.circle.fill")
          }
          .foregroundColor(.green)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
      }
      //
    }
    .padding()
    .frame(maxHeight: .infinity, alignment: .top)
    .background{
      NavigationLink(tag: "MAPVIEW", selection: $navigationTag){
        MapViewSelection(mapchoose: $mapchoose)
          .environmentObject(locationManager)
          .navigationBarHidden(true)
      }label: {
        // blank
      }
      .labelsHidden()
    }
  }
}

struct MapViewSelection: View{
  @EnvironmentObject var locationInfo: location
  @Binding var mapchoose: Bool
  
  @EnvironmentObject var locationManager: LocationManager
  @Environment(\.dismiss) var dismiss
  @State private var selectedLatitude: Double?
  @State private var selectedLongitude: Double?

  var body: some View{
    ZStack{
      MapViewHelper()
        .environmentObject(locationManager)
        .ignoresSafeArea()
      
      Button{
        dismiss()
      } label:{
        Image(systemName: "chevron.left")
          .font(.title2.bold())
          .foregroundColor(.primary)
      }
      .padding()
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      
      if let place = locationManager.pickedPlaceMark{
        VStack(spacing: 15){
          Text("고양이 위치를 핀으로 알려주세요")
            .font(.title2.bold())
          
          HStack(spacing: 15){
            Image(systemName: "mappin.circle.fill")
              .font(.title2)
              .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 6){
              Text(place.name ?? "")
                .font(.title3.bold())
              
              Text(place.locality ?? "")
                .font(.caption)
                .foregroundColor(.gray)
            }
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.vertical, 10)
          
          Button(action: {
            // Button이 클릭되었을 때 실행되는 동작
            if let place = locationManager.pickedPlaceMark {
                selectedLatitude = place.location?.coordinate.latitude
                selectedLongitude = place.location?.coordinate.longitude
                print("선택된 위치의 위도: \(selectedLatitude ?? 0.0)")
                print("선택된 위치의 경도: \(selectedLongitude ?? 0.0)")
                locationInfo.lat = String(format: "%f", selectedLatitude ?? 0.0)
                locationInfo.long = String(format: "%f", selectedLongitude ?? 0.0)
                mapchoose = false
              
            }
          }) {
            Label(
              title: {
                Text("글쓰기 이동")
                  .fontWeight(.semibold)
                  .frame(maxWidth: .infinity)
                  .padding(.vertical, 12)
                  .foregroundColor(.white)
              },
              icon: {
                EmptyView()
              }
            )
            .background(
              RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.green)
            )
          }
        }
        .padding()
        .background{
          RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(.white)
            .ignoresSafeArea()
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
      }
    }
    .onDisappear {
        locationManager.pickedLocation = nil
        locationManager.pickedPlaceMark = nil
        let annotations = locationManager.mapView.annotations // 모든 어노테이션 가져오기
        locationManager.mapView.removeAnnotations(annotations) // 모든 어노테이션 제거
    }
  }
}

struct MapViewHelper: UIViewRepresentable{
  @EnvironmentObject var lacationManager: LocationManager
  func makeUIView(context: Context) -> MKMapView {
    return lacationManager.mapView
  }
  func updateUIView(_ uiView: UIViewType, context: Context) {
    print("updateUIView")
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView(mapchoose: .constant(true))
      .environmentObject(location())
  }
}
