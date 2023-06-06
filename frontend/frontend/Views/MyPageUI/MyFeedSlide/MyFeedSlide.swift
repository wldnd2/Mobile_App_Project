//
//  MyFeedSlide.swift
//  frontend
//
//  Created by 노유수 on 2023/06/05.
//

import SwiftUI

struct MyFeedSlide: View {
  var kind: String
  var name: String {
    if kind == "board"{
      return "나의 분양"
    }else if kind == "diary"{
      return "나의 다이어리"
    }else if kind == "community"{
      return "나의 길냥이"
    }else{return ""}
  }
  @Binding var viewModel: GET
  var myBoards: [Board] {
    print("viewModel.myBoards : \(viewModel.myBoards)")
    return viewModel.myBoards
  }
  var myDiarys: [Diary] {
      viewModel.myDiarys
  }
//  var myCommunitys: [MapBoard] {
//      viewModel.mapBoards
//  }
  var completion: () -> Void
  
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    VStack{
      ScrollView(){
        V_MyFeedlist(kind: kind, myDiarys: myDiarys,myBoards: myBoards){
          completion()
        }
        .onAppear{
          completion()
        }
      }
      .navigationBarBackButtonHidden(true)
      .navigationBarTitle(name, displayMode: .large)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button(action: {
            presentationMode.wrappedValue.dismiss()
          }) {
            Image(systemName: "chevron.left")
              .resizable()
              .frame(width: 15, height: 20)
              .scaledToFit()
              .padding(.leading, 15)
              .padding([.trailing, .vertical], 10)

          }.foregroundColor(.black)
        }
      }
    }
  }
}
struct V_MyFeedlist: View {
  var kind: String
  var myDiarys: [Diary]
  var myBoards: [Board]
//  var myCommunitys: [MapBoard]
  
  var completion: () -> Void

  var body: some View {
    if kind == "diary" {
      VStack {
        ForEach((0..<myDiarys.count).reversed(), id: \.self) { index in
          let feed = myDiarys[index]

          DiarySlideView(myIndex: .constant(index), diary: feed) {
            completion()
          }
          .listRowInsets(EdgeInsets())
          .padding(.bottom, index == 0 ? 80 : 0)
        }
      }
    } else if kind == "board" {
      VStack {
        ForEach((0..<myBoards.count).reversed(), id: \.self) { index in
          let feed = myBoards[index]

          NewHomeSlideView(myIndex: .constant(index), board: feed) {
            completion()
          }
          .listRowInsets(EdgeInsets())
          .padding(.bottom, index == 0 ? 80 : 0)
        }
      }
    } else {
      VStack {
        // 길냥이....
      }
    }
  }
}


struct MyFeedSlide_Previews: PreviewProvider {
    static var previews: some View {
      MyFeedSlide(kind: "board", viewModel: .constant(GET())){}
    }
}
