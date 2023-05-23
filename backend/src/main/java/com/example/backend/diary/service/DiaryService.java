package com.example.backend.diary.service;

import com.example.backend.board.domain.Board;
import com.example.backend.diary.domain.Diary;
import com.example.backend.diary.repository.DiaryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class DiaryService {
    @Autowired
    DiaryRepository diaryRepository;

    public List<Diary> showAll(){
        return diaryRepository.findAll();
    }

    public List<Diary> showUserDiary(String writer){
        return diaryRepository.showUserDiaryPara(writer);
    }

    public Diary createDiary(Diary diary) {
        Diary newDiary = Diary.builder()
                .diaryWriter(diary.getDiaryWriter())
                .diaryTitle(diary.getDiaryTitle())
                .diaryContent(diary.getDiaryContent())
                .diaryImg(diary.getDiaryImg())
                .diaryDate(new Timestamp(System.currentTimeMillis()))
                .diaryLike(0)
                .diaryemotion(0)
                .build();
        return diaryRepository.save(newDiary);
    }

}
