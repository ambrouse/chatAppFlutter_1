package com.example.demo.err;


import com.example.demo.api.ApiRespone;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class SettingEception {

    @ExceptionHandler
    ResponseEntity<ApiRespone<String>> valid(MethodArgumentNotValidException customException){
        return ResponseEntity.badRequest().body(ApiRespone.<String>builder()
                .desripntion_("Request error")
                .respone_(200)
                .result_(customException.getFieldError().getDefaultMessage())
                .build());
    }

    @ExceptionHandler
    ResponseEntity<ApiRespone<String>> setting(CustomRuntimeEception customException){
        return ResponseEntity.badRequest().body(ApiRespone.<String>builder()
                .desripntion_("Request error")
                .respone_(200)
                .result_(customException.getDesriptionErr_())
                .build());
    }
}
