package com.example.chatApp.service;


import com.example.chatApp.api_setting.ApiRespone;
import com.example.chatApp.model.repo.LinkUserRepo;
import com.example.chatApp.model.respone.ListFriendRespone;
import jakarta.persistence.Tuple;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class HomeServiece {
    @Autowired
    LinkUserRepo linkUserRepo;


    public ApiRespone<List<ListFriendRespone>> getListFriend(String idUser_,String name_){
        List<Tuple> tuplesUserFriend_ = linkUserRepo.getLinkUserByIdUser(idUser_,name_);

        List<ListFriendRespone> listFriendRespones = tuplesUserFriend_.stream().map(t->new ListFriendRespone(
                t.get("idLinkUser_",String.class),
                t.get("nameFriend_",String.class)
        )).collect(Collectors.toList());

        return ApiRespone.<List<ListFriendRespone>>builder()
                .respone_(200)
                .desription_("Request ok")
                .result_(listFriendRespones)
                .build();
    }

}
