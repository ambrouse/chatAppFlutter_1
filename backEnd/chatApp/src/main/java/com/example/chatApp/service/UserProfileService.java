package com.example.chatApp.service;

import com.example.chatApp.api_setting.ApiRespone;
import com.example.chatApp.err.CustomRuntimeEception;
import com.example.chatApp.model.entity.AuthenticationEntity;
import com.example.chatApp.model.entity.UserEntity;
import com.example.chatApp.model.repo.*;
import com.example.chatApp.model.request.UpdateUserRequest;
import com.example.chatApp.model.respone.UpdateUserRespone;
import com.example.chatApp.model.respone.UserDetailProfileRespone;
import com.example.chatApp.model.respone.UserProfileMyBlogRespone;
import jakarta.persistence.Tuple;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserProfileService {

    @Autowired
    UserRepo userRepo;
    @Autowired
    BlogRepo blogRepo;
    @Autowired
    FriendrequestRepo friendrequestRepo;
    @Autowired
    AuthenticationRepo authenticationRepo;
    @Autowired
    HeartRepo heartRepo;
    @Autowired
    LikeRepo likeRepo;


    public ApiRespone<UserDetailProfileRespone> getUserDetailProfile(String id_){
        Tuple tupleUser_ = userRepo.getUserById(id_);
        System.out.println(tupleUser_);

        return ApiRespone.<UserDetailProfileRespone>builder()
                .respone_(200)
                .desription_("Request ok")
                .result_(UserDetailProfileRespone.builder()
                        .name_(tupleUser_.get(0).toString())
                        .email_(tupleUser_.get(1).toString())
                        .password_(tupleUser_.get(2).toString())
                        .age_(tupleUser_.get(3).toString())
                        .build())
                .build();
    }

    public ApiRespone<UpdateUserRespone> updateUser(UpdateUserRequest updateUserRequest){
        Tuple tupleUser_ = userRepo.getUserByIdV2(updateUserRequest.getIdUser_());

        if(tupleUser_==null){throw new RuntimeException(CustomRuntimeEception.builder()
                .desriptionErr_("Không thể cập nhật người dùng bây giờ vui lòng quay lại sau.")
                .build());}

        UserEntity userEntity = UserEntity.builder()
                .id_(tupleUser_.get(0).toString())
                .statusDelete_(1)
                .name_(updateUserRequest.getName_())
                .age_(updateUserRequest.getAge_())
                .idAuthentication_(tupleUser_.get(1).toString())
                .build();
        AuthenticationEntity authenticationEntity = AuthenticationEntity.builder()
                .id_(tupleUser_.get(1).toString())
                .email_(updateUserRequest.getEmail_())
                .statusDelete_(1)
                .password_(updateUserRequest.getPassword_())
                .build();
        try {
            userRepo.save(userEntity);
            authenticationRepo.save(authenticationEntity);
            return ApiRespone.<UpdateUserRespone>builder()
                    .respone_(200)
                    .desription_("Request ok")
                    .result_(UpdateUserRespone.builder()
                            .checkUpdate(true)
                            .desription_("Cập nhật người dùng thành công.")
                            .build())
                    .build();
        } catch (RuntimeException e) {
            throw new RuntimeException(CustomRuntimeEception.builder()
                    .desriptionErr_("Không thể cập nhật người dùng bây giờ vui lòng quay lại sau.")
                    .build());
        }
    }

    public ApiRespone<List<UserProfileMyBlogRespone>> getMyBlog(String idUser_){
        List<Tuple> tuplesMyBlog_ =  blogRepo.getMyBlog(idUser_);

        List<UserProfileMyBlogRespone> userProfileMyBlogRespone = new ArrayList<>();

        for(Tuple i : tuplesMyBlog_){
            UserProfileMyBlogRespone userProfileMyBlogRespone1 = UserProfileMyBlogRespone.builder()
                    .like_(likeRepo.countLikeMyBlog(i.get(0).toString()))
                    .heart_(heartRepo.countHeartMyBlog(i.get(0).toString()))
                    .title_(i.get("title_").toString())
                    .id_(i.get("id_").toString())
                    .content_(i.get("content_").toString())
                    .build();
            userProfileMyBlogRespone.add(userProfileMyBlogRespone1);
        }

        return ApiRespone.<List<UserProfileMyBlogRespone>>builder()
                .respone_(200)
                .desription_("Request ok")
                .result_(userProfileMyBlogRespone)
                .build();
    }

}





























