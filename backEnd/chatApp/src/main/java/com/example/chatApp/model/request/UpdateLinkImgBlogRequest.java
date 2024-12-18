package com.example.chatApp.model.request;

import lombok.*;
import lombok.experimental.FieldDefaults;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UpdateLinkImgBlogRequest {
    String idBlog_;
    String linkImg_;
}
