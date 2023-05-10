//
//  WriteUI.swift
//  frontend
//
//  Created by 노유수 on 2023/05/06.
//

import SwiftUI

struct WriteView: View {
  
  @Binding var presented: Bool
  
  @State var selectedToggle = 0
  
  @State private var title = ""
  
  @State private var image = UIImage()
  @State private var openPhoto = false
  
  @State private var describe = ""
  
  var body: some View {
    VStack{
      
      topLayer // 상단 뒤로가기, 글쓰기
      
      ToggleView(selectedToggle: $selectedToggle, toggleTexts: ["다이어리", "   분양    ", " 길냥이   "])
      
      switch selectedToggle {
        
      case 0: // 다이어리 글 작성 UI
        newHomeUI  // diaryUI add..
        
      case 1: // 분양 글 작성 UI
        newHomeUI // diaryUI add..
        
      default: // 길냥이 글 작성 UI
        newHomeUI // StrayUI add..
        
      }
      
    }// V
    .onAppear (perform : UIApplication.shared.hideKeyboard)
  }
  
  var topLayer: some View{
    HStack{
      //뒤로가기 버튼
      Button(action: {
        presented.toggle()
      }, label: {
        Image(systemName: "chevron.backward")
          .font(.system(size: 20,
                        weight: .bold,
                        design: .default))
          .foregroundColor(.black)
          .frame(width: 70,height: 60)
      })
      //페이지 이름 ( "글쓰기" )
      Text("글쓰기")
        .font(.title)
        .fontWeight(.black)
      Spacer()
    }// H
  }
  
  var newHomeUI: some View {
    ScrollView(.vertical) {
      VStack(alignment: .leading){
        
        
        HStack{ // 글 제목
          Text("제목")
            .font(.title3)
            .fontWeight(.black)
            .padding(.horizontal,24)
          TextField("", text : $title)
            .padding(.vertical,9)
            .padding(.horizontal)
            .background(Color(UIColor.lightGray))
            .cornerRadius(20)
            .keyboardType(.default)
          Spacer()
          Spacer()
        }
        .padding(.bottom)
        

        Text("이미지 선택") // 이미지 선택
          .font(.title3)
          .fontWeight(.black)
          .padding(.horizontal,24)
        ZStack{
            Rectangle()
              .fill(Color(UIColor.lightGray))
            Image(systemName: "plus")
              .font(.title)
              .foregroundColor(.white)
            Image(uiImage: self.image)
              .resizable()
        }
        .frame(width: 180, height: 180)
        .cornerRadius(20)
        .padding(.leading,24)
        .padding(.bottom)
        .onTapGesture {
          self.openPhoto = true
        }.sheet(isPresented: $openPhoto) {
          ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
        
        
        Text("글 작성") // 세부내용 작성
          .font(.title3)
          .fontWeight(.black)
          .padding(.horizontal,24)
        HStack {
          Spacer()
          Spacer()
          ZStack(alignment: .topLeading) {
            TextEditor(text : $describe)
              .cornerRadius(10)
              .frame(height: 200)
              .colorMultiply(Color(UIColor.lightGray))
              .keyboardType(.default)
          }
          Spacer()
          Spacer()
        }
        
        bottomLayer
        
      }// V
      .frame(maxWidth: .infinity)
      
    } //ScrollView
  }
  // saleUI , StrayUI add..
  
  var bottomLayer: some View{
    HStack {
      Spacer()
      Spacer()
      
      Button(action: {
        presented.toggle()
      }){
        Text("취소")
          .font(.headline)
          .foregroundColor(.white)
          .frame(height: 55)
          .frame(maxWidth: .infinity)
          .background(.red)
          .cornerRadius(10)

      }
      
      Button(action: {
        //
        print(title)
        print(image)
        print(describe)
      }){
        Text("완료")
          .font(.headline)
          .foregroundColor(.white)
          .frame(height: 55)
          .frame(maxWidth: .infinity)
          .background(.blue)
          .cornerRadius(10)
      }
      
      Spacer()
      Spacer()
    }// H
  }
}



struct WriteUI_Previews: PreviewProvider {
  static var previews: some View {
    WriteView(presented: .constant(true))
  }
}
