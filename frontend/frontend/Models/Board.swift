//
//  Board.swift
//  frontend
//
//  Created by 노유수 on 2023/05/21.
//

import Foundation


struct Board: Hashable, Codable{
  let boardId: Int
  let boardWriter: String
  var boardTitle: String
  var boardImg: String
  var boardContent: String
  var boardLike: Int
  let boardDate: String
  var boardComments:[BoardComment]
}
