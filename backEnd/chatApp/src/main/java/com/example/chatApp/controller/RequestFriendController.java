package com.example.chatApp.controller;

import com.example.chatApp.api_setting.ApiRespone;
import com.example.chatApp.model.request.CreateFriendRequest;
import com.example.chatApp.model.respone.CreateBlogRespone;
import com.example.chatApp.model.respone.UserRespone;
import com.example.chatApp.service.RequestFriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("${rootApi.url}")
@RestController
public class RequestFriendController {

    @Autowired
    RequestFriendService requestFriendService;

    @GetMapping("/send_request_friend")
    public ApiRespone<List<UserRespone>> getUser(@RequestParam(name = "name_") String name_,
                                                 @RequestParam(name = "id_user") String idUser_){

        return requestFriendService.getUser(name_,idUser_);
    }

    @PostMapping("/send_request_friend")
    public ApiRespone<CreateBlogRespone> createRequestFriend(@RequestBody CreateFriendRequest createFriendRequest){

        return requestFriendService.createFriendRequest(createFriendRequest);
    }

}
