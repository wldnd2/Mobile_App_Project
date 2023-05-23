//
//  BoardComment.swift
//  frontend
//
//  Created by 노유수 on 2023/05/21.
//

import Foundation


struct BoardComment: Hashable, Codable{
  let commentId: Int
  let commentWriter: String
  let commentContent: String
  let commentDate: String
}
