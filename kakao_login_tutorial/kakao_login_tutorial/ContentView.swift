//
//  ContentView.swift
//  kakao_login_tutorial
//
//  Created by 배근영 on 2023/06/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Hello, world!")
                .padding()
            Button("카카오 로그인",action: {})
            Button("카카오 로그아웃", action: {})
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
