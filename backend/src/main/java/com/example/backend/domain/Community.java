package com.example.backend.domain;

import lombok.*;
import org.springframework.data.relational.core.mapping.Table;

import javax.persistence.*;
import java.sql.Timestamp;

@ToString
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;
}
