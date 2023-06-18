package com.example.backend.oauth.controller;

import com.example.backend.oauth.service.LoginService;
import com.example.backend.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin("*")
public class LoginController {
    @Autowired
    LoginService loginService;

    @RequestMapping(value="/api/v1/oauth2/google", method = RequestMethod.POST)
    public String loginUrlGoogle(){
        return loginService.loginUrl();
    }

    // Oauth2를 통해서 사용자의 이름과 이메일 받음
    @RequestMapping(value="/api/v1/oauth2/google", method = RequestMethod.GET)
    public User loginGoogle(@RequestParam(value = "code") String authCode){//이거 변경?
        return loginService.getGoogleEmail(authCode);
    }
}

