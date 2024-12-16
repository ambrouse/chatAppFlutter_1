package com.example.chatApp.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.oauth2.jose.jws.MacAlgorithm;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.security.oauth2.server.resource.authentication.JwtGrantedAuthoritiesConverter;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import javax.crypto.spec.SecretKeySpec;
@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecuritySetting {
    private final String[] link_not_securiry = {"/chat_app/api/v1/login","/chat_app/api/v1/sigup","/chat_app/api/v1/friends","chat_app/api/v1/user/{id_user}"
            ,"chat_app/api/v1/user","/chat_app/api/v1/my_blog/{id_user}","/chat_app/api/v1/my_blog_detail/{id_blog}","/chat_app/api/v1/my_blog_detail","chat_app/api/v1/request_friend/{id_user}",
            "/chat_app/api/v1/request_friend","/chat_app/api/v1/request_friend/{id_request_friend}","/chat_app/api/v1/chat/{id_user_}/{id_friend_}","/chat_app/api/v1/chat","/chat_app/api/v1/blog/{id_user}","/chat_app/api/v1/blog",
            "/chat_app/api/v1/blog_like","/chat_app/api/v1/blog_like/{id_like}","/chat_app/api/v1/blog_heart","/chat_app/api/v1/blog_heart/{id_user}/{id_blog}","/chat_app/api/v1/send_request_friend",
            "/topic","/topic/public","/ws","/chat_app/api/v1/update_img_blog"};

    @Value("${jwt.create_token_key}")
    private String sereckey;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {


        http.authorizeHttpRequests(rq_  -> rq_
                .requestMatchers(HttpMethod.GET,link_not_securiry).permitAll()
                .requestMatchers(HttpMethod.POST,link_not_securiry).permitAll()
                .requestMatchers(HttpMethod.PUT,link_not_securiry).permitAll()
                .requestMatchers(HttpMethod.DELETE,link_not_securiry).permitAll()

                .anyRequest().authenticated());

        http.csrf(AbstractHttpConfigurer::disable);

        http.oauth2ResourceServer(oauth2 -> oauth2
                .jwt(jwtConfigurer -> jwtConfigurer.decoder(jwt_decoder())));

        http.cors(Customizer.withDefaults());

        return http.build();
    }

    @Bean
    JwtAuthenticationConverter jwtAuthenticationConverter(){
        JwtGrantedAuthoritiesConverter jwt_ = new JwtGrantedAuthoritiesConverter();
        jwt_.setAuthorityPrefix("ROLE_");
        JwtAuthenticationConverter jwt__ = new JwtAuthenticationConverter();
        jwt__.setJwtGrantedAuthoritiesConverter(jwt_);
        return jwt__;
    }


    @Bean
    JwtDecoder jwt_decoder(){
        SecretKeySpec spec = new SecretKeySpec(sereckey.getBytes(),"HS512");
        return NimbusJwtDecoder
                .withSecretKey(spec)
                .macAlgorithm(MacAlgorithm.HS512)
                .build();
    }


    @Bean
    public CorsFilter corsFilter(){
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        corsConfiguration.addAllowedOrigin("*");
        corsConfiguration.addAllowedMethod("*");
        corsConfiguration.addAllowedHeader("*");
        UrlBasedCorsConfigurationSource urlBasedCorsConfigurationSource = new UrlBasedCorsConfigurationSource();
        urlBasedCorsConfigurationSource.registerCorsConfiguration("/**",corsConfiguration);
        return new CorsFilter(urlBasedCorsConfigurationSource);

    }
}
