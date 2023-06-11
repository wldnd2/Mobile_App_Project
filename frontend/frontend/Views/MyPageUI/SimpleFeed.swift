//
//  SimpleFeed.swift
//  frontend
//
//  Created by 노유수 on 2023/05/18.
//

import SwiftUI

struct SimpleFeed: View {
  
  var kind: String
  @State private var isLiked = false
  var feed: Any
  
  init(kind: String, isLiked: Bool = false, feed: Any) {
    self.kind = kind
    self._isLiked = State(initialValue: isLiked)
    self.feed = feed
  }
  
  var body: some View {
    
    VStack(alignment: .center) {
      
      productImage
        .frame(width: 145, height: 145)
        .clipped()
      
      productDescription
        .frame(width: 145, height: 30)
      
    }// V
    .frame(width: 145, height: 175)
    .background(Color.primary.colorInvert())
    .cornerRadius(20)
    .shadow(color: Color.primary.opacity(0.2), radius: 10,x: 10,y:10)
    .padding(.bottom,25)
    .padding(.trailing,3)
  }
}


private extension SimpleFeed {
  
  var productImage: some View {
    var img: String = ""
    if let typedFeed = feed as? Board {
      img = typedFeed.boardImg
    } else if let typedFeed = feed as? Diary {
      img = typedFeed.diaryImg
    } else if let typedFeed = feed as? MapBoard {
      img = typedFeed.communityImg
    }
    return Image(img)
      .resizable()
      .scaledToFill()
  }

  var productDescription : some View {
    var like_num: Int = 0
    if let typedFeed = feed as? Board {
      like_num = typedFeed.boardLike
    } else if let typedFeed = feed as? Diary {
      like_num = typedFeed.diaryLike
    } else if let typedFeed = feed as? MapBoard {
      like_num = typedFeed.communityLike
    }
    return VStack(alignment:.center){
      HStack {
        Spacer()
        
        Image(systemName: isLiked ? "heart.fill" : "heart")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 20)
          .foregroundColor(isLiked ? .red: .gray)
        
        Text("\(like_num)")
          .font(.subheadline)
          .fontWeight(.bold)
        
        
        Image(systemName: "text.bubble")
          .resizable()
          .frame(width: 20, height: 20)
        
        Text("999")
          .font(.subheadline)
          .fontWeight(.bold)
        
        Spacer()
      }// H
      .padding(.bottom,10)
    }// V
  }
}


struct SimpleFeed_Previews: PreviewProvider {
    static var previews: some View {
      SimpleFeed(kind: "board", feed: exampleBoard)
    }
}
