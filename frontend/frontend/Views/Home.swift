//
//  SwiftUIView.swift
//  frontend
//
//  Created by 노유수 on 2023/05/05.
//

import SwiftUI

struct Home: View {
  
  @State var selectedIndex = 0
  
  @State var presented = false
  
  @StateObject var getViewModel = GET()
  
  var body: some View {
    
    ZStack{
      
      Spacer() // 글쓰기 화면
        .fullScreenCover(isPresented: $presented){
          WriteView(
            presented: $presented) {
              
            switch selectedIndex {
            case 0:
                getViewModel.feedFetch(kind: "diary")
//            case 1:
//
//            case 3:
//
            default:
              //
              break
            }
          }
        } // 글쓰기 화면
      
      switch selectedIndex {
      case 0:
        DiarySlide(viewModel: Binding(get: { getViewModel }, set: { _ in })){
          getViewModel.feedFetch(kind: "diary")
        }
      case 1:
        NewHomeSlide()
      case 3:
        MapBottomView()
      default:
        UserView()
      }
      
      VStack {
        Spacer()
        bottomBar
      }
      
    }// Z
  }
  
  let icons = [
    "globe.asia.australia.fill",
    "house",
    "square.and.pencil",
    "mappin.and.ellipse",
    "person.fill"
  ]
  
  var bottomBar: some View {
    ZStack {// 하단바
      Capsule()
        .fill(Color.white)
        .frame(width: 370, height: 80)
      
      HStack{
        ForEach(0..<5, id: \.self){ number in
          Button(action: {
            if number == 2 {
              presented.toggle()
            } else {
              self.selectedIndex = number
            }
            
          }, label: {
            if number == 2 {
              ZStack{
                Circle()
                  .fill(.white)
                  .frame(width: 90)
                  .padding(11)
                  .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                Image(systemName: icons[number])
                
                  .font(.system(size: 30,
                                weight: .bold,
                                design: .default))
                  .foregroundColor(.black)
              }
              
            } else {
              Image(systemName: icons[number])
                .font(.system(size: 25,
                              weight: .bold,
                              design: .default))
                .foregroundColor(selectedIndex == number ? .black : Color(UIColor.lightGray))
                .frame(width: 50,height: 70)
            }
          })
        }
      }// H
    }// Z
    .cornerRadius(60)
    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 3, y: 3)
    .padding(.bottom,-30)
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}

