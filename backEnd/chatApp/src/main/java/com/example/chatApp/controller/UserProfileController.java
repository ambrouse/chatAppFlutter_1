package com.example.chatApp.controller;


import com.example.chatApp.api_setting.ApiRespone;
import com.example.chatApp.model.request.ApplyRequestFriendRequest;
import com.example.chatApp.model.request.UpdateBlogRequest;
import com.example.chatApp.model.request.UpdateUserRequest;
import com.example.chatApp.model.respone.*;
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


    @RequestMapping("/my_blog_detail/{id_blog}")
    public ApiRespone<UserProfileMyBlogDetailRespone> getMyBlogDetail(@PathVariable(name = "id_blog") String idBlog_){

        return userProfileService.getMyBlogDetail(idBlog_);
    }

    @PutMapping("/my_blog_detail")
    public ApiRespone<UpdateBlogRespone> updateMyBlog(@RequestBody UpdateBlogRequest updateBlogRequest){

        return userProfileService.updateBlog(updateBlogRequest);
    }

    @DeleteMapping("/my_blog_detail/{id_blog}")
    public ApiRespone<DeleteMyBlog> updateMyBlog(@PathVariable(name = "id_blog") String idBlog){

        return userProfileService.deleteBlog(idBlog);
    }

    @RequestMapping("/request_friend/{id_user}")
    public ApiRespone<List<ListRequestFriendRespone>> getRequestFriend(@PathVariable(name = "id_user") String idUser){

        return userProfileService.getRequestFriend(idUser);
    }

    @PostMapping("/request_friend")
    public ApiRespone<ApplyRequestfriendRespone> applyRequestFriend(@RequestBody ApplyRequestFriendRequest applyRequestFriendRequest){

        return userProfileService.applyRequestFriend(applyRequestFriendRequest);
    }

    @DeleteMapping("/request_friend/{id_request_friend}")
    public ApiRespone<ApplyRequestfriendRespone> deleteRequestFriend(@PathVariable(name = "id_request_friend") String idRequestFriend){

        return userProfileService.deleteRequestFriend(idRequestFriend);
    }



}
