//
//  DiarySlideView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/15.
//

import SwiftUI

struct DiarySlideView: View {
    @State private var isLiked = false
    @State private var count: Int = 32
  
    var body: some View {
      VStack(alignment: .leading, spacing: 0){
        HStack(spacing: 15.0){
          UserProfile
          UserId
          Spacer()
          Menu("|") {
            Button("수정", action: {})
            Button("삭제", action: {})
          }
          .foregroundColor(.black)
          .padding(.horizontal, 15)
        }
        .frame(width: 375, height: 5)
        .padding(.horizontal, 15)
        
        VStack(alignment: .leading ){
          UserImage
          
          LikesCommentsEmotions
          
          UserContext

        }.padding(.vertical, 15)
      
      }
      .frame(width: 400, height: 600)
      .background(RoundedRectangle(cornerRadius: 25)
        .foregroundColor(.white)
        .shadow(color: .gray, radius: 6)
        .opacity(0.7))
      .padding(.vertical, 10)
    }
}

private extension DiarySlideView {
  var UserId: some View{
    Text("아이디")
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
        HeartButton(isLiked: $isLiked, count: $count)
        
        Image(systemName: "text.bubble")
          .resizable()
          .frame(width: 20, height: 20)
        
        Text("32")
          .font(.footnote)
        
        //Emotions()
        Text("😺 잘 놀았어요")
          .font(.footnote)
        
      }.padding(.horizontal, 15)
        .padding(.bottom, 10)
     
  }
  
  var UserImage: some View{
      Image("고양이4L")
        .resizable()
        .scaledToFill()
        .frame(width: 400, height: 400)
        .clipped()
        .padding(.vertical, 20)
  }
  
  var UserContext: some View{
      Text("뭘보냥 냥이둥절 귀여워ㅠㅜㅠㅜㅠㅜ")
        .padding(.horizontal, 15)
  }

}


/*

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
    case 5 :
      Text("😿 아팠어요")
      
    }
  }
}
*/


struct DiarySlideView_Previews: PreviewProvider {
    static var previews: some View {
        DiarySlideView()
    }
}
