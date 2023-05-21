//
//  CommnetView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/18.
//

import SwiftUI

struct CommentView: View {
  @State private var describe = ""
    var body: some View {
      VStack{
        CommentHeaderView()
          .frame(width: 400, height: 50)
        
        CommentsPiece()
        CommentsPiece()
        CommentsPiece()
        
        Spacer()
        
        HStack {
          Spacer()
          Spacer()
          ZStack(alignment: .topLeading) {
            TextEditor(text : $describe)
              .cornerRadius(10)
              .frame(height: 100)
              .colorMultiply(Color(UIColor.lightGray))
              .keyboardType(.default)
          }
          Spacer()
          Spacer()
        }
      }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
