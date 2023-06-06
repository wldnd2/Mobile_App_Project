//
//  UserView.swift
//  frontend
//
//  Created by 노유수 on 2023/05/17.
//

import SwiftUI

struct UserView: View {
  
  @Binding var viewModel: GET
  var completion: () -> Void
  
  var body: some View {
    NavigationView{
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
    }
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

