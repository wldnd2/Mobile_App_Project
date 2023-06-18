//
//  MapKittenTabView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/10.
//

import SwiftUI

struct MapKittenTabView: View {
  
  @State var presented: Bool = false
  @Binding var myIndex: Int
  @State var community :Community
  //var isLiked: Bool = false
  var isLiked : Bool {
        if myIndex < IsLike.communityLikeList.count {
          return IsLike.communityLikeList[myIndex]
        } else {
          return false
        }
      }
  
  //@State private var isLiked = false
  @State private var count: Int = 0
  var completion: () -> Void
  
  var body: some View{
    HStack(alignment: .top, spacing: 10){
      
      HStack(alignment: .top, spacing: 10){
        
        Image(community.communityImg)
          .resizable()
          .scaledToFill()
          .frame(width: 110, height: 110)
          .clipShape(RoundedRectangle(cornerRadius: 15))
          .padding(.leading, 10)
          .padding(.trailing, 5)
        
        
        VStack(alignment: .leading){
          Text(community.communityContent)
          //.font(.footnote)
            .font(.system(size: 15, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
          
          Spacer()
          
          //LikesandComments
          
          HStack{
            
            LikesComments
            
          }
          .padding(.bottom, 10)
          
        }
        .frame(width: 240, height: 100)
        //          .padding(.top,10)
      }
      .frame(width: 500, height: 100)
      //          .padding(.trailing, 50)
      .padding(.bottom, 20)
      //          .padding(.leading, 30)
    }
    
    
  }
}
   
private extension MapKittenTabView {
    var LikesComments: some View{
      HStack{
        HeartButton(
          isIndex: $myIndex,
          isLiked: isLiked,
          count: $community.communityLike,
          kind: "community",
          id: $community.communityId
        ){
          completion()
        }
        
        Button(action: {
          presented.toggle()
        }) {
          HStack{
            Image(systemName: "text.bubble")
              .resizable()
              .frame(width: 20, height: 20)
            Text("32")
              .font(.footnote)
          }.foregroundColor(Color.primary)
        }
        
        
      }// H
      .padding(.horizontal, 15)
      .padding(.vertical, 10)

    }
    
  }
  
  
struct MapKittenTabView_Previews: PreviewProvider {
  static var previews: some View {
    MapKittenTabView(myIndex: .constant(99), community: communities, completion: {})
  }
}
