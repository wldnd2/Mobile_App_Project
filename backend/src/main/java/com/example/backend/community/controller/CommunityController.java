package com.example.backend.community.controller;

import com.example.backend.community.domain.Community;
import com.example.backend.community.service.CommunityService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {
    @Autowired
    CommunityService communityService;

    @GetMapping("/list")
    public List<Community> showCommunity() {return communityService.showAllCommunity();}

    @GetMapping("user")
    public List<Community> showUserCommunity(@RequestParam(value = "writer") String writer) { return communityService.showUserDiary(writer); }


    @PostMapping("/create")
    public Community createDiary(@RequestBody Community community) {
        return communityService.createCommunity(community);
    }


    @PutMapping("/increase/{id}")
    public Community increment(@PathVariable Long id) {
        return communityService.increment(id);
    }

    @PutMapping("/decrease/{id}")
    public Community decrement(@PathVariable Long id) { return communityService.decrement(id); }

}

