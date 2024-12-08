package com.example.chatApp.controller;


import com.example.chatApp.api_setting.ApiRespone;
import com.example.chatApp.model.respone.ListFriendRespone;
import com.example.chatApp.service.HomeServiece;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("${rootApi.url}")
public class HomeController {
    @Autowired
    HomeServiece homeServiece;

    @GetMapping("/friends")
    public ApiRespone<ListFriendRespone> getListFriend(@RequestParam(name = "id_user",required = false) String idUser,
                                                       @RequestParam(name = "name",required = false) String name){

        return homeServiece.getListFriend(idUser,name);
    }

    @GetMapping("/test")
    public String t(){

        return "homeServiece.getListFriend(idUser,name)";
    }
}
