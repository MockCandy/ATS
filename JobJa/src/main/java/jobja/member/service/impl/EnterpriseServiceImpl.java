package jobja.member.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import jobja.atchfile.controller.FileController;
import jobja.atchfile.mapper.AtchFileDetailMapper;
import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.board.vo.BoardEntReviewVO;
import jobja.member.mapper.EnterpriseMapper;
import jobja.member.mapper.MemberAuthMapper;
import jobja.member.service.EnterpriseService;
import jobja.member.vo.EntAprvVO;
import jobja.member.vo.EnterpriseVO;
import jobja.member.vo.InterestEnterpriseVO;
import jobja.member.vo.InterestRecruitVO;
import jobja.mypage.member.mapper.MemberMapper;
import jobja.mypage.member.vo.MemberVO;
import jobja.report.vo.ReportVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EnterpriseServiceImpl implements EnterpriseService {
	
	@Autowired
	EnterpriseMapper enterpriseMapper;
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	MemberAuthMapper memberAuthMapper;
	
	@Autowired
	FileController fileController;
	
	@Autowired
	AtchFileDetailMapper atchFileDetailMapper;
	
	@Transactional
	@Override
	public int createPost(EnterpriseVO enterpriseVO,MemberVO memberVO) {
		
		log.info("enterprise -> createPost : " + enterpriseVO);
		
		MultipartFile[] uploadFile = enterpriseVO.getUploadFile();
		
		int result = this.memberMapper.createPostEnt(memberVO);
				
		result += fileController.uploadFile(uploadFile, enterpriseVO.getEntNo());
		
		String afdSaveNm = atchFileDetailMapper.getAfdSaveNm(enterpriseVO.getEntNo());
		
		log.info("createPost -> afdSaveNm : " + afdSaveNm);
		
		enterpriseVO.setEntLogo(afdSaveNm);
		
		result += this.memberAuthMapper.createPostEntAuth(memberVO.getMemId());
		
		result += this.enterpriseMapper.createPost(enterpriseVO);
		
		//회원가입시 기업승인 테이블에 추가.
		//상의 후 commit 결정
		EntAprvVO entAprvVO = new EntAprvVO();
		entAprvVO.setMemId(memberVO.getMemId());
		entAprvVO.setEntNo(enterpriseVO.getEntNo());
		entAprvVO.setEntMgPosition(memberVO.getMemMgPosition());
		
		log.info("ㅇㅇㅇㅇㅇentAprvVo : " + entAprvVO);
		
		result += this.enterpriseMapper.insertEntAprv(entAprvVO);
		
		log.info("enterprise -> result : " + result);
		
		return result;
	}


	@Override
	public List<EnterpriseVO> getAjaxEntList(EnterpriseVO enterpriseVO) {
		return enterpriseMapper.getAjaxEntList(enterpriseVO);
	}


	@Override
	public List<EnterpriseVO> list(Map<String, Object> map) {
		return enterpriseMapper.list(map);    
	}


	@Override
	public List<EnterpriseVO> list5(Map<String, Object> map) {
		return enterpriseMapper.list5(map);
	}


	@Override
	public List<InterestEnterpriseVO> getInterestEnt(MemberVO memberVO) {
		return enterpriseMapper.interestList(memberVO);
	}


	@Override
	public int ajaxInterestEnt(InterestEnterpriseVO interestEnterpriseVO) {
		return enterpriseMapper.ajaxInterestEnt(interestEnterpriseVO);
	}


	@Override
	public int ajaxInterestEntAdd(InterestEnterpriseVO interestEnterpriseVO) {
		return enterpriseMapper.ajaxInterestEntAdd(interestEnterpriseVO);
	}


	@Override
	public int ajaxInterestEntDel(InterestEnterpriseVO interestEnterpriseVO) {
		return enterpriseMapper.ajaxInterestEntDel(interestEnterpriseVO);
	}


	@Override
	public int getStoredEnt(InterestEnterpriseVO interestEnterpriseVO) {
		return enterpriseMapper.getStoredEnt(interestEnterpriseVO);
	}


	@Override
	public int count(Map<String, Object> map) {
		return enterpriseMapper.count(map);
	}


	@Override
	public EnterpriseVO getOne(Map<String, Object> map) {
		return enterpriseMapper.getOne(map);
	}


	@Override
	public EnterpriseVO getAjaxEntOne(EnterpriseVO enterpriseVO) {
		return enterpriseMapper.getAjaxEntOne(enterpriseVO);
	}


	@Override
	public List<EnterpriseVO> ajaxGetEntOneYearly(EnterpriseVO enterpriseVO) {
		return enterpriseMapper.ajaxGetEntOneYearly(enterpriseVO);
	}

	//마이페이지 스크랩했던 관심기업 가져오기
	@Override
	public List<EnterpriseVO> myEntList(Map<String, Object> map) {
		return this.enterpriseMapper.myEntList(map);
	}
	
	//마이페이지 스크랩했던 관심기업 총 갯수
	@Override
	public int getMytotal(Map<String, Object> map) {
		return this.enterpriseMapper.getMytotal(map);
	}

	//마이페이지 스크랩했던 관심기업 삭제
	@Override
	public int ajaxdeleteEnterprise(InterestEnterpriseVO interestEnterpriseVO) {
		return this.enterpriseMapper.ajaxdeleteEnterprise(interestEnterpriseVO);
	}

	//마이페이지 삭제했던 관심기업 다시 추가
	@Override
	public int ajaxinsertEnterprise(InterestEnterpriseVO interestEnterpriseVO) {
		return this.enterpriseMapper.ajaxinsertEnterprise(interestEnterpriseVO);
	}
	
	@Override
	public int getTotal(Map<String, Object> map) {
		return enterpriseMapper.getTotal(map);
	}

	// 기업 리뷰 목록
	@Override
	public List<BoardEntReviewVO> brdEnterpriseVOList(String entNo) {
		return enterpriseMapper.brdEnterpriseVOList(entNo);
	}
	
	// 기업 리뷰 통계
	@Override
	public EnterpriseVO entReviewAvg(String memId) {
		return enterpriseMapper.entReviewAvg(memId);
	}


	@Override
	public String getEntNm(String entNo) {
		
		return enterpriseMapper.getEntNm(entNo);
	}


	@Override
	public List<EnterpriseVO> getEntOfferList(String memId) {

		return this.enterpriseMapper.getEntOfferList(memId);
	}


	@Override
	public List<ReportVO> getReportVo(Map<String, Object> map) {
		
		return this.enterpriseMapper.getReportVO(map);
	}
	
}
