//
//  ToggleView.swift
//  frontend
//
//  Created by 노유수 on 2023/05/06.
//

import SwiftUI

struct ToggleView: View {
    @Binding var selectedToggle: Int
    let toggleTexts: [String]
    
    var body: some View {
        HStack {
          Spacer()
            ForEach(0..<3) { index in
                Toggle(isOn: Binding(
                    get: { selectedToggle == index },
                    set: { _ in selectedToggle = index }
                )) {
                    Text(toggleTexts[index])
                }
                .toggleStyle(ToggleButtonStyle())
                
                if index < toggleTexts.count - 1 {
                    Spacer()
                    Spacer()
                }
            }
          Spacer()
        }// H
        .padding(.vertical,10)
        .padding(.bottom,20)
    }
}

struct ToggleButtonStyle: ToggleStyle {
  
  let customShadow = Color.black.opacity(0.2)
  
  func makeBody(configuration: Configuration) -> some View {
    ZStack {
      HStack {
        Image(systemName: "circle.fill")
          .foregroundColor(configuration.isOn ? .black : Color(UIColor.lightGray))
          .background(
            ZStack{
              Capsule()
                .fill(.white)
                .frame(width: 110, height: 40)
                .padding(.leading, 70)
                .shadow(color: customShadow, radius: 5, x: 0, y: 5)
              Circle()
                .fill(Color(UIColor.lightGray))
                .frame(width: 25)
            }
          )
          .tint(.black)
          .buttonStyle(BorderlessButtonStyle())
      
        configuration.label
      }
      .onTapGesture {
        if !configuration.isOn {
          configuration.isOn.toggle()
        }
      }
    }
  }
}

struct ToggleView_Previews: PreviewProvider {
  @State static var selectedToggle = 0
  static var previews: some View {
    ToggleView(selectedToggle: $selectedToggle, toggleTexts: ["다이어리", "   분양    ", " 길냥이   "])
  }
}
