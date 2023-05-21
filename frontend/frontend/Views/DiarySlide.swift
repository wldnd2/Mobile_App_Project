//
//  DiarySlide.swift
//  frontend
//
//  Created by 이정민 on 2023/05/15.
//

import SwiftUI

struct DiarySlide: View {

    var body: some View {
      VStack{
        DiaryHeaderView()
          .frame(width: 400, height: 50)
        ScrollView(){
          VStack{
            DiarySlideView()
            DiarySlideView()
            DiarySlideView()
          }
        }
      }
    }
}

struct DiarySlide_Previews: PreviewProvider {
    static var previews: some View {
        DiarySlide()
    }
}
