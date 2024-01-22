package jobja.webmail.service;


import javax.mail.MessagingException;

import jobja.webmail.vo.WebMailVO;

import java.io.IOException;

public interface WebMailService {

    /**
     * <p>단순 텍스트 기반 메일을 발송 하기 위한 메서드</p>
     * <p>root-context에서 사전에 정의된 메일계정을 이용함</p>
     * @param webMailVO 수신 메일주소, 메일 제목, 메일 내용이 담긴 VO객체
     * @author 만
     */
    void sendSimpleMail(WebMailVO webMailVO);

    /**
     * <p>root-context에서 사전에 정의된 메일계정을 이용하여</p>
     * <p>첨부파일, 참조, 숨은 참조등 일반적인 메일발송의 모든 기능을 구현한 메서드</p>
     * @param webMailVO 메일 발송에 필요한 모든 정보가 담긴 VO객체
     * @author 만
     */
    void sendFullMail(WebMailVO webMailVO) throws MessagingException, IOException;

    /**
     * <p>회원가입, 비밀번호 찾기 등에 사용할 랜덤 비밀번호 혹은</p>
     * <p>인증번호를 이메일로 발송하기 위한 메서드</p>
     *
     * @param mailAddress 메일을 수신받을 이메일 주소
     * @return 발송된 인증코드 혹은 임시비밀번호를 반환
     * @author 만
     */
    String sendAuthenticationCode(String mailAddress) throws MessagingException;
}