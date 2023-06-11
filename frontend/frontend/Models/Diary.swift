//
//  Diary.swift
//  frontend
//
//  Created by 노유수 on 2023/05/24.
//

import Foundation



struct Diary: Hashable, Codable{
  var diaryId: Int
  let diaryWriter: String
  var diaryTitle: String
  var diaryImg: String
  var diaryContent: String
  var diaryLike: Int
  let diaryDate: String
  var diaryemotion: Int
}


let exampleDiary = Diary(diaryId: 999, diaryWriter: "아이디", diaryTitle: "다이어리 타이틀,,?", diaryImg: "고양이4L", diaryContent: "뭘보냥 냥이둥절 귀여워ㅠㅜㅠㅜㅠㅜ", diaryLike: 99, diaryDate: ",,,날짜,,,", diaryemotion: 3)
