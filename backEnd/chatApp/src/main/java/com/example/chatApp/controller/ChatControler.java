package com.example.chatApp.controller;

import com.example.chatApp.api_setting.ApiRespone;
import com.example.chatApp.model.request.SendChatRequest;
import com.example.chatApp.model.respone.ChatRespone;
import com.example.chatApp.model.respone.SendChatRespone;
import com.example.chatApp.service.ChatService;
import jakarta.persistence.Tuple;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("${rootApi.url}")
public class ChatControler {

    @Autowired
    ChatService chatService;

    @RequestMapping("/chat/{id_link_user}")
    public ApiRespone<List<ChatRespone>> getChat(@PathVariable(name = "id_link_user") String idLinkUser_){

        return chatService.getChat(idLinkUser_);
    }

    @PostMapping("/chat")
    public ApiRespone<SendChatRespone> getChat(@RequestBody SendChatRequest sendChatRequest){

        return chatService.sendChat(sendChatRequest);
    }
}
