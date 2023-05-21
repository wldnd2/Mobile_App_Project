//
//  SlideView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/07.
//

import SwiftUI



struct NewHomeSlideView: View {
  
  @State var presented: Bool = false
  @State private var isLiked = false
  @State private var count: Int = 17
  
  var body: some View {

    VStack(alignment: .leading, spacing: 0){
      
      Spacer() // 댓글창
        .fullScreenCover(isPresented: $presented){
          CommentView(presented: $presented)
        }
      
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
      .scaledToFill()
      .frame(maxWidth: .infinity)
      .frame(height: .infinity)
      .clipped()
  }

  var UserContext: some View{
    Text("조금 혼냈더니 풀 죽어버렸네ㅠㅠㅠ 미안해ㅠㅠ")
      .padding(.leading)
      .padding(.bottom,15)
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
      } else {
        self.count -= 1
      }
      
      self.isLiked.toggle()
      self.animate = true
      
      DispatchQueue.main.asyncAfter(deadline:.now() + self.animationDuration, execute: {
            self.animate = false
          })
    }) {
      Image(systemName: isLiked ? "heart.fill" : "heart")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 20,height: 20)
        .foregroundColor(isLiked ? .red: .gray)
      Text("\(count)")
        .font(.footnote)
        .foregroundColor(.primary)
    }
    .scaleEffect(animate ? animationScale : 1)
    .onChange(of: animate) { _ in
      withAnimation(.easeIn(duration: animationDuration)) {
        animate = false
      }
    }
  }
}

struct SlideView_Previews: PreviewProvider {
  static var previews: some View {
    NewHomeSlideView(presented: false)
  }
}
