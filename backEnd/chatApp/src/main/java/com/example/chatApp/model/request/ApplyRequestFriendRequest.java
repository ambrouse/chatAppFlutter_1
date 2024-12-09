package com.example.chatApp.model.request;


import lombok.*;
import lombok.experimental.FieldDefaults;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ApplyRequestFriendRequest {
    String idRequestFriend_;
}
