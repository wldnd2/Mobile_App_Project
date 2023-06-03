//
//  HeartButton.swift
//  frontend
//
//  Created by 노유수 on 2023/05/24.
//

import SwiftUI

struct HeartButton: View{
  
  @Binding var isIndex: Int
  @Binding var isLiked : Bool
  @Binding var count : Int
  
  var kind : String
  @Binding var id : Int
  
  var completion: () -> Void
  
  private let animationDuration: Double = 0.1
  private var animationScale: CGFloat {
    isLiked ? 0.7 : 1.3
  }
  @State private var animate = false
  
  var body: some View{
    Button( action: {
      if isLiked == false {
        self.count += 1
        SendAPI.likePUT(kind: self.kind, how: "increase", ID: id, index: isIndex){
          completion()
        }
        print("좋아요 증가!")
      } else {
        self.count -= 1
        SendAPI.likePUT(kind: self.kind, how: "decrease", ID: id, index: isIndex){
          completion()
        }
        print("좋아요 감소!")
      }
      
      self.isLiked.toggle()
      self.animate = true
      
      DispatchQueue.main.asyncAfter(deadline:.now() + self.animationDuration, execute: {
            self.animate = false
          })
    }) {
      Image(systemName: isLiked ? "heart.fill" : "heart")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 20,height: 20)
        .foregroundColor(isLiked ? .red: .gray)
      Text("\(count)")
        .font(.footnote)
        .foregroundColor(.primary)
    }
    .scaleEffect(animate ? animationScale : 1)
    .onChange(of: animate) { _ in
      withAnimation(.easeIn(duration: animationDuration)) {
        animate = false
      }
    }
  }
}

struct DiaryHeartButton_Previews: PreviewProvider {
    static var previews: some View {
      HeartButton(isIndex: .constant(99), isLiked: .constant(false), count: .constant(99), kind: "diary", id: .constant(99), completion: {})
    }
}

