package jobja.item.service;

import java.util.List;
import java.util.Map;

import jobja.item.vo.ConsultantLogVO;
import jobja.item.vo.ConsultantReviewVO;
import jobja.item.vo.PaymentVO;
import jobja.mypage.member.vo.MemberVO;

public interface ConsultService {

	List<ConsultantLogVO> getLogById(Map<String, Object> map);

	ConsultantLogVO getConsultBycnsltntNo(String cnsltntNo);

	int getTotalById(Map<String, Object> map);

	List<ConsultantReviewVO> getCnsltntRevByCnsltntId(Map<String, Object> map);

	int getRevTotalByCnsltntId(Map<String, Object> map);
	
	//마이페이지 나의 상담기록 가져오기.
	public List<MemberVO> getMyConsultantLog(String memId);
	
	//가져온 상담 기록에서 기록 보기 눌렀을 때 상담사가 기록한 코멘트 보기
	public ConsultantLogVO ajaxgetOneReview(String cnsltntNo);
	
	//마이페이지 리뷰 작성 전 info 가져옴.
	public PaymentVO ajaxgetReviewInfo(String payNo);
	
	//마이페이지 리뷰 등록
	public int ajaxinsertReview(ConsultantReviewVO consultantReviewVO);

	//상담 기록 남기기 위해 pay정보 가져오기.
	public PaymentVO getPayLog(Map<String, String> chatRoom);
	
	//상담기록 등록
	int insertConsultantLog(ConsultantLogVO consultantLogVO);

	// 상담사 회원 리스트 출력
	public List<MemberVO> consultantList(Map<String, Object> map);

	// 일반회원이 상담사의 대표이력서 조회
	public String getRepResumeNo(String memId);

	// 상담사 수
	public int totalCounsel(Map<String, Object> map);

	List<ConsultantReviewVO> getConsultReview(Map<String, Object> map);

	ConsultantReviewVO getConsultRevByReviewNo(String reviewNo);

}
