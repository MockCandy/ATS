package jobja.webmail.service.impl;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import jobja.webmail.service.WebMailService;
import jobja.webmail.vo.WebMailVO;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

@Slf4j
@Service
public class WebMailServiceImpl implements WebMailService {

    @Autowired
    JavaMailSenderImpl mailSender;

    @Override
    public void sendSimpleMail(WebMailVO webMailVO) {
        SimpleMailMessage message = new SimpleMailMessage();

        //메일 수신 주소 설정
        message.setTo(webMailVO.getMailToAddress());
        //메일 참조 주소 설정
        message.setCc(webMailVO.getMailCCAddress());
        //메일 숨은 참조 주소 설정
        message.setBcc(webMailVO.getMailBCCAddress());
        //메일 제목 설정
        message.setSubject(webMailVO.getMailTitle());
        //메일 본문 설정
        message.setText(webMailVO.getMailContent());

        //메일 발송 처리
        mailSender.send(message);
    }

    @Override
    public void sendFullMail(WebMailVO webMailVO) throws IOException, MessagingException {
        MimeMessage message = mailSender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setSubject(webMailVO.getMailTitle());
        /*
            메일 내용 설정
            만약 html태그가 포함된 메일 내용이라면 2번째 인수로 html사용 설정
            html사용여부가 true일때는 개행문자가 동작하지 않으므로 개행시에 <br>태그가 필요
         */
        helper.setText(webMailVO.getMailContent(), false);
        // 메일 수신주소 설정
        helper.setTo(webMailVO.getMailToAddress());
        // 메일 참조주소 설정
        helper.setCc(webMailVO.getMailCCAddress());
        // 메일 숨은참조 주소 설정
        helper.setBcc(webMailVO.getMailBCCAddress());

        //첨부파일 처리
        for (MultipartFile file : webMailVO.getMailFiles()) {
            if (!file.isEmpty()) {
                String fileName = StringUtils.cleanPath(file.getOriginalFilename());
                helper.addAttachment(MimeUtility.encodeText(fileName, "UTF-8", "B")
                        , new ByteArrayResource(IOUtils.toByteArray(file.getInputStream())));
            }
        }
        mailSender.send(message);
    }

