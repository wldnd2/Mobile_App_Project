//
//  NewHomeBoardGET.swift
//  frontend
//
//  Created by 이정민 on 2023/05/23.
//

import SwiftUI

class MapBoardGET: ObservableObject {
  
  @Published var boards: [MapBoard] = []
  
  func fetch() {
    guard let url = URL(string : "http://localhost:8080/board/list") else {
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) {
      [weak self] data, _, error in
      guard let data = data, error == nil else {
        return
      }
      do {
        let boards = try JSONDecoder().decode([MapBoard].self, from : data)
        //update되면 반영
       
        DispatchQueue.main.async {
          self?.boards = boards
          
        }
      }
      catch {
        print(error)
      }
    }
    task.resume()
  }
  
}


