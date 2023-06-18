//
//  LoginView.swift
//  frontend
//
//  Created by 노유수 on 2023/06/18.
//

import SwiftUI

struct LoginView: View {
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
