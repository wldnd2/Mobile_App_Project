//
//  NewHomeSldie.swift
//  frontend
//
//  Created by 이정민 on 2023/05/08.
//

import SwiftUI

struct NewHomeSlide: View {
  
  @Binding var viewModel: GET
  
  var completion: () -> Void
  
  var body: some View {
    
    VStack{
      
      NewHomeHeaderView ()
        .frame(width: 400, height: 50)
      ScrollView(){
        VStack{
          ForEach((0..<viewModel.boards.count).reversed(), id: \.self) { index in
            let board = viewModel.boards[index]
            
            NewHomeSlideView(myIndex: .constant(index), board: board) {
              completion()
            }
            .listRowInsets(EdgeInsets())
            .padding(.bottom, index == 0 ? 80 : 0)
          }
        }
        .onAppear{
          completion()
        }
      }
    }
  }
}

struct NewHomeSldie_Previews: PreviewProvider {
  static var previews: some View {
    NewHomeSlide(viewModel: .constant(GET()), completion: {})
  }
}
