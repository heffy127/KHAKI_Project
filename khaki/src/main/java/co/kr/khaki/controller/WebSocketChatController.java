package co.kr.khaki.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;


@Controller
//@ServerEndpoint(value="/echo.do") 는 /echo.do 라는 url 요청을 통해 웹소켓에 들어가겠다라는 어노테이션입니다.
@ServerEndpoint(value="/echo.do")
public class WebSocketChatController {
    
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChatController.class);
    public WebSocketChatController() {
        // TODO Auto-generated constructor stub
        System.out.println("웹소켓(서버) 객체생성");
    }
    
    //@onOpen 는 클라이언트가 웹소켓에 들어오고 서버에 아무런 문제 없이 들어왔을때 실행하는 메소드입니다.
    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("채팅이 연결되었습니다.");
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param message
     */
    
    //sendAllSessionToMessage()는 어떤 누군가에게 메시지가 왔다면 그 메시지를 보낸 자신을 제외한 연결된 세션(클라이언트)에게 메시지를 보내는 메소드입니다.
    private void sendAllSessionToMessage(Session self,String message) {
        try {
            for(Session session : WebSocketChatController.sessionList) {
                if(!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText(message.split(",,,")[1]+ ",,," + message.split(",,,")[0]);
                }
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
    
    //@onMessage 는 클라이언트에게 메시지가 들어왔을 때, 실행되는 메소드입니다.
    @OnMessage
    public void onMessage(String message,Session session) {
        logger.info("Message From " + message.split(",,,")[1] + ": " + message.split(",,,")[0]);
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("나,,,"+ message.split(",,,")[0]);
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, message);
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    //@onClose 는 클라이언트와 웹소켓과의 연결이 끊기면 실행되는 메소드입니다.
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
}




