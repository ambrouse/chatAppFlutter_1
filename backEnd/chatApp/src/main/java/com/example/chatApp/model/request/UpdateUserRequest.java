package com.example.chatApp.model.request;

import lombok.*;
import lombok.experimental.FieldDefaults;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UpdateUserRequest {
    String idUser_;
    String name_;
    String email_;
    String password_;
    int age_;
}
