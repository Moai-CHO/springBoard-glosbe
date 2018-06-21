package ml.learningmachine.util.mailAuth;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendAuthEmail {
    public void sendMail(String token) {
        System.out.println("send mail start");
        String host = "smtp.naver.com";
        final String username = "magictown_"; // ID입력
        final String password = "gkemxmfjr1!@";
        int port = 465; //포트번호
        String recipient = "p.gorilla21@gmail.com"; //받는 사람 메일 입력
        String subject = "메일테스트"; //메일 제목
        String body = username + "님으로 부터 메일을 받았습니다." +
                "" + token + " ::     토큰값 입니다 "; //메일 내용.


        Properties props = System.getProperties();

        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", host);

        // 세션 생성
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(username, password);
            }
        });
        session.setDebug(false); //for debug
        Message mimeMessage = new MimeMessage(session); //MimeMessage 생성
        try {
            mimeMessage.setFrom(new InternetAddress("magictown_@naver.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음

            mimeMessage.setSubject(subject); //제목셋팅
            mimeMessage.setText(body); //내용셋팅
            Transport.send(mimeMessage); //javax.mail.Transport.send() 이용
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public String createToken() { // 토큰 생성
        StringBuffer buffer = new StringBuffer();

        for (int i = 0; i < 8; i++) {
            if ((int) (Math.random() * 2) % 2 == 0) {
                char ch = (char) ((Math.random() * 26) + 97);
                buffer.append(ch); // 알파벳 생성
            } else {
                buffer.append((int) (Math.random() * 10)); // 수 생성
            }
        }


        return buffer.toString(); // 토큰값 반환
    }

}
