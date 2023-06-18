package com.example.backend.repository;

import com.example.backend.community.domain.Community;
import com.example.backend.community.repository.CommunityRepository;
import com.example.backend.user.domain.User;
import com.example.backend.user.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;
import java.util.stream.IntStream;

@SpringBootTest
@Transactional
public class CommunityRepositoryTests {
    @Autowired
    CommunityRepository communityRepository;
    @Autowired
    UserRepository userRepository;

    @Test
    public void InsertTest(){
        IntStream.rangeClosed(1,10).forEach(i -> {
            Community community = Community.builder()
                    .communityWriter("Google_" + i)
                    .communityImg("catImg_" + i)
                    .communityContent("Today my cat ... " + i)
                    .communityDate(new Timestamp(System.currentTimeMillis()))
                    .communityLike(i)
                    .latitude(Integer.toString(i * 10))
                    .longitude(Integer.toString(i * 10))
                    .build();
            communityRepository.save(community);
        });
    }
}
