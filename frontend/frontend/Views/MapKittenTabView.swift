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
        .padding(.leading, 10)
        .padding(.trailing, 5)
      
      
        VStack(alignment: .leading){
            Text("냥이가 저를 쳐다봐요 운명인 것 같아요!!")
                //.font(.footnote)
                .font(.system(size: 15, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)

            
            Spacer()
            
            LikesComments
          
        }
        .frame(width: 240, height: 100)
        .padding(.top,10)
        
      
      
      
      
    }.frame(width: 500, height: 100)
      .padding(.trailing, 50)
      .padding(.bottom, 20)
      .padding(.leading, 30)
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

   

struct MapKittenTabView_Previews: PreviewProvider {
    static var previews: some View {
        MapKittenTabView()
    }
}
