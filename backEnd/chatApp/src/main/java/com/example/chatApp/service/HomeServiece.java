package com.example.chatApp.service;


import com.example.chatApp.api_setting.ApiRespone;
import com.example.chatApp.model.repo.LinkUserRepo;
import com.example.chatApp.model.respone.ListFriendRespone;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class HomeServiece {
    @Autowired
    LinkUserRepo linkUserRepo;


    public ApiRespone<ListFriendRespone> getListFriend(String idUser_,String name_){
        System.out.println("id: "+idUser_);
        System.out.println("name: "+name_);
        return null;
    }

}
