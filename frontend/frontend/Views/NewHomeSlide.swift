//
//  NewHomeSldie.swift
//  frontend
//
//  Created by 이정민 on 2023/05/08.
//

import SwiftUI

struct NewHomeSlide: View {
  
  @State var presented: Bool = false
  
  var body: some View {
    VStack{
      
      Spacer() // 댓글창
        .fullScreenCover(isPresented: $presented){
          CommentView(presented: $presented)
        }

      
      NewHomeHeaderView ()
        .frame(width: 400, height: 50)
      ScrollView(){
        VStack{
          NewHomeSlideView(presented: $presented)
          NewHomeSlideView(presented: $presented)
          NewHomeSlideView(presented: $presented)
          //ForEach(){}해서 나중에 하면 될듯
        }
      }
    }
  }
}

struct NewHomeSldie_Previews: PreviewProvider {
  static var previews: some View {
    NewHomeSlide()
  }
}
