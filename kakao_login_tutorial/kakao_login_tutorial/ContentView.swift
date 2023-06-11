//
//  ContentView.swift
//  kakao_login_tutorial
//
//  Created by 배근영 on 2023/06/11.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var kakaoAuthVM : KakaoAuthVM = KakaoAuthVM()
    
    let loginStatusInfo : (Bool) -> String = {isLoggedIn in
        return isLoggedIn ? "로그인 상태" : "로그아웃 상태"
    }
    var body: some View {
        
        VStack(spacing: 20) {
            Text(loginStatusInfo(kakaoAuthVM.isLoggedIn))
                .padding()
            Button("카카오 로그인",action: {
                kakaoAuthVM.handleKakakoLogin()
                
            })
            Button("카카오 로그아웃", action: {
                kakaoAuthVM.kakaoLogout()
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
