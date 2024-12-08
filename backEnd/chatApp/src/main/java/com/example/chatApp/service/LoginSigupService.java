package com.example.chatApp.service;


import com.example.chatApp.api_setting.ApiRespone;
import com.example.chatApp.err.CustomRuntimeEception;
import com.example.chatApp.model.entity.AuthenticationEntity;
import com.example.chatApp.model.entity.UserEntity;
import com.example.chatApp.model.repo.AuthenticationRepo;
import com.example.chatApp.model.repo.UserRepo;
import com.example.chatApp.model.request.LoginRequest;
import com.example.chatApp.model.request.SigupRequest;
import com.example.chatApp.model.respone.LoginSigupRespone;
import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import jakarta.persistence.Tuple;
import lombok.RequiredArgsConstructor;
import lombok.experimental.NonFinal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;

@Service
@RequiredArgsConstructor
public class LoginSigupService {

    @Autowired
    AuthenticationRepo authenticationRepo;
    @Autowired
    UserRepo userRepo;

    public ApiRespone<LoginSigupRespone> login(LoginRequest loginRequest){
        Tuple tupleIdUserByEmail_ = authenticationRepo.getAUByEmail(loginRequest.getEmail_());

        if(tupleIdUserByEmail_==null){throw new RuntimeException(CustomRuntimeEception.builder().desriptionErr_("Vui lòng kiểm tra lại email.").build());}

        Tuple tupleIdUserByEmailPassword_ = authenticationRepo.getAUByEmailPassword(loginRequest.getEmail_(),loginRequest.getPassword_());

        if(tupleIdUserByEmailPassword_==null){throw new RuntimeException(CustomRuntimeEception.builder().desriptionErr_("Vui lòng kiểm tra lại mật khẩu.").build());}

        return ApiRespone.<LoginSigupRespone>builder()
                .respone_(200)
                .desription_("Request ok")
                .result_(LoginSigupRespone.builder()
                        .token_(create_token(tupleIdUserByEmailPassword_.get(0).toString()))
                        .check_(true)
                        .idUser_(tupleIdUserByEmailPassword_.get(0).toString())
                        .build())
                .build();

    }


    public ApiRespone<LoginSigupRespone> sigup(SigupRequest sigupRequest){
            System.out.println(sigupRequest);
            Tuple tupleIdUserByEmail_ = authenticationRepo.getAUByEmail(sigupRequest.getEmail_());

            if(tupleIdUserByEmail_!=null){throw new RuntimeException(CustomRuntimeEception.builder().desriptionErr_("Email đã được đăng kí, vui lòng dùng email khác hoặc đăng nhập với email này.").build());}

            AuthenticationEntity authenticationEntity = AuthenticationEntity.builder()
                    .statusDelete_(1)
                    .email_(sigupRequest.getEmail_())
                    .password_(sigupRequest.getPassword_())
                    .build();
            authenticationRepo.save(authenticationEntity);
            tupleIdUserByEmail_ = authenticationRepo.getAUByEmail(sigupRequest.getEmail_());
            UserEntity userEntity = UserEntity.builder()
                    .statusDelete_(1)
                    .name_(sigupRequest.getName_())
                    .idAuthentication_(tupleIdUserByEmail_.get(0).toString())
                    .age_(sigupRequest.getAge_())
                    .build();
            userRepo.save(userEntity);

            return ApiRespone.<LoginSigupRespone>builder()
                    .respone_(200)
                    .desription_("Request ok")
                    .result_(LoginSigupRespone.builder()
                            .idUser_(tupleIdUserByEmail_.get(0).toString())
                            .check_(true)
                            .token_(create_token(tupleIdUserByEmail_.get(0).toString()))
                            .build())
                    .build();
    }


    @NonFinal
    private final String key_create_token_ = "aHa66Jus+2XX03YJO7MFcs6RnN4eHCsjLmmcIATMmjEi7RctICJiZzI3dzWZrh2q";


    private String create_token(String idUser_){
        JWSHeader jwsHeader = new JWSHeader(JWSAlgorithm.HS512);
        JWTClaimsSet jwtClaimsSet = new JWTClaimsSet.Builder()
                .subject(idUser_)
                .issuer("ten_domain")
                .issueTime(new Date())
                .expirationTime(new Date(
                        Instant.now().plus(2, ChronoUnit.HOURS).toEpochMilli()
                ))
                .claim("scope","user")
                .build();
        Payload payload = new Payload(jwtClaimsSet.toJSONObject());
        JWSObject jwsObject = new JWSObject(jwsHeader,payload);

        try {
            jwsObject.sign(new MACSigner(key_create_token_.getBytes()));
            String a = jwsObject.serialize();
            return a;
        } catch (JOSEException e) {
            throw new RuntimeException(CustomRuntimeEception.builder()
                    .desriptionErr_(" ")
                    .build());
        }
    }

    public boolean verify_token(String token) throws JOSEException, ParseException {
        JWSVerifier jwsVerifier = new MACVerifier(key_create_token_.getBytes());
        SignedJWT signedJWT = SignedJWT.parse(token);
        boolean verify = signedJWT.verify(jwsVerifier);
        boolean check_time = signedJWT.getJWTClaimsSet().getExpirationTime().after(new Date());
        boolean check = (verify == true && check_time == true);
        var a = SecurityContextHolder.getContext().getAuthentication();
        a.getAuthorities().forEach(e -> System.out.println(e.getAuthority()));
        return check;

    }
}
