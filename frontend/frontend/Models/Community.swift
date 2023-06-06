//
//  Community.swift
//  frontend
//
//  Created by 이정민 on 2023/06/06.
//

import Foundation

struct Community: Hashable, Codable {
  let communityId: Int
  let communityWriter: String
  let communityImg: String
  let communityContent: String
  let communityDate: String
  let communityLike: Int
  let latitude: String
  let longitude: String
}



let communityes: Community = Community(
  communityId : 1234,
  communityWriter : "Google_1",
  communityImg : "image.jpg",
  communityContent : "This is the content of my post.",
  communityDate : "2023-06-23",
  communityLike : 32,
  latitude : "35.888",
  longitude : "128.6136"
)
