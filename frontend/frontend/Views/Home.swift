
//
//  SwiftUIView.swift
//  frontend
//
//  Created by 노유수 on 2023/05/05.
//

import SwiftUI

class loginCheck: ObservableObject {
  @Published var Auth : String
  init() {
    Auth = "false"
  }
}

struct Home: View {
  //@State var auth: Bool = false
  @EnvironmentObject var Login: KakaoAuthVM
 
  
//  @State var selectedIndex = 0
//
//  @State var presented = false
//
//  @StateObject var getViewModel = GET()
//
  var body: some View {
    LoginView()
  }
  
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}

