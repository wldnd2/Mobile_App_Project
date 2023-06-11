//
//  DropdownMenuOption.swift
//  DropdownMenu
//
//  Created by Abdelrahman Talaat on 28/11/2022.
//

import Foundation

// We are going to use this type with ForEach, so we need to conform it to
// Hashable protocol.
struct DropdownMenuOption: Identifiable, Hashable {
  let id = UUID().uuidString
  let option: [String: Int]
  
  var displayText: String {
      return option.keys.first ?? ""
  }
  var key: Int {
    return option.values.first ?? 0
  }
}

extension DropdownMenuOption {
  static private let catMoodList: [[String: Int]] = [
    ["😻": 0],
    ["😽": 1],
    ["😾": 2],
    ["😸": 3],
    ["😿": 4]
  ]
	static let singleCatMood: DropdownMenuOption = DropdownMenuOption(option: catMoodList[0])
  static let selectCatMoods: [DropdownMenuOption] = [
    DropdownMenuOption(option: catMoodList[0]),
    DropdownMenuOption(option: catMoodList[1]),
    DropdownMenuOption(option: catMoodList[2]),
    DropdownMenuOption(option: catMoodList[3]),
    DropdownMenuOption(option: catMoodList[4])
  ]
}
