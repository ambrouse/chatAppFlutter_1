package com.example.chatApp.err;


import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CustomRuntimeEception extends  RuntimeException{
    String desriptionErr_ ;

    public  CustomRuntimeEception(String des_){
        this.desriptionErr_ = des_;
    }

}
