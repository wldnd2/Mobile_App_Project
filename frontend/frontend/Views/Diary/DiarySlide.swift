//
//  DiarySlide.swift
//  frontend
//
//  Created by 이정민 on 2023/05/15.
//

import SwiftUI


struct DiarySlide: View {
  
  @Binding var viewModel: GET
  var completion: () -> Void
  
    var body: some View {
      VStack{
        DiaryHeaderView()
          .frame(width: 400, height: 50)
        ScrollView(){
          VStack{
            ForEach((0..<viewModel.diarys.count).reversed(), id: \.self) { index in
                let diary = viewModel.diarys[index]
                
              //diarys -> communities /
              DiarySlideView(myIndex: .constant(index), diary: diary){
                completion()
              }
                .listRowInsets(EdgeInsets())
                .padding(.bottom, index == 0 ? 80 : 0)
            }
          }
          .onAppear{
            completion()
          }
        }
      }
    }
}

struct DiarySlide_Previews: PreviewProvider {
    static var previews: some View {
      DiarySlide(viewModel: .constant(GET()), completion: {})
    }
}
