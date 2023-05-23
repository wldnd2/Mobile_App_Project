//
//  BoardViewModel.swift
//  frontend
//
//  Created by 노유수 on 2023/05/21.
//

import SwiftUI


class BoardCommentGETViewModel: ObservableObject {
  
  @Published var boardComments: [BoardComment] = []
  
  func fetch() {
    guard let url = URL(string :"http://localhost:8080/board_comment/list?id=1") else {
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { [weak self] data,
      _, error in
      guard let data = data, error == nil else {
        return
      }
      
      //Convert to JSOM
      do {
        let boardComments = try JSONDecoder().decode([BoardComment].self, from: data)
        DispatchQueue.main.async {
          self?.boardComments = boardComments
        }
      }
      catch {
        print(error)
      }
    }
    task.resume()
  }
}

