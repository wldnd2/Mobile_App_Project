//
//  CommentsPiece.swift
//  frontend
//
//  Created by 이정민 on 2023/05/18.
//

import SwiftUI

struct CommentsPiece: View {
    @State var comment :Comment
  
    var body: some View {
      HStack(alignment: .top){
        UserProfile
          .padding(.top, 5)
        
        VStack(alignment: .leading){
            UserId
          
          
          VStack{
            Comment
              .padding(.top, 10)
            Spacer()
          }
          .frame(width: 300, height: 65)
          .background(Color(UIColor.lightGray))
          .cornerRadius(15)
          
                  
          }
          
          
        }
      //.padding(.vertical, 5)
    }
}

private extension CommentsPiece {
  var UserId: some View{
    Text(comment.commentWriter)
      .font(.system(size: 17))
      .padding(.top, 5)
  }
  
  var UserProfile: some View{
    Image(systemName: "person.circle.fill")
      .resizable()
      .frame(width: 50, height: 50)
      .scaledToFill()
    
  }
  var Comment: some View{
    HStack {
      Text(comment.commentContent)
        .padding(.leading, 10)
      Spacer()
    }
  }
}


struct CommentsPiece_Previews: PreviewProvider {
    static var previews: some View {
      CommentsPiece( comment: exampleComment)
    }
}
