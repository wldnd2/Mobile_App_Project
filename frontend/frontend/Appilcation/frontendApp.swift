//
//  frontendApp.swift
//  frontend
//
//  Created by 전지웅 on 2023/05/02.
//

import SwiftUI

@main
struct frontendApp: App {
    @UIApplicationDelegateAdaptor var appDelegate : MyAppDelegate
  
    var body: some Scene {
        WindowGroup {
          Home()
        }
    }
}
