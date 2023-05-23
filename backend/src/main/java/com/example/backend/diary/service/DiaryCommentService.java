package com.example.backend.diary.service;

import com.example.backend.board.domain.Board;
import com.example.backend.board.domain.BoardComment;
import com.example.backend.board.repository.BoardCommentRepository;
import com.example.backend.board.repository.BoardRepository;
import com.example.backend.diary.domain.Diary;
import com.example.backend.diary.domain.DiaryComment;
import com.example.backend.diary.repository.DiaryCommentRepository;
import com.example.backend.diary.repository.DiaryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

@Service
public class DiaryCommentService {
    @Autowired
    DiaryCommentRepository diaryCommentRepository;
    @Autowired
    DiaryRepository diaryRepository;

    public List<DiaryComment> showComment(String id) {
        return diaryCommentRepository.showDiaryCommentPara(id);
    }

    public DiaryComment createComment(Long id, DiaryComment diaryComment){
        Optional<Diary> diaryResult = diaryRepository.findById(id);
        if(diaryResult.isPresent()) {
            DiaryComment comment = DiaryComment.builder()
                    .commentWriter(diaryComment.getCommentWriter())
                    .commentContent(diaryComment.getCommentContent())
                    .commentDate(new Timestamp(System.currentTimeMillis()))
                    .diary(diaryResult.get())
                    .build();
            return diaryCommentRepository.save(comment);
        }
        return null;
    }
}
