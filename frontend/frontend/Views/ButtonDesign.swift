//
//  ButtonDesign.swift
//  frontend
//
//  Created by 노유수 on 2023/06/05.
//

import SwiftUI

struct ButtonDesign: View{
  @State private var selection: String? = "최신"
  
  var body: some View{
    ZStack {
      Capsule()
        .fill(Color.white)
        .frame(width: 150, height: 45)
        .modifier(InnerShadowModifier())
      HStack {
        Button(action: { selection = "최신" }) {
          Text("최신")
          .foregroundColor(.black)
          .padding(.horizontal)
          .background(
            Capsule()
              .fill(selection == "최신" ?
                Color.clear : .white)
              .frame(width:75, height: 40)
            //.shadow(radius: selection == "최신" ? 5 : 0)
          )
        }
        .buttonStyle(BorderlessButtonStyle())
        
        Button(action: { selection = "인기" }) {
          Text("인기")
          .foregroundColor(.black)
          .padding(.horizontal)
          .background(
            Capsule()
              .foregroundColor(selection == "인기" ?
                Color("Clear") : .white)
              .frame(width:75, height: 40)
            //.shadow(radius: selection == "인기" ? 5 : 0)
          )
        }
        .buttonStyle(BorderlessButtonStyle())
      }// H
      .padding(.horizontal)
    }// Z
  }// body
  
}
    
struct ShadowModifier: ViewModifier {
  func body(content: Content) -> some View {
    content.shadow(color: Color("lightShadow"), radius: 3, x: 3, y:3)
      .shadow(color: Color("darkShadow"), radius: 3, x: -3, y:-3)
      
    
  }
}

struct InnerShadowModifier: ViewModifier {
  @State var radius: CGFloat = 10
  
  func body(content: Content) -> some View {
    content
      .overlay(
        Capsule()
          .stroke(.white, lineWidth: 2)
          .shadow(color: Color("darkShadow"), radius: 4, x: 3, y:3)
          .clipShape(Capsule())
          .shadow(color: Color("lightShadow"), radius: 4, x: -3, y:-3)
          .clipShape(Capsule())
        
      )
            
    
  }
}



struct ButtonDesign_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDesign()
    }
}
