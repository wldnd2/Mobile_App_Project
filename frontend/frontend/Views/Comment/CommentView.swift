//
//  CommnetView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/18.
//

import SwiftUI

struct CommentView: View {
  @State private var describe = ""
  
  @Binding var id : Int
  var kind : String

  var completion: () -> Void
  
  @Binding var presented: Bool
  @StateObject var viewModel = GET()
  
    var body: some View {
      VStack{
        
        topLayer
        
        ScrollView(showsIndicators: true) {
          VStack{
            if kind == "board"{
              ForEach(viewModel.boardComments, id: \.self) { comment in
                CommentsPiece(comment: comment)
                  .listRowInsets(EdgeInsets())
              }
            } else if kind == "diary" {
              ForEach(viewModel.diaryComments, id: \.self) { comment in
                CommentsPiece(comment: comment)
                  .listRowInsets(EdgeInsets())
              }
            } else {
              
            }
          }
          .onAppear{
            viewModel.commentFetch(kind: kind, ID: id)
          }
        }
        Spacer()
        
        HStack {
          Spacer()
          Spacer()
          Image(systemName: "person.circle.fill")
            .resizable()
            .frame(width: 35, height: 35)
            .scaledToFill()
            .padding(.top, 5)
        
          ZStack{
            
            Color(UIColor.lightGray)
            HStack {
              TextEditor(text : $describe)
                .cornerRadius(10)
                .frame(width: 250, height: 40)
                .colorMultiply(.clear)
                .keyboardType(.default)
                .padding(.bottom, 10)
              
              Button(action: {
                SendAPI.CommendPOST(kind: kind, ID: id)
                {
                  completion()
                }
              }){
                Text("게시")
                  .foregroundColor(.black)
                  .baselineOffset(-25)
                  .padding(.bottom, 20)
              }
            }
          }
          .frame(width: 320, height: 50)
          .cornerRadius(20)
          .padding(.top, 5)
          .padding(.trailing, 5)
          Spacer()
          Spacer()
        }
        .frame(height: 50)
        
      }
    }
  
  var topLayer: some View {
    HStack {
      Button(action: { presented.toggle()}) {
        Image(systemName: "chevron.left")
          .resizable()
          .frame(width: 15, height: 20)
          .scaledToFit()
          .padding(.leading, 15)
          .padding([.trailing, .vertical], 10)

      }.foregroundColor(.primary)
      Text("댓글")
        .font(.title)
        .bold()
      Spacer()
    }
    .frame(width: .infinity, height: 50)
    .padding(.horizontal, 10)
  }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
      CommentView(id: .constant(99), kind: "diary", completion: {}, presented: .constant(false))
    }
}
