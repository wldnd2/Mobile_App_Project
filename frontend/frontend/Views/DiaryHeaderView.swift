//
//  DiaryHeaderView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/15.
//

import SwiftUI

struct DiaryHeaderView : View{
  @State private var tag: Int? = nil
  
  var body: some View {
    HStack {
      MoveButton()
      Text("다이어리")
        .font(.title)
        .bold()
      Spacer()
      ButtonDesign()
    }.frame(width: 405, height: 50)
      .padding(.horizontal, 20)
  }
}



struct DiaryHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryHeaderView()
    }
}
