//
//  MapKittenView.swift
//  frontend
//
//  Created by 이정민 on 2023/06/06.
//

import SwiftUI

struct MapKittenView: View {
    var body: some View {
      ZStack{
        MapBottomView()
        CommunityMapView()
      }
    }
}

struct MapKittenView_Previews: PreviewProvider {
    static var previews: some View {
        MapKittenView()
    }
}
