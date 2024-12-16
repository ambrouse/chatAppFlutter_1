package com.example.chatApp.socket;


import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.concurrent.CopyOnWriteArrayList;

public class SocketChatHand extends TextWebSocketHandler {

    private final CopyOnWriteArrayList<WebSocketSession> sessions = new CopyOnWriteArrayList<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessions.add(session);
    }




    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        if(message.getPayload().equals("disconected")){
//            System.out.println("disconected : "+session.getId());
            sessions.remove(session);
            session.close();
        } else if (message.getPayload().equals("conected")) {
//            System.out.println("conected : "+session.getId());
            session.sendMessage(message);
        } else{
            for(WebSocketSession webSocketSession : sessions){
                if(!webSocketSession.getId().equals(session.getId())){
                    try {
                        webSocketSession.sendMessage(message);
                    } catch( Exception ex ) {
//                        System.out.println("disconect - not send.");
                        sessions.remove( webSocketSession );
//                        synchronized( sessions ) {
//                            sessions.remove( webSocketSession );
//                        }
                    }
                }
            }
        }

    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        super.afterConnectionClosed(session, status);
    }
}
