package com.example.chatApp.model.respone;


import lombok.*;
import lombok.experimental.FieldDefaults;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BlogRespone {
    String id_;
    String titleMini_;
    String contentMini_;
    String title_;
    String content_;
    int like_;
    int heart_;
    boolean checkLike_;
    boolean checkHeart_;
    String idLike_;
    String idHeart_;
    String nameUser_;
    String linkImgBlog_;
    String linkImgUser_;
}
