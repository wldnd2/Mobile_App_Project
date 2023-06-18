//
//  HeaderView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/08.
//

import SwiftUI

struct NewHomeHeaderView: View {
  
  @State private var tag:Int? = nil
  
    var body: some View {
      HStack{
        
        MoveButton()
        Text("분양게시판")
          .font(.title)
          .bold()
        Spacer()
        ButtonDesign()
        
      }.frame(width: 405, height: 50)
      .padding(.horizontal, 20)
    }
}

struct MoveButton: View{
  var body: some View{
    
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

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NewHomeHeaderView()
    }
}


