//
//  POST.swift
//  frontend
//
//  Created by 노유수 on 2023/05/25.
//

import Foundation
import Combine

class SendAPI: ObservableObject {
    
    static func diaryPOST(writer: String = ",,내 아이디,,", title: String = "POST_Title", img: String = "고양이4L", content: String = "POST 성공!!!!",completion: @escaping () -> Void) {
        
        let body: [String: Any] = [
          "diaryWriter": writer,
          "diaryTitle": title,
          "diaryImg": img,
          "diaryContent": content
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        let url = URL(string: "http://localhost:8080/diary/create")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
          completion()
          let responseJSON = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let responseJSON = responseJSON as? [String: Any] {
              print("-----2> responseJSON: \(responseJSON)")
            }
        }
        
        task.resume()
    }
  
  static func CommendPOST(kind: String, ID: Int, writer: String = ",,내 아이디,,",content: String = "POST 성공!!!!",completion: @escaping () -> Void) {
      
      let body: [String: Any] = [
        "commentWriter": writer,
        "commentContent": content
      ]
      
      let jsonData = try? JSONSerialization.data(withJSONObject: body)
    
      let baseURL = "http://localhost:8080"
      let urlString = "\(baseURL)/\(kind)_comment/create?id=\(ID)"
      print(urlString)
      
      let url = URL(string: urlString)!
      var request = URLRequest(url: url)
      request.httpMethod = "POST"
      request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      request.httpBody = jsonData
      
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
          guard let data = data, error == nil else {
              print(error?.localizedDescription ?? "No data")
              return
          }
        completion()
        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
          if let responseJSON = responseJSON as? [String: Any] {
            print("-----2> responseJSON: \(responseJSON)")
          }
      }
      
      task.resume()
  }
  
  
  
  static func likePUT(kind: String, how: String, ID: Int, completion: @escaping () -> Void) {
    
      let baseURL = "http://localhost:8080"
      let urlString = "\(baseURL)/\(kind)/\(how)/\(ID)"
      print(urlString)
      let url = URL(string: urlString)!
      var request = URLRequest(url: url)
      request.httpMethod = "PUT"
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
          guard let data = data, error == nil else {
              print(error?.localizedDescription ?? "No data")
              return
          }
        
        completion()
        
        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
          if let responseJSON = responseJSON as? [String: Any] {
            print("-----2> responseJSON: \(responseJSON)")
          }
      }
      
      task.resume()
  }
  
  static func feedDELETE(kind: String, ID: Int, completion: @escaping () -> Void) {
    
      let baseURL = "http://localhost:8080"
      let urlString = "\(baseURL)/\(kind)/\(ID)"
      print(urlString)
      let url = URL(string: urlString)!
      var request = URLRequest(url: url)
      request.httpMethod = "DELETE"
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
          guard let data = data, error == nil else {
              print(error?.localizedDescription ?? "No data")
              return
          }
        completion()

        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
          if let responseJSON = responseJSON as? [String: Any] {
            print("-----2> responseJSON: \(responseJSON)")
          }
      }
    
      task.resume()
      
  }
  
  static func feedPUT(kind: String, ID: Int, writer: String = ",,내 아이디,,", title: String = "PUT_Title", img: String = "고양이4L", content: String = "PUT 성공!!!!", completion: @escaping () -> Void) {
    
    var body: [String: Any] = [:]
    
    if kind == "diary" {
      body = [
        "diaryWriter": writer,
        "diaryTitle": title,
        "diaryImg": img,
        "diaryContent": content
      ]
    } else if kind == "board" {
      // 분양..
    } else {
      // 길냥이.. (수정X)
    }
    
    let jsonData = try? JSONSerialization.data(withJSONObject: body)
    
    let baseURL = "http://localhost:8080"
    let urlString = "\(baseURL)/\(kind)/\(ID)"
    print(urlString)
    
    let url = URL(string: urlString)!
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsonData
    
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
            print(error?.localizedDescription ?? "No data")
            return
        }
      print("수정1")
      completion()
      let responseJSON = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        if let responseJSON = responseJSON as? [String: Any] {
          print("-----2> responseJSON: \(responseJSON)")
          
        }
    }
    
    task.resume()

  }


}
