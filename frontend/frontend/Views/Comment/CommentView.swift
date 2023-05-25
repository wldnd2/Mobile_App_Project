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
      CommentView(id: .constant(99), kind: "diary", presented: .constant(false))
    }
}
