package com.example.chatApp.service;

import com.example.chatApp.api_setting.ApiRespone;
import com.example.chatApp.err.CustomRuntimeEception;
import com.example.chatApp.model.entity.*;
import com.example.chatApp.model.repo.*;
import com.example.chatApp.model.request.ApplyRequestFriendRequest;
import com.example.chatApp.model.request.UpdateBlogRequest;
import com.example.chatApp.model.request.UpdateUserRequest;
import com.example.chatApp.model.respone.*;
import jakarta.persistence.Tuple;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
    @Autowired
    LinkUserRepo linkUserRepo;


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
                        .linkImg_(tupleUser_.get(4).toString())
                        .build())
                .build();
    }

    public ApiRespone<UpdateUserRespone> updateUser(UpdateUserRequest updateUserRequest){
        Tuple tupleUser_ = userRepo.getUserByIdV2(updateUserRequest.getIdUser_());
//        if(authenticationRepo.getAUByEmail(updateUserRequest.getEmail_())!=null){
//            throw new RuntimeException(CustomRuntimeEception.builder()
//                    .desriptionErr_("Email đã được đăng kí, vui lòng dùng email khác hoặc đăng nhập với email này.")
//                    .build());
//        };


        if(tupleUser_==null){throw new RuntimeException(CustomRuntimeEception.builder()
                .desriptionErr_("Không thể cập nhật người dùng bây giờ vui lòng quay lại sau...")
                .build());}

        UserEntity userEntity = UserEntity.builder()
                .id_(tupleUser_.get(0).toString())
                .statusDelete_(1)
                .name_(updateUserRequest.getName_())
                .age_(updateUserRequest.getAge_())
                .idAuthentication_(tupleUser_.get(1).toString())
                .linkImg_(updateUserRequest.getLinkImg_())
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

        if(tuplesMyBlog_==null){throw new RuntimeException(CustomRuntimeEception.builder()
                .desriptionErr_("Chưa có blog nào.")
                .build());}

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

    public ApiRespone<UserProfileMyBlogDetailRespone> getMyBlogDetail(String idMyBlog_){
        try {
            Tuple tupleMyBlogDetail_ = blogRepo.getMyBlogDetail(idMyBlog_);
            return ApiRespone.<UserProfileMyBlogDetailRespone>builder()
                    .respone_(200)
                    .desription_("Request ok")
                    .result_(UserProfileMyBlogDetailRespone.builder()
                            .id_(tupleMyBlogDetail_.get("id_").toString())
                            .title_(tupleMyBlogDetail_.get("title_").toString())
                            .content_(tupleMyBlogDetail_.get("content_").toString())
                            .linkImg_(tupleMyBlogDetail_.get("linkImg_").toString())
                            .build())
                    .build();
        } catch (RuntimeException e) {
            throw new RuntimeException(CustomRuntimeEception.builder()
                    .desriptionErr_("lỗi hệ thống vui lòng quay lại sau")
                    .build());
        }
    }

    public ApiRespone<UpdateBlogRespone> updateBlog(UpdateBlogRequest updateBlogRequest){

        try {
            BlogEntity blogEntity = blogRepo.findById(updateBlogRequest.getIdBlog_()).get();

            blogEntity.setTitle_(updateBlogRequest.getTitle_());
            blogEntity.setContent_(updateBlogRequest.getContent_());
            blogEntity.setLinkImg_(updateBlogRequest.getLinkImg_());
            blogRepo.save(blogEntity);
            return ApiRespone.<UpdateBlogRespone>builder()
                    .respone_(200)
                    .desription_("Request ok")
                    .result_(UpdateBlogRespone.builder()
                            .checkUpdate_(true)
                            .desription_("Cập nhật bài viết thành công.")
                            .build())
                    .build();
        } catch (RuntimeException e) {
            throw new RuntimeException(CustomRuntimeEception.builder()
                    .desriptionErr_("Lỗi hệ thống vui lòng quay lại sau.")
                    .build());
        }
    }


    public ApiRespone<DeleteMyBlog> deleteBlog(String idBlog_){

        try {
            BlogEntity blogEntity = blogRepo.findById(idBlog_).get();

            blogEntity.setStatusDelete_(0);
            blogRepo.save(blogEntity);
            return ApiRespone.<DeleteMyBlog>builder()
                    .respone_(200)
                    .desription_("Request ok")
                    .result_(DeleteMyBlog.builder()
                            .checkDelete_(true)
                            .desription_("Xóa bài viết thành công.")
                            .build())
                    .build();
        } catch (RuntimeException e) {
            throw new RuntimeException(CustomRuntimeEception.builder()
                    .desriptionErr_("Lỗi hệ thống vui lòng quay lại sau.")
                    .build());
        }
    }

    public ApiRespone<List<ListRequestFriendRespone>> getRequestFriend(String idUser_){
        List<Tuple> tuplesFriendRequest_ = friendrequestRepo.getRequestUserByIdUser(idUser_);


        if(tuplesFriendRequest_.isEmpty()){throw new RuntimeException(CustomRuntimeEception.builder().desriptionErr_("Không có lời mời kết bạn nào.").build());}

        List<ListRequestFriendRespone> requestFriendRespones = tuplesFriendRequest_.stream().map(t-> new ListRequestFriendRespone(
                t.get("id_",String.class),
                t.get("name_",String.class),
                t.get("linkImg_",String.class)
        )).collect(Collectors.toList());

        return ApiRespone.<List<ListRequestFriendRespone>>builder()
                .respone_(200)
                .desription_("Request ok")
                .result_(requestFriendRespones)
                .build();
    }

    public ApiRespone<ApplyRequestfriendRespone> applyRequestFriend(ApplyRequestFriendRequest applyRequestFriendRequest){
        try {
            System.out.println(applyRequestFriendRequest);
            FriendRequestEntity friendRequestEntity = friendrequestRepo.findById(applyRequestFriendRequest.getIdRequestFriend_()).get();
            LinkUserEntity linkUserEntity = LinkUserEntity.builder()
                    .idUser_(friendRequestEntity.getIdUser_())
                    .idUserFriend_(friendRequestEntity.getIdUserFriend_())
                    .statusDelete_(1)
                    .build();
            linkUserRepo.save(linkUserEntity);
            LinkUserEntity linkUserEntity_ = LinkUserEntity.builder()
                    .idUser_(friendRequestEntity.getIdUserFriend_())
                    .idUserFriend_(friendRequestEntity.getIdUser_())
                    .statusDelete_(1)
                    .build();
            linkUserRepo.save(linkUserEntity_);
            friendRequestEntity.setStatusDelete_(0);
            friendrequestRepo.save(friendRequestEntity);

            return ApiRespone.<ApplyRequestfriendRespone>builder()
                    .respone_(200)
                    .desription_("Request ok")
                    .result_(ApplyRequestfriendRespone.builder()
                            .checkApply_(true)
                            .desription_("Đã chấp nhận lời mời kết bạn.")
                            .build())
                    .build();

        } catch (RuntimeException e) {
            throw new RuntimeException(CustomRuntimeEception.builder().desriptionErr_("Lỗi hệ thống vui lòng quay lại sau.").build());
        }


    }

    public ApiRespone<ApplyRequestfriendRespone> deleteRequestFriend(String idRequestFriend_){
        try {

            FriendRequestEntity friendRequestEntity = friendrequestRepo.findById(idRequestFriend_).get();
            friendRequestEntity.setStatusDelete_(0);
            friendrequestRepo.save(friendRequestEntity);

            return ApiRespone.<ApplyRequestfriendRespone>builder()
                    .respone_(200)
                    .desription_("Request ok")
                    .result_(ApplyRequestfriendRespone.builder()
                            .checkApply_(true)
                            .desription_("Đã xóa lời mời kết bạn.")
                            .build())
                    .build();

        } catch (RuntimeException e) {
            throw new RuntimeException(CustomRuntimeEception.builder().desriptionErr_("Lỗi hệ thống vui lòng quay lại sau.").build());
        }


    }

}





























