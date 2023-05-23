package com.example.backend.diary.domain;

import com.example.backend.user.domain.User;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;
import org.springframework.data.relational.core.mapping.Table;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "TEST_DB")
@Entity
public class Diary {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long diaryId;

    @Column(nullable = false)
    private String diaryWriter;

    @Column(length = 200, nullable = false)
    private String diaryTitle;

    @Column(length = 200, nullable = false)
    private String diaryImg;

    @Column(nullable = false)
    private String diaryContent;

    @Column(nullable = false)
    private Integer diaryLike;

    @Column(nullable = false)
    private Timestamp diaryDate;

    @Column(nullable = false)
    private Integer diaryemotion;

    public void setDiaryWriter(String diaryWriter){
        this.diaryWriter = diaryWriter;
    }

    public void setDiaryTitle(String diaryTitle){
        this.diaryTitle = diaryTitle;
    }

    public void setDiaryImg(String diaryImg){
        this.diaryImg = diaryImg;
    }
    public void setDiaryContent(String diaryContent){
        this.diaryContent = diaryContent;
    }
    public void setDiaryLike(Integer diaryLike){
        this.diaryLike = diaryLike;
    }

    public void setDiaryDate(Timestamp diaryDate) {
        this.diaryDate = diaryDate;
    }

    public void increase() { this.diaryLike++; }

    public void decrease() {
        this.diaryLike--;
    }

    public void setEmotion(Integer diaryemotion){
        this.diaryemotion = diaryemotion;
    }

    // FK
    @Builder.Default
    @OneToMany(mappedBy = "diary", cascade = CascadeType.REMOVE, orphanRemoval = true)
    @JsonManagedReference
    private List<DiaryComment> diaryComment = new ArrayList<>();
}
