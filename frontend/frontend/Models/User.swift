//
//  User.swift
//  frontend
//
//  Created by 노유수 on 2023/06/04.
//

import Foundation


struct User {
  var id: Int
  var profile :String
  var user_email :String
  var user_name :String
}

let exampleUser: User =
  User(id: 1, profile: "https://lh3.googleusercontent.com/a/AAcHTtd0eBIbrJWHII4fJSO-AyEThdOa3XMBAKO3OF_E2Q=s96-c", user_email: "noyusu98@gmail.com", user_name: "노유수")
