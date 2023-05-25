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
}


/*
let boardComments: [BoardComment] = [BoardComment(commentId: 1, commentWriter: "아이디2", commentContent: "세상에 저도 가봐야겠어요", commentDate: "2023-05-23")]
 */
/*
let boardex1 = Board(boardId: 1, boardWriter: "아이디", boardTitle: "얘가 저 쳐다봐요 ", boardImg: "고양이3L", boardContent: "이 냥이랑 저 좀 운명인 것 같지 않아요??", boardLike: 322, boardDate: "2023-05-22")

*/
/*
 struct BoardComment: Hashable, Codable{
   let commentId: Int
   let commentWriter: String
   let commentContent: String
   let commentDate: String
 }
 
 */
