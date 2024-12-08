package com.example.chatApp.controller;


import com.example.chatApp.api_setting.ApiRespone;
import com.example.chatApp.model.request.UpdateUserRequest;
import com.example.chatApp.model.respone.UpdateUserRespone;
import com.example.chatApp.model.respone.UserDetailProfileRespone;
import com.example.chatApp.model.respone.UserProfileMyBlogRespone;
import com.example.chatApp.service.UserProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("${rootApi.url}")
public class UserProfileController {
    @Autowired
    UserProfileService userProfileService;

    @RequestMapping("/user/{id_user}")
    public ApiRespone<UserDetailProfileRespone> getDetailUser(@PathVariable(name = "id_user") String idUser_){

        return userProfileService.getUserDetailProfile(idUser_);
    }

    @PutMapping("/user")
    public ApiRespone<UpdateUserRespone> updateUser(@RequestBody UpdateUserRequest updateUserRequest){

        return userProfileService.updateUser(updateUserRequest);
    }

    @RequestMapping("/my_blog/{id_user}")
    public ApiRespone<List<UserProfileMyBlogRespone>> getMyBlog(@PathVariable(name = "id_user") String idUser_){

        return userProfileService.getMyBlog(idUser_);
    }

}
