package com.example.chatApp.controller;

import com.example.chatApp.api_setting.ApiRespone;
import com.example.chatApp.model.repo.BlogRepo;
import com.example.chatApp.model.request.CreateBlogRequest;
import com.example.chatApp.model.request.CreateHeartRequest;
import com.example.chatApp.model.request.CreateLikeRequest;
import com.example.chatApp.model.respone.BlogRespone;
import com.example.chatApp.model.respone.CreateBlogRespone;
import com.example.chatApp.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("${rootApi.url}")
public class BlogController {

    @Autowired
    BlogService blogService;


    @RequestMapping("/blog/{id_user}")
    public ApiRespone<List<BlogRespone>> getBlog(@PathVariable(name = "id_user") String idUser_){

        return blogService.getBlog(idUser_);
    }

    @PostMapping("/blog")
    public ApiRespone<CreateBlogRespone> createBlog(@RequestBody CreateBlogRequest createBlogRequest){

        return blogService.createBlog(createBlogRequest);
    }

    @PostMapping("/blog_like")
    public ApiRespone<CreateBlogRespone> createLike(@RequestBody CreateLikeRequest createLikeRequest){

        return blogService.createLike(createLikeRequest);
    }


    @PostMapping("/blog_heart")
    public ApiRespone<CreateBlogRespone> createHeart(@RequestBody CreateHeartRequest createHeartRequest){

        return blogService.createHeart(createHeartRequest);
    }

    @DeleteMapping("/blog_heart/{id_heart}")
    public ApiRespone<CreateBlogRespone> deleteHeart(@PathVariable(name = "id_heart") String idHeart_){

        return blogService.deleteHeart(idHeart_);
    }

    @DeleteMapping("/blog_like/{id_like}")
    public ApiRespone<CreateBlogRespone> deleteLike(@PathVariable(name = "id_like") String idLike_){

        return blogService.deleteLike(idLike_);
    }


}
