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
  
  var body: some View {
    VStack{
      
      ZStack{
        
        Spacer() // 글쓰기 화면
          .fullScreenCover(isPresented: $presented){
            Text("글쓰기 화면")
          } // 글쓰기 화면
        
        switch selectedIndex {
        case 0:
          NavigationView {
            VStack{
              Text("1 Screen")
            }
            .navigationTitle("1")
          }
        case 1:
          NavigationView {
            VStack{
              Text("2 Screen")
            }
            .navigationTitle("2")
          }
        case 3:
          NavigationView {
            VStack{
              Text("4 Screen")
            }
            .navigationTitle("4")
          }
        default:
          NavigationView {
            VStack{
              Text("5 Screen")
            }
            .navigationTitle("5")
          }
        }
        
      }// Z
      
      bottomBar
      
    }// V
  }
  
  let icons = [
    "house",
    "globe.asia.australia.fill",
    "square.and.pencil",
    "text.book.closed.fill",
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
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
