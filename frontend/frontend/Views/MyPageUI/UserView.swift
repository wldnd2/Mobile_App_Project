//
//  UserView.swift
//  frontend
//
//  Created by 노유수 on 2023/05/17.
//

import SwiftUI

struct UserView: View {
  var body: some View {
    VStack {
      
      topLayer
      
      ScrollView(.vertical){
        VStack{
          
          userImage
          userName
          userDescribe
          
          Divider()
            .background(Color.black)
            .frame(width: 350)
          
          SimpleFeedList(name: "나의 다이어리")
          SimpleFeedList(name: "나의 길냥이")
          SimpleFeedList(name: "나의 분양")
            .padding(.bottom, 80)
        }// V
        .frame(maxWidth: .infinity)
      }// ScrollView
    }// V
  }
}

private extension UserView{
  var topLayer: some View {
    HStack{
      //뒤로가기 버튼
      Button(action: {
        
      }, label: {
        Image(systemName: "chevron.backward")
          .font(.system(size: 20,
                        weight: .bold,
                        design: .default))
          .foregroundColor(.black)
          .frame(width: 70,height: 60)
      })
      
      Text("마이페이지")
        .font(.title)
        .fontWeight(.black)
      Spacer()
    }
  }
  var userImage: some View {
    Image(systemName: "person.circle.fill")
      .resizable()
      .frame(width: 80, height: 80)
      .scaledToFill()
      .padding(.vertical)
  }
  var userName: some View {
    Text("아이디입니당")
      .font(.title3)
      .fontWeight(.black)
      .padding(.vertical,5)
  }
  var userDescribe: some View {
    Text("3살 짜리 치즈냥이를 키우고 있어요!!")
      .font(.subheadline)
      .fontWeight(.bold)
      .padding(.bottom,10)
  }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}

