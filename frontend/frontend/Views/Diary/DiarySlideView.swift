//
//  DiarySlideView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/15.
//

import SwiftUI

struct DiarySlideView: View {
  
    @Binding var myIndex: Int
    @State var diary :Diary
    @State var presented: Bool = false
    var isLiked : Bool {
      return IsLike.diaryLikeList[myIndex]
    }
  
    var completion: () -> Void
  
    var body: some View {
      VStack(alignment: .leading, spacing: 0){
        
        Spacer() // 댓글창
          .fullScreenCover(isPresented: $presented){
            CommentView(id: $diary.diaryId , kind: "diary", completion: {}, presented: $presented)
          }
        
        HStack(spacing: 15.0){
          UserProfile
          UserId
          Spacer()
          Menu("|") {
            Button("수정", action: {
              SendAPI.feedPUT(
                kind: "diary",
                ID: diary.diaryId){
                  completion()
              }
            })
            Button("삭제", action: {
              SendAPI.feedDELETE(
                kind: "diary",
                ID: diary.diaryId, index: myIndex){
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
          
          LikesCommentsEmotions
          
          UserContext

      
      }// V
      .frame(height: 510)
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 25)
        .foregroundColor(.white)
        .shadow(color: .gray, radius: 6)
        .opacity(0.7))
        .padding(.vertical, 10)
    }
}

private extension DiarySlideView {
  var UserId: some View{
    Text(diary.diaryWriter)
      .font(.footnote)
  }
  
  var UserProfile: some View{
      Image(systemName: "person.circle.fill")
        .resizable()
        .frame(width: 30, height: 30)
        .scaledToFill()
    
  }
  
  var LikesCommentsEmotions: some View{
      HStack{
        HeartButton(
          isIndex: $myIndex,
          isLiked: .constant(isLiked),
          count: $diary.diaryLike,
          kind: "diary",
          id: $diary.diaryId
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
        
        Emotions(emo: diary.diaryemotion)
          .font(.footnote)
        
      }.padding(.horizontal, 15)
      .padding(.vertical, 10)
     
  }
  
  var UserImage: some View{
    Image("고양이4L")
      .resizable()
      .scaledToFit()
      .frame(maxWidth: .infinity)
      .frame(height: .infinity)
      .clipped()
  }
  
  var UserContext: some View{
    Text(diary.diaryContent)
      .padding(.leading)
      .padding(.bottom,15)
  }

}




struct Emotions: View{
  @State var emo = 1
  
  var body: some View {
    
    switch emo {
      
    case 1 :
      Text("😺 잘 놀았어요")
    case 2 :
      Text("😽 행복해요")
    case 3 :
      Text("😾 꿀꿀해요")
    case 4 :
      Text("😻 신나요")
    default :
      Text("😿 아팠어요")
    }
  }
}



struct DiarySlideView_Previews: PreviewProvider {
    static var previews: some View {
      DiarySlideView(myIndex: .constant(99), diary: exampleDiary, presented: false, completion: {})
    }
}
