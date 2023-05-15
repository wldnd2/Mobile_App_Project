//
//  MapKittenTabView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/10.
//

import SwiftUI

struct MapKittenTabView: View {
  @State private var isLiked = false
  @State private var count: Int = 263
  //let image = Image(uiImage: UIImage(named: "고양이3L")!)
  
  var body: some View{
    HStack(alignment: .top, spacing: 10){
    
      //image
      Image("고양이3L")
        .resizable()
        .scaledToFill()
        .frame(width: 110, height: 110)
        .clipShape(RoundedRectangle(cornerRadius: 15))
      
      VStack(alignment: .leading){
        
        Text("냥이가 저를 쳐다봐요 운명인 것 같아요!!")
            .font(.footnote)
            .bold()
        
        Spacer()
        
        LikesComments
      }
      .frame(width: 480, height: 100)
      .padding(.top,10)
      
      
      
    }.frame(width: 500, height: 100)
      .padding(.trailing, 50)
  }
  
}

private extension MapKittenTabView {
  
  var LikesComments: some View{
    HStack{
        HeartButton(isLiked: $isLiked, count:$count)
      
        Image(systemName: "text.bubble")
          .resizable()
          .frame(width: 20, height: 20)
          
          Text("32")
            .font(.footnote)
          
        }.padding(.bottom, 10)
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
      }
      else {
              self.count -= 1
            }
              
      self.isLiked.toggle()
      self.animate = true
            
      DispatchQueue.main.asyncAfter(deadline:.now() + self.animationDuration, execute: {
              self.animate = false
              
            })
      }, label: {
          Image(systemName: isLiked ? "heart.fill" : "heart")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 18)
            .foregroundColor(isLiked ? .red: .gray)
          
          Text(" \(count) ")
            .font(.footnote)
            .foregroundColor(.black)
          })
          .scaleEffect(animate ? animationScale : 1)
          .animation(.easeIn(duration: animationDuration))
        }
      }


struct MapKittenTabView_Previews: PreviewProvider {
    static var previews: some View {
        MapKittenTabView()
    }
}
