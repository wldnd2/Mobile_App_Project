//
//  SlideView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/07.
//

import SwiftUI



struct NewHomeSlideView: View {
  
  @Binding var myIndex: Int
  @State var board: Board
  @State var presented: Bool = false
  var isLiked : Bool {
        if myIndex < IsLike.boardLikeList.count {
          return IsLike.boardLikeList[myIndex]
        } else {
          return false
        }
      }
  
  
  var completion: () -> Void
  
  var body: some View {

    VStack(alignment: .leading, spacing: 0){
      
//      Spacer() // 댓글창
//        .fullScreenCover(isPresented: $presented){
//          CommentView(id: <#T##Binding<Int>#>, kind: <#T##String#>, presented: <#T##Binding<Bool>#>
//        }
//
      HStack(spacing: 15.0){
        
        UserProfile
        UserId
        Spacer()
        Menu("|") {
          Button("수정", action: {
            SendAPI.feedPUT(kind: "board",ID: board.boardId){
              completion()
            }
          })
          Button("삭제", action: {
            SendAPI.feedDELETE(kind: "board",ID: board.boardId, index: myIndex){
              completion()
            }
          })
        }
        .foregroundColor(.black)
        .padding(.horizontal, 15)
        
      }
      .frame(maxWidth: .infinity)
      .frame(height: 60)
      .padding(.horizontal, 15)
      
      UserImage
      LikesComments
      UserContext

    }.frame(height: 560)
      .frame(maxWidth: .infinity)
      .background(RoundedRectangle(cornerRadius: 25)
      .foregroundColor(.white)
      .shadow(color: .gray, radius: 6)
      .opacity(0.7))
      .padding(.vertical, 10)
  }
}



private extension NewHomeSlideView {
  var UserId: some View{
    Text(board.boardWriter)
      .font(.footnote)
  }

  var UserProfile: some View{
    //사용자 프사 존재해?
    // 프사 존재한다면 프사 넣고 아니라면 기본 이미지로
    Image(systemName: "person.circle.fill")
      .resizable()
      .frame(width: 30, height: 30)
      .scaledToFill()
  }

  var LikesComments: some View{
    HStack{
      
            HeartButton(
              isIndex: $myIndex,
              isLiked: isLiked,
              count:$board.boardLike,
              kind: "board",
              id: $board.boardId
            ){
              completion()
            }
      
      Button(action: {
        presented.toggle()
      }) {
        HStack{
          Image(systemName: "text.bubble")
            .resizable()
            .frame(width: 20, height: 20)
          Text("32")
            .font(.footnote)
        }.foregroundColor(Color.primary)
      }
      
      
    }// H
    .padding(.horizontal, 15)
    .padding(.vertical, 10)

  }
  
  var LikesCommentsEmotions: some View{
    HStack{
     
//      HeartButton(
//        isLiked: $isLiked,
//        count:$count,
//        id: ,
//        kind: "board"
//      )
//
      Image(systemName: "text.bubble")
        .resizable()
        .frame(width: 20, height: 20)
      
      Text("32")
        .font(.footnote)
      
    }.padding(.horizontal, 15)
      .padding(.bottom, 10)
   
  }
  
  var UserImage: some View{
    GeometryReader{proxy in
      Image(board.boardImg)
        .resizable()
        .scaledToFit()
        .frame(maxWidth: proxy.size.width)
        .frame(height: proxy.size.height)
        .clipped()
    }
  }

  var UserContext: some View{
    Text(board.boardContent)
      .padding(.leading)
      .padding(.bottom,15)
  }
}



struct SlideView_Previews: PreviewProvider {
  static var previews: some View {
    NewHomeSlideView(myIndex: .constant(99), board: exampleBoard, presented: false, completion: {})
  }
}
