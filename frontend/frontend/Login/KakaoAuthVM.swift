//
//  KakaoAuthVM.swift
//  kakao_login_tutorial
//
//  Created by 배근영 on 2023/06/11.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthVM : ObservableObject{
    
    @Published var isLoggedIn : Bool = false
    
    @MainActor
    func kakaoLogout(){
        Task{
            if await handleKakaoLogout(){
                isLoggedIn = false
            }
        }
    }
    func handleKakaoLogout() async -> Bool{
        
        await withCheckedContinuation{continuation in
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("logout() success.")
                    continuation.resume(returning: true)
                }
            }
        }
        
    }
    
    func handleLoginWithKakaoTalkApp() async -> Bool{
        await withCheckedContinuation{ continuation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                    if let error = error {
                        print(error)
                        continuation.resume(returning: false)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")

                        //do something
                        _ = oauthToken
                        continuation.resume(returning: true)
                    }
                }
        }
    }
    
    func handleWithKakaoAccount() async -> Bool{
        await withCheckedContinuation{ continuation in
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    //do something
                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    @MainActor
    func handleKakakoLogin(){
        Task{
            // 카카오톡 실행 가능 여부 확인
            if (UserApi.isKakaoTalkLoginAvailable()) {
                isLoggedIn = await handleLoginWithKakaoTalkApp()
            } else {
                //설치 안되어있을때-> 카카오 웹뷰로 로그인
                isLoggedIn = await handleWithKakaoAccount()
            }
        }
        
    }
}
