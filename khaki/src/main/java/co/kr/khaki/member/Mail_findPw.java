package co.kr.khaki.member;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail_findPw {
	public void mailSender(MemberDTO memberDTO) {
		// 네이버일 경우 smtp.naver.com 을 입력합니다.
		// Gdoogle일 경우 smtp.gmail.com 을 입력합니다.

		String host = "smtp.gmail.com";
		final String username = "NoreplyKhaki"; // gmail 아이디
		final String password = "khaki1234?"; // gmaiil 비밀번호를 입력해주세요.
		int port = 587; // 포트번호

		// 메일 내용

		String recipient = memberDTO.getEmail_id() + "@" + memberDTO.getEmail_site(); // 받는 사람의 메일주소를 입력해주세요.

		String subject = "[KHAKI] 임시 비밀번호를 발급해드렸습니다."; // 메일 제목 입력해주세요.

		String body = "KHAKI에서 " + memberDTO.getName() +" 회원님의 임시 비밀번호를 발급해드렸습니다.\n\n 회원아이디 : " + memberDTO.getId() + "\n임시 비밀번호 : " + memberDTO.getPw()  
		+ "\n\n해당 비밀번호는 임시로 발급되는 것이므로 로그인 후에는 정보 수정 메뉴에서 새로운 비밀번호로 변경해주십시오."+ "\n\n\n* 본 메일은 KHAKI에서 발송한 메일이며 발신전용 메일입니다. *"; // 메일 내용 입력해주세요.

		Properties props = System.getProperties();

		// 정보를 담기 위한 객체 생성

		// SMTP 서버 정보 설정

		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");

		// Session 생성

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {

			String un = username;

			String pw = password;

			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {

				return new javax.mail.PasswordAuthentication(un, pw);

			}

		});
		try {
			session.setDebug(true); // for debug

			Message mimeMessage = new MimeMessage(session); // MimeMessage 생성

			mimeMessage.setFrom(new InternetAddress("NoreplyKhaki@gmail.com")); // 발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀
																		// 주소를 다 작성해주세요.

			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신자셋팅

			mimeMessage.setSubject(subject); // 제목셋팅

			mimeMessage.setText(body); // 내용셋팅

			Transport.send(mimeMessage); // javax.mail.Transport.send() 이용
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
