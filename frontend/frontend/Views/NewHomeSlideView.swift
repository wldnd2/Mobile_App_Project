//
//  SlideView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/07.
//

import SwiftUI



struct NewHomeSlideView: View {
  @State private var isLiked = false
  @State private var count: Int = 17
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
      
      UserImage
      LikesComments
      UserContext

    }.frame(width: 400, height: 600)
      .background(RoundedRectangle(cornerRadius: 25)
        .foregroundColor(.white)
        .shadow(color: .gray, radius: 6)
        .opacity(0.7))
      .padding(.vertical, 10)
  }
}



private extension NewHomeSlideView {
  var UserId: some View{
    Text("아이디입니당")
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
      
      HeartButton(isLiked: $isLiked, count: $count)
      
      Image(systemName: "text.bubble")
        .resizable()
        .frame(width: 20, height: 20)
      
      Text("32")
        .font(.footnote)
      
    }.padding(.horizontal, 15)
      .padding(.bottom, 10)
   
  }
  
  
  var LikesCommentsEmotions: some View{
    HStack{
     
      HeartButton(isLiked: $isLiked, count: $count)
      
      Image(systemName: "text.bubble")
        .resizable()
        .frame(width: 20, height: 20)
      
      Text("32")
        .font(.footnote)
      
    }.padding(.horizontal, 15)
      .padding(.bottom, 10)
   
  }
  
  var UserImage: some View{
    Image("고양이1L")
      .resizable()
      .scaledToFit()
      .frame(width: 400, height: 500)
      .clipped()
  }

  var UserContext: some View{
    Text("조금 혼냈더니 풀 죽어버렸네ㅠㅠㅠ 미안해ㅠㅠ")
      .padding(.horizontal, 15)
  }
}

struct HeartButton: View{
  @Binding var isLiked : Bool
  @Binding var count : Int
  
  private let animationDuration: Double = 0.1
  private var animationScale: CGFloat {
    isLiked ? 0.7 : 1.3
  }
  @State private var animate = false
  var body: some View{
    Button( action: {
      if isLiked == false {
        self.count += 1
      }
      else {
        self.count -= 1
      }
        
      self.isLiked.toggle()
      self.animate = true
      
      DispatchQueue.main.asyncAfter(deadline:.now() + self.animationDuration, execute: {
        self.animate = false
        
      })
    }, label: {
      Image(systemName: isLiked ? "heart.fill" : "heart")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 20)
        .foregroundColor(isLiked ? .red: .gray)
      Text(" \(count) ")
        .font(.footnote)
        .foregroundColor(.black)
    })
    .scaleEffect(animate ? animationScale : 1)
    .animation(.easeIn(duration: animationDuration))
  }
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        NewHomeSlideView()
    }
}
