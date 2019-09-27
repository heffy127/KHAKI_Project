package co.kr.khaki.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;
import javax.websocket.Endpoint;
import javax.websocket.EndpointConfig;
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

import co.kr.khaki.common.ServletAwareConfig;

@Controller
// @ServerEndpoint(value="/echo.do") 는 /echo.do 라는 url 요청을 통해 웹소켓에 들어가겠다라는 어노테이션
@ServerEndpoint(value = "/echo.do", configurator = ServletAwareConfig.class)
public class WebSocketChatController {

	private static final ArrayList<String> adminList = new ArrayList<>( // 관리자 목록
			Arrays.asList("admin1", "admin2"));
	private static final ArrayList<String> waitingAdminList = new ArrayList<>(); // 대기중인 관리자 목록

	private static final Map<String, Session> sessionMap = new HashMap<>(); // key : sessionId value : 웹소켓 세션
	private static final Map<Session, String> memberToAdmin = new HashMap<>(); // key : 회원 웹소켓 세션 value : 회원에 할당된 관리자
																				// sessionId
	private String forMemberToAdmin; // 회원과 관리자를 1대1 매칭하기 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(WebSocketChatController.class);
	private HttpSession httpSession; // sessionId 세션 받기

	public WebSocketChatController() {
		// TODO Auto-generated constructor stub

	}

	// @onOpen 는 클라이언트가 웹소켓에 들어오고 서버에 아무런 문제 없이 들어왔을때 실행하는 메소드입니다.
	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
		// id 세션 받아오기
		this.httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		String sessionId = (String) this.httpSession.getAttribute("sessionId");
		logger.info("Open sessionId:" + sessionId);

