//
//  MyFeedHeaderView.swift
//  frontend
//
//  Created by 노유수 on 2023/06/05.
//

import SwiftUI

struct MyFeedHeaderView: View {
  
  var name: String
  var body: some View {
    HStack{
      
      MoveButton
      Text(name)
        .font(.title)
        .bold()
      Spacer()
      ButtonDesign()
      
    }.frame(width: 405, height: 50)
    .padding(.horizontal, 20)
  }
}
extension MyFeedHeaderView {
  var MoveButton: some View{
    Button(action: { }) {
      Image(systemName: "chevron.left")
        .resizable()
        .frame(width: 15, height: 20)
        .scaledToFit()
        .padding(.leading, 15)
        .padding([.trailing, .vertical], 10)

    }.foregroundColor(.black)
  }
}

struct MyFeedHeaderView_Previews: PreviewProvider {
    static var previews: some View {
      MyFeedHeaderView(name: "나의 머시기")
    }
}
