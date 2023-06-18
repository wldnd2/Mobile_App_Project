package com.example.backend.diary.service;

import com.example.backend.board.domain.Board;
import com.example.backend.diary.domain.Diary;
import com.example.backend.diary.repository.DiaryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.sql.Timestamp;
import java.util.List;

@Service
public class DiaryService {
    @Autowired
    DiaryRepository diaryRepository;

    public List<Diary> showAll(){
        return diaryRepository.findAll();
    }

    public List<Diary> showSortList() { return diaryRepository.findAllOrderByDiaryLike();}

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
                .diaryemotion(diary.getDiaryemotion())
                .build();
        return diaryRepository.save(newDiary);
    }

    public Diary updateDiary(Long id, Diary diary) {
        Diary existingDiary = diaryRepository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        existingDiary.setDiaryWriter(diary.getDiaryWriter());
        existingDiary.setDiaryTitle(diary.getDiaryTitle());
        existingDiary.setDiaryContent(diary.getDiaryContent());
        existingDiary.setDiaryImg(diary.getDiaryImg());
        existingDiary.setDiaryLike(existingDiary.getDiaryLike());
        existingDiary.setDiaryDate(existingDiary.getDiaryDate());
        existingDiary.setEmotion(existingDiary.getDiaryemotion());
        return diaryRepository.save(existingDiary);
    }

    public void deleteDiary(Long id) {
        diaryRepository.deleteById(id);
    }
    public Diary increment(Long id) {
        Diary existingDiary = diaryRepository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        existingDiary.increase();
        return diaryRepository.save(existingDiary);
    }

    public Diary decrement(Long id) {
        Diary existingDiary = diaryRepository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        existingDiary.decrease();
        return diaryRepository.save(existingDiary);
    }

}