		// 관리자인 경우
		for (String s : adminList) {
			System.out.println("관리자인 경우");
			if (sessionId.equals(s)) { // 관리자 명단에 있을 경우
				System.out.println("관리자 sessionId : " + sessionId);
				sessionMap.put(sessionId, session); // 세션목록에 추가
				waitingAdminList.add(sessionId); // 대기중인 관리자 목록에 추가
				logger.info("Open sessionId:" + session.getId());

				System.out.println("할당목록에 추가");
				System.out.println("대기중인 관리자 목록에 추가");
				for (String o : waitingAdminList) {
					System.out.println("대기중인 관리자 : " + o);
				}

				try {
					final Basic basic = session.getBasicRemote();
					basic.sendText("채팅이 연결되었습니다.");
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}

				return;
			}
		}
		System.out.println("관리자 수 " + adminList.size() + " 대기 수 " + waitingAdminList.size());
		// 사용자일 경우
		if (waitingAdminList.size() == 0) { // 대기중인 관리자가 없는경우
			try {
				final Basic basic = session.getBasicRemote();
				basic.sendText("채팅가능관리자없음");
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
		} else { // 관리자 할당하기
			System.out.println("회원과 관리자 연결");

			Collections.shuffle(waitingAdminList); // 대기중인 관리자 랜덤으로 섞기
			forMemberToAdmin = waitingAdminList.get(0); // 섞은 관리자 목록 중 첫번째 관리자를 할당
			System.out.println("연결할 관리자" + forMemberToAdmin);

			sessionMap.put(sessionId, session); // 세션목록에 추가
			memberToAdmin.put(session, forMemberToAdmin); // 할당목록에 추가
			waitingAdminList.remove(forMemberToAdmin); // 대기중인 관리자 목록에서 삭제
			System.out.println("할당목록에 추가");
			System.out.println("대기중인 관리자 목록에서 제거");
			try {
				final Basic basic = session.getBasicRemote();
				basic.sendText("채팅이 연결되었습니다.");
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			return;
		}
	}

	/*
	 * 모든 사용자에게 메시지를 전달한다.
	 * 
	 * @param self
	 * 
	 * @param message
	 */

	// sendAllSessionToMessage()는 어떤 누군가에게 메시지가 왔다면 그 메시지를 보낸 자신을 제외한 연결된
	// 세션(클라이언트)에게 메시지를 보내는 메소드입니다.
	private void sendMessageToAdmin(Session self, String message) {
		try {
			String destination = memberToAdmin.get(self);
			Session session = sessionMap.get(destination);
			session.getBasicRemote().sendText(message.split(",,,")[1] + ",,," + message.split(",,,")[0]);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}

	// sendAllSessionToMessage()는 어떤 누군가에게 메시지가 왔다면 그 메시지를 보낸 자신을 제외한 연결된
	// 세션(클라이언트)에게 메시지를 보내는 메소드입니다.
	private void sendMessageToMember(Session self, String message) {
		try {
			String destination = message.split(",,,")[2];
			Session session = sessionMap.get(destination);
			session.getBasicRemote().sendText(message.split(",,,")[1] + ",,," + message.split(",,,")[0]);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}

	// @onMessage 는 클라이언트에게 메시지가 들어왔을 때, 실행되는 메소드입니다.
	@OnMessage
	public void onMessage(String message, Session session) {
		logger.info("Message From " + message.split(",,,")[1] + ": " + message.split(",,,")[0] + " TO : "
				+ message.split(",,,")[2]);
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("나,,," + message.split(",,,")[0]);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		if (message.split(",,,")[2].equals("admin")) {
			System.out.println("관리자로");
			sendMessageToAdmin(session, message); // 회원 -> 관리자
		} else {
			System.out.println("회원으로");
			sendMessageToMember(session, message); // 관리자 -> 회원
		}
	}

	@OnError
	public void onError(Throwable e, Session session) {

	}

	// @onClose 는 클라이언트와 웹소켓과의 연결이 끊기면 실행되는 메소드입니다.
	@OnClose
	public void onClose(Session session) {
		System.out.println("onClose");
		String sessionId = null; // 웹소켓 끊기는 사람의 sessionId
		boolean adminCheck = false; // 관리자 여부 체크
		for (String key : sessionMap.keySet()) {
			Session value = sessionMap.get(key);
			if (value.getId().equals(session.getId())) {
				sessionId = key;
				System.out.println("삭제할 세션의 sessionID는 " + sessionId);
			}
		}

		for (String ad : adminList) { // 웹소켓 세션으로 들어온 사람이 관리자인지 여부 확인
			if (ad.equals(sessionId)) {
				System.out.println("이 사람은 관리자군요");
				adminCheck = true;
			}
		}

		System.out.println("watingAdminList Size " + waitingAdminList.size());
		if (adminCheck) { // 관리자인 경우
			System.out.println("관리자 삭제");
			sessionMap.remove(sessionId); // 세션 목록에서 삭제
			waitingAdminList.remove(sessionId);
			for (Session sessionMember : memberToAdmin.keySet()) {
				if (memberToAdmin.get(sessionMember).equals(sessionId)) {
					try { // 종료되었음을 회원에게 알려주는 메시지
						System.out.println("\n상담원 연결 종료 메시지 보냄");
						sessionMember.getBasicRemote().sendText("상담원과의 연결이 종료되었습니다.");
						memberToAdmin.remove(sessionMember); // 회원과 관리자 연결 삭제
						return;
					} catch (IOException e) {
						e.printStackTrace();
					}

				}
			}

		} else { // 회원인 경우
			System.out.println("회원삭제");
			if (memberToAdmin.get(session) == null) {// 상담원없어서 튕겨진경우
				System.out.println("상담원이 없어서 튕겨짐");
			} else {
				String myAdmin = memberToAdmin.get(session);
				System.out.println(myAdmin + " 이 관리자와 연결을 해제합니다");
				sessionMap.remove(sessionId); // 세션 목록에서 삭제
				memberToAdmin.remove(session); // 회원과 관리자 연결 삭제
				waitingAdminList.add(myAdmin); // 연결이 끊겼으니 회원과 연결했던 관리자를 다시 대기상태로 놓음
				Session sessionAdmin = sessionMap.get(myAdmin);
				try { // 종료되었음을 관리자에게 알려주는 메시지
					sessionAdmin.getBasicRemote().sendText("회원님과의 연결이 종료되었습니다.");
					return;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}
	}
}
