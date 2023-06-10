//
//  WriteUI.swift
//  frontend
//
//  Created by 노유수 on 2023/05/06.
//

import SwiftUI

@MainActor class location: ObservableObject {
  @Published var long : String
  @Published var lat : String
  
  init() {
    long = "0.0"
    lat = "0.0"
  }
}

struct WriteView: View {
  
  @StateObject var locationInfo = location()
  @State var mapchoose: Bool = false
  @Binding var presented: Bool
  
  @State var selectedToggle = 0
  // 0: 다이어리 / 1: 분양 / 2: 길냥이
  
  @State private var title = ""
  
  @State var catMood: DropdownMenuOption? = nil
  
  @State private var image = UIImage()
  @State private var openPhoto = false
  
  @State private var describe = ""
  
  @State private var keyboardHeight: CGFloat = 0
  
  @State var date = Date()
  @State var dateString: String = ""
  
  var completion: () -> Void
  
  var body: some View {
    VStack{
      
      topLayer // 상단 뒤로가기, 글쓰기
      ToggleView(selectedToggle: $selectedToggle, toggleTexts: ["다이어리", "   분양    ", " 길냥이   "])

      ZStack{
        switch selectedToggle {

        case 0: // 다이어리 글 작성 UI
          diaryWriteUI  // diaryUI add..
          
        case 1: // 분양 글 작성 UI
          newHomeWriteUI // diaryUI add..
          
        default: // 길냥이 글 작성 UI
          strayWriteUI
        }
        
        VStack {
          Spacer()
          if keyboardHeight == 0 {
            bottomLayer
          }
        }
      }
      
    }// V
    .onAppear(perform : UIApplication.shared.hideKeyboard)
    .onAppear(perform: subscribeToKeyboardEvents)
    
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
  
  // diaryWriteUI
  var diaryWriteUI: some View {
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
        .padding(.vertical)
        
        //고양이 기분 선택.
        DropdownMenu(
          selectedOption: $catMood,
          placeholder: "고양이 기분",
          options: DropdownMenuOption.selectCatMoods
        )
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
        .padding(.bottom, 80)
        
      }// V
      .frame(maxWidth: .infinity)
      
    } //ScrollView
  }
  
  // newHomeWriteUI
  var newHomeWriteUI: some View {
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
        .padding(.vertical)
        

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
        .padding(.bottom, 80)
        
      }// V
      .frame(maxWidth: .infinity)
      
    } //ScrollView
  }
  
  // strayWriteUI
  var strayWriteUI: some View {
    ScrollView(.vertical) {
      
      VStack(alignment: .leading){
        HStack{
          Text("위치 선택") // 이미지 선택
            .font(.title3)
            .fontWeight(.black)
            .padding(.horizontal,24)
            .padding(.top)
          //위치 선택 버튼 완성
          //이 버튼 누르면 이제 search view 로 이동
          Button(action : {
            print("받아온 위도: \(locationInfo.lat)")
            print("받아온 경도: \(locationInfo.long)")
            mapchoose = true
          }, label: {
            ZStack{
              Rectangle()
                .fill(Color(UIColor.lightGray))
                .frame(width: 250, height: 40)
                .cornerRadius(20)
                .padding(.top, 10)
              Image(systemName: "magnifyingglass")
                .padding(.leading, 200)
                .padding(.top, 10)
              
            }
          })
          .sheet(isPresented: $mapchoose) {
            NavigationView(){
              SearchView(mapchoose: $mapchoose)
                .navigationBarBackButtonHidden(false)
            }
            .environmentObject(locationInfo)
          }
        }
        //Text("\(locationInfo.lat)")
        //Text("\(locationInfo.long)")
        
        Text("이미지 선택") // 이미지 선택
          .font(.title3)
          .fontWeight(.black)
          .padding(.horizontal,24)
          .padding(.top)
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
        
        
        Text("그림 설명") // 세부내용 작성
          .font(.title3)
          .fontWeight(.black)
          .padding(.horizontal,24)
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
      }// V
      .frame(maxWidth: .infinity)
      
    } //ScrollView

  }
  
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
          .cornerRadius(30)
          .shadow(radius: 5)

      }
      
      Button(action: {
        //다이어리 글쓰기
        if selectedToggle == 0 {
          print("Clicked")
          SendAPI.diaryPOST(
            writer: exampleUser.user_name,
            content: self.describe
            
          ){
            completion()
          }
          print(self.image)
        }
        //분양 글쓰기
        else if selectedToggle == 1 {
          SendAPI.boardPOST(
            content: self.describe
          ){
            completion()
          }
        }
        //길냥이 글쓰기
        else {
          
        }
        
        presented.toggle()
        
      }){
        Text("완료")
          .font(.headline)
          .foregroundColor(.white)
          .frame(height: 55)
          .frame(maxWidth: .infinity)
          .background(.blue)
          .cornerRadius(30)
          .shadow(radius: 5)
      }
      
      Spacer()
      Spacer()
    }// H
  }
  
  private func subscribeToKeyboardEvents() {
      NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
          guard let userInfo = notification.userInfo else { return }
          guard let keyboardRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
          self.keyboardHeight = keyboardRect.height
      }
      
      NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
          self.keyboardHeight = 0
      }
  }
}



struct WriteUI_Previews: PreviewProvider {
  static var previews: some View {
    WriteView(
      presented: .constant(true),
       completion: {})
  }
}
