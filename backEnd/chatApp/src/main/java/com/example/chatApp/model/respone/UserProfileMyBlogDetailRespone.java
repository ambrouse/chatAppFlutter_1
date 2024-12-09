package com.example.chatApp.model.respone;


import lombok.*;
import lombok.experimental.FieldDefaults;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserProfileMyBlogDetailRespone {
    String id_;
    String title_;
    String content_;
}
