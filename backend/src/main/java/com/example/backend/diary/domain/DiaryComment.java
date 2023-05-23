package com.example.backend.diary.domain;

import com.example.backend.user.domain.User;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.springframework.data.relational.core.mapping.Table;

import javax.persistence.*;
import java.sql.Timestamp;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "TEST_DB")
@Entity
public class DiaryComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long commentId;

    @Column(nullable = false)
    private String commentWriter;

    @Column(nullable = false)
    private String commentContent;

    @Column(nullable = false)
    private Timestamp commentDate;


    // FK
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "diary_id")
    @JsonBackReference
    private Diary diary;
}

