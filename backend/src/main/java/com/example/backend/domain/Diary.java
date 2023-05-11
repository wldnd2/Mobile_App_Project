package com.example.backend.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
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

    // FK
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "diary_user_id")
    @JsonIgnore
    private User user;

    // FK
    @Builder.Default
    @OneToMany(mappedBy = "diary", cascade = CascadeType.REMOVE, orphanRemoval = true)
    @Column(nullable = true)
    private List<DiaryComment> diaryComment = new ArrayList<>();
}
