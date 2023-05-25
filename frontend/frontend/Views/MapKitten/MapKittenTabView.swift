//
//  MapKittenTabView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/10.
//

import SwiftUI

struct MapKittenTabView: View {
  
  @State var boardex: MapBoard
  
  @State private var isLiked = false
  @State private var count: Int = 0
  
  var body: some View{
    HStack(alignment: .top, spacing: 10){
      
        HStack(alignment: .top, spacing: 10){
          
          Image(boardex.communityImg)
            .resizable()
            .scaledToFill()
            .frame(width: 110, height: 110)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.leading, 10)
            .padding(.trailing, 5)
          
          
          VStack(alignment: .leading){
            Text(boardex.communityContent)
            //.font(.footnote)
              .font(.system(size: 15, weight: .bold))
              .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
          //LikesandComments
            
          HStack{
//            HeartButton(
//              isLiked: $isLiked,
//              count:$boardex.communityLike,
//              id: $boardex.communityId,
//              kind: "map"
//            )
              
            Image(systemName: "text.bubble")
                .resizable()
                .frame(width: 20, height: 20)
                  
              //게시글 댓글 수 array count 쓰거나 해서
              //Text("\(boardex.boardComments.count)")
              Text("32")
                .font(.footnote)
                  
              }.padding(.bottom, 10)
            
          }
          .frame(width: 240, height: 100)
          .padding(.top,10)
        }
        .frame(width: 500, height: 100)
          .padding(.trailing, 50)
          .padding(.bottom, 20)
          .padding(.leading, 30)
      }
    
    .onAppear {
        count = mapex.communityLike
    }
    
      
  }
  
  
}
   

struct MapKittenTabView_Previews: PreviewProvider {
  static var previews: some View {
    MapKittenTabView(boardex: mapex)
  }
}
