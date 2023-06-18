//
//  UserView.swift
//  frontend
//
//  Created by 노유수 on 2023/05/17.
//

import SwiftUI

struct UserView: View {
  
  @State private var showingSheet = false
  @Binding var viewModel: GET
  var completion: () -> Void
  
  var body: some View {
    NavigationView{
      ZStack{
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
              
              SimpleFeedList(
                viewModel: $viewModel,
                kind: "diary"){
                  completion()
                }
              SimpleFeedList(
                viewModel: $viewModel,
                kind: "community"){
                  completion()
                }
              SimpleFeedList(
                viewModel: $viewModel,
                kind: "board"){
                  completion()
                }
                .padding(.bottom, 80)
            }// V
            .frame(maxWidth: .infinity)
          }// ScrollView
          
        }// V
        ZStack{
          Button(action: {
            self.showingSheet.toggle()
          })
          {
            askGPT
          }
          .sheet(isPresented: $showingSheet){
            GptChatBotView()
          }
                 
      }
      .padding(.top, 540)
      .padding(.leading, 300)
      }//Z
    }// NavigationView
    .onAppear{
      completion()
    }
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
      
//      ZStack{
//        askGPT
//      }
//      .padding(.trailing, 10)
//      //.offset(x: 120, y: -180)
    }
  }
  
  var askGPT: some View {
    Image("chat")
      .resizable()
      //.clipShape(Circle())
    .clipShape(RoundedRectangle(cornerRadius: 5))
      .scaledToFill()
      .frame(width: 55, height: 55)
      
//      .overlay{
//        RoundedRectangle(cornerRadius: 5)
//          //.stroke(Color(red: 0.3, green: 0.3, blue: 0.3), lineWidth: 2)
//
//      }
      .shadow(radius: 7)
  }
  
  var userImage: some View {
    
    return ZStack{
      Image(systemName: "person.circle.fill")
        .resizable()
        .frame(width: 80, height: 80)
        .scaledToFill()
        .padding(.vertical)
      
      if let imageData =
          try? Data(contentsOf:
                      URL(string: exampleUser.profile)!),
         let userImg = UIImage(data: imageData) {
           Image(uiImage: userImg)
            .resizable()
            .frame(width: 80, height: 80)
            .scaledToFit()
            .clipShape(Circle())
            .padding(.vertical)
         }
      
    }
  }
  var userName: some View {
    Text("\(exampleUser.user_name)")
      .font(.title3)
      .fontWeight(.black)
      .padding(.vertical,5)
  }
  var userDescribe: some View {
    Text("\(exampleUser.user_email)")
      .font(.subheadline)
      .fontWeight(.bold)
      .padding(.bottom,10)
  }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
      UserView(viewModel: .constant(GET())){}
    }
}

