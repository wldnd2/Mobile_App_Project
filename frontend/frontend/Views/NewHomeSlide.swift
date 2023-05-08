//
//  NewHomeSldie.swift
//  frontend
//
//  Created by 이정민 on 2023/05/08.
//

import SwiftUI

struct NewHomeSlide: View {
    var body: some View {
      VStack{
        NewHomeHeaderView ()
          .frame(width: 400, height: 50)
        ScrollView(){
          VStack{
            NewHomeSlideView()
            NewHomeSlideView()
            NewHomeSlideView()
            //ForEach(){}해서 나중에 하면 될듯
            }
        
          }
        }
      
    }
}

struct NewHomeSldie_Previews: PreviewProvider {
    static var previews: some View {
        NewHomeSlide()
    }
}
