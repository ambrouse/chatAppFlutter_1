package com.example.chatApp.err.custom_valid.check_email;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class ValidCheckIntSmallZeroSetting implements ConstraintValidator<ValidCheckIntSmallZero,Integer> {
    @Override
    public void initialize(ValidCheckIntSmallZero constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(Integer i, ConstraintValidatorContext constraintValidatorContext) {
        if(i<3 || i>100){
            return  false;
        }
        return true;
    }
}
