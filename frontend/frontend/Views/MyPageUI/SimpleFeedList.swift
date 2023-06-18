//
//  SimpleFeedList.swift
//  frontend
//
//  Created by 노유수 on 2023/05/18.
//

import SwiftUI

struct SimpleFeedList: View {
  @State private var showMyFeedSlide = false
  @Binding var viewModel: GET
  
  var kind: String
  var name: String {
    if kind == "board"{
      return "나의 분양"
    }else if kind == "diary"{
      return "나의 다이어리"
    }else if kind == "community"{
      return "나의 길냥이"
    }else{return ""}
  }
  
  var myBoards: [Board] {
      viewModel.myBoards
  }
  var myDiarys: [Diary] {
      viewModel.myDiarys
  }
//  var myCommunitys: [MapBoard] {
//      viewModel.mapBoards
//  }
  
  var completion: () -> Void
  
  var body: some View {
    VStack {
      
      GeometryReader{proxy in
        HStack{
          // 나의 다이어리, +
          
          Spacer()
          Spacer()
          
          listName
          
          
          Spacer()
            .frame(width: proxy.size.width)
          
          
          topPlusButton
          
          Spacer()
          Spacer()
          
        }// H
      }
      
      ScrollView(.horizontal,showsIndicators: false){
        //작은사진 여러개 + 더보기+버튼
        
        simpleList
        
      }//ScrollView
      .frame(height: 200)
      
    }// V
    .padding(.top,10)
    .background(
      NavigationLink(
        destination:
          MyFeedSlide(
          kind: kind,
          viewModel: $viewModel,
          completion: { completion() }
          ),
        isActive: $showMyFeedSlide,
        label: {
          EmptyView()
        }
      )
      .hidden()
    )
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
    NavigationLink(destination: MyFeedSlide(kind: kind, viewModel: $viewModel, completion: { completion() }
    )) {
      HStack {
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
      .onTapGesture {
        showMyFeedSlide = true
      }
          
  }
  var simpleList: some View {
    var feed_show_last: Int
    
    var myFeeds:[Any] = []
    if kind == "diary"{
      myFeeds = myDiarys
    }else if kind == "board"{
      myFeeds = myBoards
    }else if kind == "community"{
      // 길냥이,,,
    }
    
    if myFeeds.count > 4 {
      feed_show_last = myFeeds.count - 4
    } else {
      feed_show_last = 0
    }
    
    return HStack{
      Spacer()
      Spacer()

      if myFeeds.count != 0 {
        //ForEach문으로 구현.,,,
        ForEach((feed_show_last..<myFeeds.count).reversed(), id: \.self) { index in
            let feed = myFeeds[index]
            
          SimpleFeed(
            kind: "board",
            feed: feed
          )
        }
        
        if myFeeds.count > 2{
          VStack {
            Spacer()
            Spacer()
            
            plusButton
            
            Spacer()
            Spacer()
            Spacer()
          }
          .padding(.leading)
        }
      }else{
        Text("피드가 없습니다..")
          .font(.largeTitle)
          .fontWeight(.bold)
          .foregroundColor(Color(UIColor.lightGray))
          .padding(.leading,70)
      }

      
      Spacer()
      Spacer()
    }// H
  }
}

struct SimpleFeedList_Previews: PreviewProvider {
    static var previews: some View {
      SimpleFeedList(viewModel: .constant(GET()),kind: "board"){}
    }
}
