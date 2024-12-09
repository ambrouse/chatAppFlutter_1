package com.example.chatApp.model.respone;

import lombok.*;
import lombok.experimental.FieldDefaults;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UpdateBlogRespone {
    String desription_;
    boolean checkUpdate_;
}
