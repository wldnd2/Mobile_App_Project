//
//  HeaderView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/08.
//

import SwiftUI

struct NewHomeHeaderView: View {
  
  @State private var tag:Int? = nil
  
    var body: some View {
      HStack{
        
        MoveButton()
        Text("분양게시판")
          .font(.title)
          .bold()
        Spacer()
        ButtonDesign()
        
      }.frame(width: 405, height: 50)
      .padding(.horizontal, 20)
    }
}

struct MoveButton: View{
  var body: some View{
    
    Button(action: { }) {
      Image(systemName: "chevron.left")
        .resizable()
        .frame(width: 15, height: 20)
        .scaledToFit()
        .padding(.leading, 15)
        .padding([.trailing, .vertical], 10)

      }.foregroundColor(.black)
  }
    
}


struct ButtonDesign: View{
  @State private var selection: String? = "최신"
  
  var body: some View{
    ZStack {
                Capsule()
                    .fill(Color.white)
                    .frame(width: 150, height: 45)
                    .modifier(InnerShadowModifier())

               /* Rectangle()
                    .fill(Color.white)
                    .frame(width: 2, height: 44)
*/
                HStack {
                    Button(action: { selection = "최신" }) {
                        Text("최신")
                        .foregroundColor(.black)
                            .padding(.horizontal)
                            .background(
                                Capsule()
                                  .fill(selection == "최신" ? Color.clear : .white)
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
                                  .foregroundColor(selection == "인기" ? Color("Clear") : .white)
                                  .frame(width:75, height: 40)
                                    //.shadow(radius: selection == "인기" ? 5 : 0)
                          )
                                
                  }
                  .buttonStyle(BorderlessButtonStyle())
              }
              .padding(.horizontal)
          }
        
        
        /*
        Capsule()
          .frame(width: 100, height: 50)
          .overlay(
            Capsule()
              .frame(width: 99, height: 48)
              .foregroundColor(.white)
              .modifier(InnerShadowModifier())
          ).overlay(
            Capsule()
              .frame(width:99, height: 50)
              .foregroundColor(.purple)
              .clipShape(Capsule())
            )
        */
        /*
        Capsule()
          .fill(.white)
          .frame(width: 50, height: 30)
          .cornerRadius(10)
          .padding()
          .modifier(ShadowModifier())
          
        
        Capsule()
          .fill(.white)
          .frame(width: 50, height: 30)
          .cornerRadius(10)
          .padding()
          .modifier(InnerShadowModifier())
        */
      } // H
      
    }// Z
    


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

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NewHomeHeaderView()
    }
}


