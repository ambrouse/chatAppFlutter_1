package com.example.chatApp.controller;


import com.example.chatApp.api_setting.ApiRespone;
import com.example.chatApp.model.request.LoginRequest;
import com.example.chatApp.model.request.SigupRequest;
import com.example.chatApp.model.respone.LoginSigupRespone;
import com.example.chatApp.service.LoginSigupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("${rootApi.url}")
public class LoginSigupController {

    @Autowired
    LoginSigupService loginSigupService;


    @GetMapping("/login")
    public ApiRespone<LoginSigupRespone> login(@RequestBody LoginRequest loginRequest){

        return loginSigupService.login(loginRequest);
    }

    @PostMapping("/sigup")
    public ApiRespone<LoginSigupRespone> sgup(@RequestBody SigupRequest sigupRequest){

        return loginSigupService.sigup(sigupRequest);
    }
}
