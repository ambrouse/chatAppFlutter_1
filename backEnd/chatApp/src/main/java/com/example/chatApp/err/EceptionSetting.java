package com.example.chatApp.err;

import com.example.chatApp.api_setting.ApiRespone;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

public class EceptionSetting {
    @ControllerAdvice
    public class SettingEception {

        @ExceptionHandler
        ResponseEntity<ApiRespone<String>> valid(MethodArgumentNotValidException customException){

            return ResponseEntity.badRequest().body(ApiRespone.<String>builder()
                    .respone_(400)
                    .desription_("Request error")
                    .result_(customException.getFieldError().getDefaultMessage())
                    .build());
        }

        @ExceptionHandler
        ResponseEntity<ApiRespone<String>> setting(CustomRuntimeEception customException){

            return ResponseEntity.badRequest().body(ApiRespone.<String>builder()
                    .respone_(400)
                    .desription_("Request error")
                    .result_(customException.getDesriptionErr_())
                    .build());
        }
    }
}
