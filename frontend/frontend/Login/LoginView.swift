//
//  LoginView.swift
//  frontend
//
//  Created by 노유수 on 2023/06/18.
//


import SwiftUI



struct LoginView: View {
  
  //@Binding var auth: Bool
  @StateObject var kakaoAuthVM : KakaoAuthVM = KakaoAuthVM()
      
      var loginStatusInfo : Bool {
        //Login.auth = kakaoAuthVM.isLoggedIn
//        if loginStatusInfo == true {
//          Login.auth = true
//        }
        return kakaoAuthVM.isLoggedIn
      }
    
      var body: some View {
        
        
          VStack(spacing: 20) {
            if loginStatusInfo {
              baseView()
            }
            else {
              Text("로그인하세요")
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
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    //LoginView(auth: .constant(true))
      LoginView()
  }
}

