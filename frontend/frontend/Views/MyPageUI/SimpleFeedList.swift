//
//  SimpleFeedList.swift
//  frontend
//
//  Created by 노유수 on 2023/05/18.
//

import SwiftUI

struct SimpleFeedList: View {
  var name: String
  
    var body: some View {
      VStack {
        
        HStack{
          // 나의 다이어리, +
          
          Spacer()
          Spacer()
          
          listName
          
          Spacer().frame(width: .infinity)
          
          topPlusButton
          
          Spacer()
          Spacer()
          
        }// H
        
        ScrollView(.horizontal,showsIndicators: false){
          //작은사진 여러개 + 더보기+버튼
          
          HStack{
            Spacer()
            Spacer()
            
            SimpleFeed()
            SimpleFeed()
            SimpleFeed()
            SimpleFeed()
            //ForEach문으로 구현.,,,
            
            VStack {
              Spacer()
              Spacer()
              
              plusButton
              
              Spacer()
              Spacer()
              Spacer()
            }
            .padding(.leading)
            
            Spacer()
            Spacer()
          }// H

          
          
        }//ScrollView
        .frame(height: 200)
        
      }// V
      .padding(.top,10)
    }
}

private extension SimpleFeedList {
  
  var listName: some View {
    Text(name)
      .font(.title2)
      .fontWeight(.black)
      .padding(.vertical,5)
  }
  
  var topPlusButton: some View {
    Button(action: {
      //action
    }) {
      HStack{
        Image(systemName: "plus")
        Text("더보기")
      }
    }
  }
  
  var plusButton: some View {
    Image(systemName: "plus")
      .font(.largeTitle)
      .frame(width: 100, height: 100)
      .frame(maxWidth: .infinity)
      .background(Color(UIColor.lightGray))
      .cornerRadius(100)
    .shadow(radius: 5)
  }
  
}

struct SimpleFeedList_Previews: PreviewProvider {
    static var previews: some View {
        SimpleFeedList(name: "리스트 제목")
    }
}
