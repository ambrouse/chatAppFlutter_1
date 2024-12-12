package com.example.chatApp.model.request;

import com.example.chatApp.err.custom_valid.check_email.ValidCheckEmail;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;
import lombok.experimental.FieldDefaults;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class LoginRequest {
    @ValidCheckEmail(message = "Email sai định dạng.")
    @NotEmpty(message = "Chưa nhập email.")
    String email_;
    @NotEmpty(message = "chưa nhập mật khẩu.")
    String password_;
}
