package com.example.chatApp.service;


import com.example.chatApp.api_setting.ApiRespone;
import com.example.chatApp.err.CustomRuntimeEception;
import com.example.chatApp.model.entity.ChatEntity;
import com.example.chatApp.model.repo.ChatRepo;
import com.example.chatApp.model.request.SendChatRequest;
import com.example.chatApp.model.respone.ChatRespone;
import com.example.chatApp.model.respone.SendChatRespone;
import jakarta.persistence.Tuple;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ChatService {
    @Autowired
    ChatRepo chatRepo;

    public ApiRespone<List<ChatRespone>> getChat(String idLinkUser_){
        List<Tuple> tuplesChat_ = chatRepo.getChatByIdLinkUser(idLinkUser_);

        List<ChatRespone> chatRespones = tuplesChat_.stream().map(t-> new ChatRespone(
                t.get("id_",String.class),
                t.get("content_",String.class)
        )).collect(Collectors.toList());

        System.out.println(tuplesChat_);
        return ApiRespone.<List<ChatRespone>>builder()
                .respone_(200)
                .desription_("Request ok")
                .result_(chatRespones)
                .build();
    }

    public ApiRespone<SendChatRespone> sendChat(SendChatRequest sendChatRequest){
        ChatEntity chatEntity = ChatEntity.builder()
                .idLinkUser_(sendChatRequest.getIdLinkUser_())
                .content_(sendChatRequest.getContent_())
                .statusDelete_(1)
                .build();
        try {
            chatRepo.save(chatEntity);

            return ApiRespone.<SendChatRespone>builder()
                    .respone_(200)
                    .desription_("Request ok")
                    .result_(SendChatRespone.builder()
                            .desription_("Tin nhắn đã được gửi.")
                            .checkSendChat_(true)
                            .build())
                    .build();
        } catch (RuntimeException e) {
            throw new RuntimeException(CustomRuntimeEception.builder().desriptionErr_("Lỗi hệ thống vui lòng thử lại sau.").build());
        }

    }
}
