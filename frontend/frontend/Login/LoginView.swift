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
    
  static let base = Color("beige")
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
              Image("main")
                .resizable()
                .frame(width: 200, height: 200)
              
              Button(action: {
                kakaoAuthVM.handleKakakoLogin()
                
              }){
                
                ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                  
                              .foregroundColor(Color("beige"))
                                .frame(width: 250, height: 65)
                                .shadow(radius: 5)
                            
                            Text("카카오 로그인")
                                .foregroundColor(.white)
                        }
                  
              }
              Button(action: {
                kakaoAuthVM.kakaoLogout()
                
              }){
                ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .frame(width: 250, height: 65)
                                .shadow(radius: 5)
                            
                            Text("카카오 로그아웃")
                                .foregroundColor(.white)
                        }
                
              }
              
              
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

