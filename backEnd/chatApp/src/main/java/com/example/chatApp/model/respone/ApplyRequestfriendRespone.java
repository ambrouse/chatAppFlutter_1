package com.example.chatApp.model.respone;

import lombok.*;
import lombok.experimental.FieldDefaults;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ApplyRequestfriendRespone {
    String desription_;
    boolean checkApply_;
}
