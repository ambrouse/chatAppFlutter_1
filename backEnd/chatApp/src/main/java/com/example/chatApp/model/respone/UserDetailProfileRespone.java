package com.example.chatApp.model.respone;

import lombok.*;
import lombok.experimental.FieldDefaults;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserDetailProfileRespone {
    String name_;
    String email_;
    String password_;
    String age_;
}
