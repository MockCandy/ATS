package jobja.webmail.vo;


import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class WebMailVO {

    private String[] mailToAddress;  //메일 수신 주소
    private String[] mailCCAddress;  //메일 참조 주소
    private String[] mailBCCAddress;  //메일 숨은 참조 주소
    private String mailTitle;        //메일 제목
    private String mailContent;      //메일 내용

    private MultipartFile[] mailFiles; //첨부 파일
}

