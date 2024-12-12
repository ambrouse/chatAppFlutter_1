package com.example.chatApp.err.custom_valid.check_email;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class ValidCheckEmailSetting implements ConstraintValidator<ValidCheckEmail,String> {
    @Override
    public void initialize(ValidCheckEmail constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        if(s==null || s==""){return true;}

        if(s.indexOf("@gmail.com",s.length()-10)!=-1){
            return true;
        }

        return false;
    }
}
