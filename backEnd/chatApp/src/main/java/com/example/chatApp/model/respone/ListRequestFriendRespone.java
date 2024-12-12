package com.example.chatApp.model.respone;

import lombok.*;
import lombok.experimental.FieldDefaults;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ListRequestFriendRespone {
    String id_;
    String name_;
    String linkImg_;
}
