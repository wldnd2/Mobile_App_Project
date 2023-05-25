//
//  NewHomeBoardGET.swift
//  frontend
//
//  Created by 이정민 on 2023/05/23.
//

import SwiftUI

class GET: ObservableObject {
  
  @Published var boards: [MapBoard] = []
  @Published var diarys: [Diary] = []
  // + 길냥이 피드..
  
  @Published var boardComments: [Comment] = []
  @Published var diaryComments: [Comment] = []
  // + 길냥이 댓글들..
  
  func feedFetch(kind: String) {
    let baseURL = "http://localhost:8080"
    let urlString = "\(baseURL)/\(kind)/list"
    print(urlString)
    
    guard let url = URL(string :urlString) else {
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) {
      [weak self] data, _, error in
      guard let data = data, error == nil else {
        return
      }
      do {
        if kind == "board" {
          let boards = try JSONDecoder().decode([MapBoard].self, from : data)
          DispatchQueue.main.async {
            self?.boards = boards
          }
        }
        else if kind == "diary"{
          let diarys = try JSONDecoder().decode([Diary].self, from: data)
          DispatchQueue.main.async {
            self?.diarys = diarys
          }
        }
        else {
          // 길냥이 GET..
        }
      }
      catch {
        print(error)
      }
    }
    task.resume()
  }
  
  func commentFetch(kind: String, ID: Int) {
    
    let baseURL = "http://localhost:8080"
    let urlString = "\(baseURL)/\(kind)_comment/list?id=\(ID)"
    print(urlString)
    
    guard let url = URL(string :urlString) else {
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { [weak self] data,
      _, error in
      guard let data = data, error == nil else {
        return
      }
      
      //Convert to JSON
      do {
        if kind == "board"{
          let boardComments = try JSONDecoder().decode([Comment].self, from: data)
          DispatchQueue.main.async {
            self?.boardComments = boardComments
          }
        }
        else if kind == "diary"{
          let diaryComments = try JSONDecoder().decode([Comment].self, from: data)
          DispatchQueue.main.async {
            self?.diaryComments = diaryComments
          }
        }
        else{
          // + 길냥이...
        }
      }
      catch {
        print(error)
      }
    }
    task.resume()
  }
}


