package com.example.backend.community.domain;

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
public class Community {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long communityId;

    @Column(nullable = false)
    private String communityWriter;

    @Column(length = 200, nullable = false)
    private String communityImg;

    @Column(nullable = false)
    private String communityContent;

    @Column(nullable = false)
    private Timestamp communityDate;

    @Column(nullable = false)
    private Integer communityLike;

    @Column(nullable = false)
    private String latitude;

    @Column(nullable = false)
    private String longitude;

    public void increaseLike() { this.communityLike++; }

    public void decreaseLike() {
        this.communityLike--;
    }
}