    @Override
    public String sendAuthenticationCode(String mailAddress) throws MessagingException {
    	   MimeMessage message = mailSender.createMimeMessage();

           MimeMessageHelper helper = new MimeMessageHelper(message);

           SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일", Locale.KOREA);
           
           Date currentDate = new Date();
           
           String formattedDate = dateFormat.format(currentDate);
           
//           Date formattedDateAsDate = null;
//   		try {
//   			formattedDateAsDate = dateFormat.parse(formattedDate);
//   			log.info("formattedDateAsDate" + formattedDateAsDate);
//   		} catch (java.text.ParseException e) {
//   			e.printStackTrace();
//   		}
           
           //메일 수신주소 설정
           helper.setTo(mailAddress);
           //메일 제목 설정
           helper.setSubject("[날 JOB아줘] 입사제안서 발송입니다.");



        String str = "<div><div style=\"width:100%;background-color:#eee\">";
        	   str += "<div style=\"width:100%;background-color:#eee\">";
        	   str += "<div style=\"max-width:640px;margin:0 auto;background-color:#fff;\">";
        	   str += "<div style=\"max-width:600px;margin:0 auto;background-color:#fff;\">";
        	   str += "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:100%;height:70px;border-collapse:collapse;font-size:12px;font-family:'Malgun Gothic','Apple SD Gothic Neo',Arial,Dotum,Gulim,sans-serif\">";
        	   str += "<tbody><tr><td><a href=\"#\" target=\"_blank\" style=\"color:#00c362 ;font-size:35px; font-family: 'MBC1961GulimM';src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/MBC1961GulimM.woff2')format('woff2');font-weight: normal;\" rel=\"noreferrer noopener\">날 JOB아줘</a></td></tr></tbody></table>";
        	   str += "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:100%;border-collapse:collapse;font-size:12px;font-family:'Malgun Gothic','Apple SD Gothic Neo',Arial,Dotum,Gulim,sans-serif;letter-spacing:-1px;color:#222\">";
        	   str += "<tbody><tr><td style=\"padding:21px 30px 23px;font-size:30px;font-family:'Malgun Gothic','Apple SD Gothic Neo',Arial,Dotum,Gulim,sans-serif;letter-spacing:-2px;text-align:center;color:#fff;word-break:keep-all;background-color:#3366cc;\">";
        	   str += "<strong style=\"font-size:35px; color:#fff; font-family: 'MBC1961GulimM';src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/MBC1961GulimM.woff2')format('woff2');font-weight: normal;\">'날 JOB아줘'</strong> 입사제안서";
        	   str += "<span style=\"display:block;margin-top:10px;font-size:17px;font-family:'Malgun Gothic','Apple SD Gothic Neo',Arial,Dotum,Gulim,sans-serif;letter-spacing:-1px;text-align:center; font-weighr:bold; color:#fff;word-break:keep-all\">입사제안서를 열람한후 신중히 결정해주세요.</span>";
        	   str += "</td></tr><tr><td height=\"20\"></td></tr></tbody></table>";
        	   str += "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:100%;font-size:15px;font-family:'Malgun Gothic','Apple SD Gothic Neo',Arial,Dotum,Gulim,sans-serif;letter-spacing:-1px\">";
        	   str += "<tbody><tr><td style=\"padding:20px 0 20px 20px;font-size:15px;font-family:'Malgun Gothic','Apple SD Gothic Neo',Arial,Dotum,Gulim,sans-serif;letter-spacing:-1px;text-align:right;color:#222;background-color:#fff\">";
        	   str += "발송일시 : " + formattedDate +"<br><br><a href='https://drive.google.com/file/d/13IEPLtzBP5L9ryhy0yf9UxB-WdyXCZ0K/view?usp=drive_link'>입사지원서 다운로드</a>";
        	   str += "</td></tr></tbody></table>";
        	   str += "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:100%;margin:20px 0 0;border-collapse:collapse;font-size:12px;font-family:'Malgun Gothic','Apple SD Gothic Neo',Arial,Dotum,Gulim,sans-serif;letter-spacing:-1px;color:#888\">";
        	   str += "<tbody><tr><td style=\"padding:20px;background-color:#f0f0f0\">";
        	   str += "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:100%;border-collapse:collapse;font-size:12px;font-family:'Malgun Gothic','Apple SD Gothic Neo',Arial,Dotum,Gulim,sans-serif;letter-spacing:-1px;color:#888\">";
        	   str += "<tbody><tr><td style=\"font-size:12px;font-family:'Malgun Gothic','Apple SD Gothic Neo',Arial,Dotum,Gulim,sans-serif;line-height:1.5;word-break:keep-all;color:#888\">";
        	   str += "<tbody><tr><td style=\"font-size:12px;font-family:'Malgun Gothic','Apple SD Gothic Neo',Arial,Dotum,Gulim,sans-serif;line-height:1.5;word-break:keep-all;color:#888\">";
        	   str += "<strong style=\"font-size:12px;font-family:'Malgun Gothic','Apple SD Gothic Neo',Arial,Dotum,Gulim,sans-serif;color:#888\">본 메일은 발신전용이므로 회신하실 경우 답변이 되지 않습니다.</strong><br>";
        	   str += "궁금하신 사항은 <strong style=\"font-size:12px;font-family:'Malgun Gothic','Apple SD Gothic Neo',Arial,Dotum,Gulim,sans-serif;color:#888\">고객센터</strong>로 문의해 주시기 바랍니다.";
        	   str += "</td></tr></tbody></table>";
        	   str += "</td></tr></tbody></table>";
        	   str += "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:100%;border-collapse:collapse;font-size:12px;line-height:18px;font-family:'Malgun Gothic','Apple SD Gothic Neo',Arial,Dotum,Gulim,sans-serif;letter-spacing:-1px;color:#888\">";
        	   str += "<tbody><tr><td height=\"20\"></td></tr><tr><td style=\"font-size:12px;font-family:'Malgun Gothic','Apple SD Gothic Neo',Arial,Dotum,Gulim,sans-serif;text-decoration:none;word-break:keep-all;color:#888\">";
        	   str += "<strong style=\"font-size:12px;font-family:'Malgun Gothic','Apple SD Gothic Neo',Arial,Dotum,Gulim,sans-serif;text-decoration:none;color:#888\">(주)미디어윌네트웍스</strong> 서울특별시 강남구 테헤란로 322 동관 20층 | 대표이사 : 김병섭 | 사업자등록번호 : 617-81-48252 | 통신판매업신고 : 제2011-서울강남-03265호 | 직업정보제공사업신고번호 : 서울강남 제2008-30호<br>";
        	   str += "고객센터 : 1661-2288 | FAX : 02-6455-8955 | E-mail : help@alba.co.kr<br>";
        	   str += "copyright ⓒ 미디어윌네트웍스. All Rights Reversed.";
        	   str += "</td></tr><tr><td height=\"20\"></td></tr></tbody></table></div></div></div></div>";

        	   helper.setText(str, true);

        //메일 발송 처리
        mailSender.send(message);

        return str;
    }

}
