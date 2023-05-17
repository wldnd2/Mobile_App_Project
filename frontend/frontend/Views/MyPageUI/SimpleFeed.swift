//
//  SimpleFeed.swift
//  frontend
//
//  Created by 노유수 on 2023/05/18.
//

import SwiftUI

struct SimpleFeed: View {
  
  @State private var isLiked = true
  
  var body: some View {
    
    VStack(alignment: .center) {
      
      productImage
        .frame(width: 145, height: 145)
        .clipped()
      
      productDescription
        .frame(width: 145, height: 30)
      
    }// V
    .frame(width: 145, height: 175)
    .background(Color.primary.colorInvert())
    .cornerRadius(20)
    .shadow(color: Color.primary.opacity(0.2), radius: 10,x: 10,y:10)
    .padding(.bottom,25)
    .padding(.trailing,3)
  }
}


private extension SimpleFeed {
  
  var productImage: some View {
    Image("고양이1L")
      .resizable()
      .scaledToFill()
  }

  var productDescription : some View {
    VStack(alignment:.center){
      HStack {
        Spacer()
        
        Image(systemName: isLiked ? "heart.fill" : "heart")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 20)
          .foregroundColor(isLiked ? .red: .gray)
        
        Text("999")
          .font(.subheadline)
          .fontWeight(.bold)
        
        
        Image(systemName: "text.bubble")
          .resizable()
          .frame(width: 20, height: 20)
        
        Text("999")
          .font(.subheadline)
          .fontWeight(.bold)
        
        Spacer()
      }// H
      .padding(.bottom,10)
    }// V
  }
}


struct SimpleFeed_Previews: PreviewProvider {
    static var previews: some View {
        SimpleFeed()
    }
}
