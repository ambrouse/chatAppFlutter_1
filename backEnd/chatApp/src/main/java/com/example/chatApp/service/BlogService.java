package com.example.chatApp.service;

import com.example.chatApp.api_setting.ApiRespone;
import com.example.chatApp.err.CustomRuntimeEception;
import com.example.chatApp.model.entity.BlogEntity;
import com.example.chatApp.model.entity.HeartEntity;
import com.example.chatApp.model.entity.LikeEntity;
import com.example.chatApp.model.repo.BlogRepo;
import com.example.chatApp.model.repo.HeartRepo;
import com.example.chatApp.model.repo.LikeRepo;
import com.example.chatApp.model.repo.LinkUserRepo;
import com.example.chatApp.model.request.CreateBlogRequest;
import com.example.chatApp.model.request.CreateHeartRequest;
import com.example.chatApp.model.request.CreateLikeRequest;
import com.example.chatApp.model.request.UpdateLinkImgBlogRequest;
import com.example.chatApp.model.respone.BlogRespone;
import com.example.chatApp.model.respone.CreateBlogRespone;
import jakarta.persistence.Tuple;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class BlogService {

    @Autowired
    BlogRepo blogRepo;
    @Autowired
    LikeRepo likeRepo;
    @Autowired
    HeartRepo heartRepo;
    @Autowired
    LinkUserRepo linkUserRepo;


    public ApiRespone<List<BlogRespone>> getBlog(String idUser_){
        try {

            List<Tuple> tuplesFriend_ = linkUserRepo.getLinkUserByIdUser(idUser_,"");

            List<Tuple> tuplesBlog_ = blogRepo.getBlogFriend(idUser_);

            List<BlogRespone> blogRespones = tuplesBlog_.stream().map(t-> new BlogRespone(
                    t.get("id_",String.class),
                    t.get("title_",String.class),
                    t.get("content_",String.class),
                    0,
                    0,
                    false,
                    false,
                    "",
                    "",
                    t.get("name_",String.class),
                    t.get("linkImgBlog_",String.class),
                    t.get("linkImgUser_",String.class)
            )).collect(Collectors.toList());

            for (Tuple i:tuplesFriend_){
                List<Tuple> tuplesBlogCurent_ = blogRepo.getBlogFriend(i.get("idUserFriend_").toString());
                List<BlogRespone> blogResponesCurent_ = tuplesBlogCurent_.stream().map(t-> new BlogRespone(
                        t.get("id_",String.class),
                        t.get("title_",String.class),
                        t.get("content_",String.class),
                        0,
                        0,
                        false,
                        false,
                        "",
                        "",
                        t.get("name_",String.class),
                        t.get("linkImgBlog_",String.class),
                        t.get("linkImgUser_",String.class)
                )).collect(Collectors.toList());
                for(BlogRespone j:blogResponesCurent_){
                    blogRespones.add(j);
                }
            }

            for(BlogRespone i : blogRespones){
                i.setLike_(likeRepo.countLikeByFriendBlog(i.getId_()));
                i.setHeart_(heartRepo.countHeartByFriendBlog(i.getId_()));
                Tuple tupleIdLike_ = likeRepo.checkLikeByUser(i.getId_(),idUser_);
                Tuple tupleHeart_ = heartRepo.checkHeartByUser(i.getId_(),idUser_);
                if(tupleIdLike_!=null){
                    i.setCheckLike_(true);
                    i.setIdLike_(tupleIdLike_.get(0).toString());
                }
                if(tupleHeart_!=null){
                    i.setCheckHeart_(true);
                    i.setIdHeart_(tupleHeart_.get(0).toString());
                }
            }

            if(blogRespones.isEmpty()){throw new RuntimeException(CustomRuntimeEception.builder().desriptionErr_("null").build());}

            return ApiRespone.<List<BlogRespone>>builder()
                    .respone_(200)
                    .desription_("Request ok")
                    .result_(blogRespones)
                    .build();
        } catch (RuntimeException e) {
            throw new RuntimeException(CustomRuntimeEception.builder().desriptionErr_("Lỗi hệ thống.").build());
        }
    }

    public ApiRespone<CreateBlogRespone> createBlog(CreateBlogRequest createBlogRequest) {
        BlogEntity blogEntity = BlogEntity.builder()
                .dayBlog_(LocalDateTime.now())
                .idUser_(createBlogRequest.getIdUser_())
                .title_(createBlogRequest.getTitle_())
                .content_(createBlogRequest.getContent_())
                .linkImg_(createBlogRequest.getLinkImg_())
                .statusDelete_(1)
                .status_("1")
                .build();
        BlogEntity blogEntity1;
        try {
            blogEntity1 = blogRepo.save(blogEntity);
        } catch (RuntimeException e) {
            throw new RuntimeException(CustomRuntimeEception.builder()
                    .desriptionErr_("Lỗi hệ thống.")
                    .build());
        }

        return ApiRespone.<CreateBlogRespone>builder()
                .respone_(200)
                .result_(CreateBlogRespone.builder()
                        .idBlog_(blogEntity1.getId_())
                        .checkCreate_(true)
                        .desription_("Tạo blog thành công.")
                        .build())
                .build();
    }

    public ApiRespone<CreateBlogRespone> updateImageBlog(UpdateLinkImgBlogRequest updateLinkImgBlogRequest) {

        BlogEntity blogEntity = blogRepo.findById(updateLinkImgBlogRequest.getIdBlog_()).get();

        blogEntity.setLinkImg_(updateLinkImgBlogRequest.getLinkImg_());

        blogRepo.save(blogEntity);

        return ApiRespone.<CreateBlogRespone>builder()
                .respone_(200)
                .result_(CreateBlogRespone.builder()
                        .idBlog_(blogEntity.getId_())
                        .checkCreate_(true)
                        .desription_("Tạo blog thành công.")
                        .build())
                .build();
    }

    public ApiRespone<CreateBlogRespone> createLike(CreateLikeRequest createLikeRequest){
        LikeEntity likeEntity = LikeEntity.builder()
                .idUser_(createLikeRequest.getIdUser_())
                .idBlog_(createLikeRequest.getIdBlog_())
                .statusDelete_(1)
                .build();
        try {
            likeRepo.save(likeEntity);
        } catch (RuntimeException e) {
            throw new RuntimeException(CustomRuntimeEception.builder().desriptionErr_("Lỗi hệ thống.").build());
        }

        return ApiRespone.<CreateBlogRespone>builder()
                .respone_(200)
                .desription_("Request ok")
                .result_(CreateBlogRespone.builder()
                        .checkCreate_(true)
                        .desription_("Đã like bài viết.")
                        .build())
                .build();
    }

    public ApiRespone<CreateBlogRespone> createHeart(CreateHeartRequest createHeartRequest){
        HeartEntity heartEntity = HeartEntity.builder()
                .idUser_(createHeartRequest.getIdUser_())
                .idBlog_(createHeartRequest.getIdBlog_())
                .statusDelete_(1)
                .build();
        try {
            heartRepo.save(heartEntity);
        } catch (RuntimeException e) {
            throw new RuntimeException(CustomRuntimeEception.builder().desriptionErr_("Lỗi hệ thống.").build());
        }

        return ApiRespone.<CreateBlogRespone>builder()
                .respone_(200)
                .desription_("Request ok")
                .result_(CreateBlogRespone.builder()
                        .checkCreate_(true)
                        .desription_("Đã tym bài viết.")
                        .build())
                .build();
    }

    public ApiRespone<CreateBlogRespone> deleteHeart(String iduser_,String idBlog_){
        try {
            Tuple heartEntity = heartRepo.checkHeartByUser(idBlog_,iduser_);
            HeartEntity heartEntity1 = HeartEntity.builder()
                    .id_(heartEntity.get(0).toString())
                    .statusDelete_(0)
                    .idBlog_(idBlog_)
                    .idUser_(iduser_)
                    .build();

            heartRepo.save(heartEntity1);
        } catch (RuntimeException e) {
            throw new RuntimeException(CustomRuntimeEception.builder().desriptionErr_("Lỗi hệ thống.").build());
        }

        return ApiRespone.<CreateBlogRespone>builder()
                .respone_(200)
                .desription_("Request ok")
                .result_(CreateBlogRespone.builder()
                        .checkCreate_(true)
                        .desription_("Đã hủy tym bài viết.")
                        .build())
                .build();
    }

    public ApiRespone<CreateBlogRespone> deleteLike(String idLike_){
        try {
            LikeEntity likeEntity = likeRepo.findById(idLike_).get();
            likeEntity.setStatusDelete_(0);
            likeRepo.save(likeEntity);
        } catch (RuntimeException e) {
            throw new RuntimeException(CustomRuntimeEception.builder().desriptionErr_("Lỗi hệ thống.").build());
        }

        return ApiRespone.<CreateBlogRespone>builder()
                .respone_(200)
                .desription_("Request ok")
                .result_(CreateBlogRespone.builder()
                        .checkCreate_(true)
                        .desription_("Đã hủy like bài viết.")
                        .build())
                .build();
    }

}
