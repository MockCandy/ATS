package jobja.mypage.enterprise.service;

import java.util.List;

import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.member.vo.EnterpriseVO;
import jobja.mypage.member.vo.MemberVO;

public interface EntProfileService {

	// 직급가져오기
	public List<ComDetCodeInfoVO> comDetCode();
	
	// 산업군(직군) 가져오기
	public List<ComCodeInfoVO> comSector();
	
	// 관심키워드 가져오기
	public List<ComDetCodeInfoVO> comIntWord();
	
	// 일반정보 가져오기
	public MemberVO detail(String memId);
	
	// 기업정보 가져오기
	public EnterpriseVO entDetail(String memId);
	
	// 일반정보 수정
	public int updatePost(MemberVO memberVO);

	// 기업정보 수정
	public int entUpdatePost(EnterpriseVO enterpriseVO);

}
