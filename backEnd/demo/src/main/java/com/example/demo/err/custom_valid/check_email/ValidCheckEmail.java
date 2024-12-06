package com.example.demo.err.custom_valid.check_email;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

public @interface ValidCheckEmail {
    @Target({ElementType.FIELD})
    @Retention(RetentionPolicy.RUNTIME)
    @Constraint(validatedBy = {ValidCheckEmailSetting.class})
    public @interface CheckGmailString {
        String message() default "";

        Class<?>[] groups() default {};

        Class<? extends Payload>[] payload() default {};
    }
}
