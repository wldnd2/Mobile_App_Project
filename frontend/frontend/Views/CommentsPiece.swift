//
//  CommentsPiece.swift
//  frontend
//
//  Created by 이정민 on 2023/05/18.
//

import SwiftUI

struct CommentsPiece: View {
    var body: some View {
      HStack(alignment: .top){
        UserProfile
          .padding(.top, 5)
        
        VStack(alignment: .leading){
          UserId
            VStack(alignment: .leading){
              Comment()
                .padding(.top, 10)
                .offset(x: -60, y: 3)
              Spacer()
            }
            .frame(width: 300, height: 65)
            .background(Color(UIColor.lightGray))
            .cornerRadius(15)
            //.padding(.horizontal, 10)
                  
          }
          
          
        }
      //.padding(.vertical, 5)
    }
}

private extension CommentsPiece {
  var UserId: some View{
    Text("아이디")
      .font(.system(size: 17))
      .padding(.top, 5)
  }
  
  var UserProfile: some View{
    Image(systemName: "person.circle.fill")
      .resizable()
      .frame(width: 50, height: 50)
      .scaledToFill()
    
  }
}
struct Comment: View{
  var body: some View{
      Text("너무너무 귀여워요오!!!")
    
  }
    
}

struct CommentsPiece_Previews: PreviewProvider {
    static var previews: some View {
        CommentsPiece()
    }
}
