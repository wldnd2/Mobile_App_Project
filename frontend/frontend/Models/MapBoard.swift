//
//  MapBoard.swift
//  frontend
//
//  Created by 이정민 on 2023/05/23.
//

import Foundation


struct MapBoard: Hashable, Codable{
  
  var communityId: Int
  let communityWriter: String
  let communityImg: String
  let communityContent: String
  let communityDate: String
  var communityLike: Int
  let langtitude: String
  let longtitude: String
}

let mapex = MapBoard(communityId: 1, communityWriter: "아이디", communityImg: "img", communityContent: "저 쳐다봐요!! 운명인가봐요", communityDate: "2023-05-08", communityLike: 32, langtitude: "35.886", longtitude: "128.6112")

