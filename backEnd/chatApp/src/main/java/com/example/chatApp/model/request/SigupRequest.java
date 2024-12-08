package com.example.chatApp.model.request;

import com.example.chatApp.err.custom_valid.check_email.ValidCheckEmail;
import lombok.*;
import lombok.experimental.FieldDefaults;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class SigupRequest {
    String name_;
    @ValidCheckEmail
    String email_;
    String password_;
    int age_;
}
