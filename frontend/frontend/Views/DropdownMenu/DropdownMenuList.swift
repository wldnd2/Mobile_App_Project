//
//  DropdownMenuList.swift
//  DropdownMenu
//
//  Created by Abdelrahman Talaat on 28/11/2022.
//

import SwiftUI

struct DropdownMenuList: View {
  /// The drop-down menu list options
  let options: [DropdownMenuOption]
  
  /// An action called when user select an action.
  let onSelectedAction: (_ option: DropdownMenuOption) -> Void
  
  var body: some View {
    ScrollView {
      LazyVStack(alignment: .leading, spacing: 2) {
        ForEach(options) { option in
          VStack {
            DropdownMenuListRow(option: option, onSelectedAction: self.onSelectedAction)
            Divider()
          }
        }
      }
    }
    // Check first if number of options * 32 (Option height - CONSTANT - YOU
    // MAY CHANGE IT) is greater than 300 (MAX HEIGHT - ALSO, YOU MAY CHANGE
    // IT), if true, then make it options list scroll, if not set frame only
    // for available options.
    .frame(height: CGFloat(self.options.count * 39) > 400
           ? 400
           : CGFloat(self.options.count * 39)
    )
    .padding(.vertical, 6)
    .background {
      RoundedRectangle(cornerRadius: 20)
        .fill(Color(UIColor.lightGray))
    }
  }
}


struct DropdownMenuList_Previews: PreviewProvider {
    static var previews: some View {
      DropdownMenuList(options: DropdownMenuOption.selectCatMoods, onSelectedAction: { _ in })
    }
}
