package com.example.chatApp.service;

import com.example.chatApp.api_setting.ApiRespone;
import com.example.chatApp.err.CustomRuntimeEception;
import com.example.chatApp.model.entity.FriendRequestEntity;
import com.example.chatApp.model.repo.FriendrequestRepo;
import com.example.chatApp.model.repo.UserRepo;
import com.example.chatApp.model.request.CreateFriendRequest;
import com.example.chatApp.model.respone.CreateBlogRespone;
import com.example.chatApp.model.respone.UserRespone;
import jakarta.persistence.Tuple;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class RequestFriendService {
    @Autowired
    FriendrequestRepo friendrequestRepo;
    @Autowired
    UserRepo userRepo;

    public ApiRespone<List<UserRespone>> getUser(String name_,String idUser_){
        List<Tuple> tuplesUser_ = userRepo.getUserByName(name_,idUser_);

        if(tuplesUser_==null){throw new RuntimeException(CustomRuntimeEception.builder().desriptionErr_("Không tìm thấy người dùng.").build());}

        List<UserRespone> userRespones = tuplesUser_.stream().map(t-> new UserRespone(
                t.get("id_",String.class),
                t.get("id_",String.class)
        )).collect(Collectors.toList());

        return ApiRespone.<List<UserRespone>>builder()
                .respone_(200)
                .desription_("Request ok")
                .result_(userRespones)
                .build();
    }


    public ApiRespone<CreateBlogRespone> createFriendRequest(CreateFriendRequest createFriendRequest){
        FriendRequestEntity friendRequestEntity = FriendRequestEntity.builder()
                .idUser_(createFriendRequest.getIdUser_())
                .idUserFriend_(createFriendRequest.getIdUserFriend_())
                .statusDelete_(1)
                .build();
        try {
            friendrequestRepo.save(friendRequestEntity);

            return ApiRespone.<CreateBlogRespone>builder()
                    .respone_(200)
                    .desription_("Request ok")
                    .result_(CreateBlogRespone.builder().checkCreate_(true).desription_("Đã gửi lời mời kết bạn.").build())
                    .build();
        } catch (RuntimeException e) {
            throw new RuntimeException(CustomRuntimeEception.builder()
                    .desriptionErr_("Lỗi hệ thống.")
                    .build());
        }

    }
}
