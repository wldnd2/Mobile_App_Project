package com.example.backend.community.service;

import com.example.backend.board.domain.Board;
import com.example.backend.community.domain.Community;
import com.example.backend.community.repository.CommunityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.sql.Timestamp;
import java.util.List;

@Service
public class CommunityService {
    @Autowired
    CommunityRepository communityRepository;

    public List<Community> showAllCommunity() { return communityRepository.findAll();}

    public List<Community> showSortList() { return communityRepository.findAllOrderByCommunityLike();}
    public List<Community> showUserDiary(String writer) {
        return communityRepository.showUserCommunityPara(writer);
    }

    public Community createCommunity(Community community) {
        Community newCommunity = Community.builder()
                .communityWriter(community.getCommunityWriter())
                .communityImg(community.getCommunityImg())
                .communityContent(community.getCommunityContent())
                .communityDate(new Timestamp(System.currentTimeMillis()))
                .communityLike(0)
                .latitude(community.getLatitude())
                .longitude(community.getLongitude())
                .build();
        return communityRepository.save(newCommunity);
    }

    public Community increment(Long id) {
        Community existingCommunity = communityRepository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        existingCommunity.increaseLike();
        return communityRepository.save(existingCommunity);
    }

    public Community decrement(Long id) {
        Community existingCommunity = communityRepository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        existingCommunity.decreaseLike();
        return communityRepository.save(existingCommunity);
    }

}

