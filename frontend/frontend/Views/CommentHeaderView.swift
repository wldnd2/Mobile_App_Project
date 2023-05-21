//
//  CommentHeaderView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/18.
//

import SwiftUI

struct CommentHeaderView : View{
  @State private var tag: Int? = nil
  
  var body: some View {
    HStack {
      MoveButton()
      Text("댓글")
        .font(.title)
        .bold()
      Spacer()
    }.frame(width: 405, height: 50)
      .padding(.horizontal, 20)
  }
}



struct CommentHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CommentHeaderView()
    }
}

