package com.example.chatApp.model.request;

import com.example.chatApp.err.custom_valid.check_email.ValidCheckEmail;
import com.example.chatApp.err.custom_valid.check_email.ValidCheckIntSmallZero;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;
import lombok.experimental.FieldDefaults;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class SigupRequest {
    @NotEmpty(message = "Chưa nhập tên.")
    String name_;
    @NotEmpty(message = "Chưa nhập email.")
    @ValidCheckEmail(message = "Email sai định dạng.")
    String email_;
    @NotEmpty(message = "Chưa nhập mật khẩu.")
    String password_;
    @ValidCheckIntSmallZero(message = "Tuổi người dùng không hợp lệ.")
    int age_;
}
