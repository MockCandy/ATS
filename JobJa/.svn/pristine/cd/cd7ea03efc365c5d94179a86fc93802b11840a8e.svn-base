package jobja.mypage.enterprise.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jobja.atchfile.controller.FileController;
import jobja.atchfile.mapper.AtchFileDetailMapper;
import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.member.vo.EnterpriseVO;
import jobja.mypage.enterprise.mapper.EntProfileMapper;
import jobja.mypage.enterprise.service.EntProfileService;
import jobja.mypage.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EntProfileServiceImpl implements EntProfileService {

	@Autowired
	EntProfileMapper entProfileMapper;
	
	@Autowired
	AtchFileDetailMapper atchFileDetailMapper;
	
	@Autowired
	FileController fileController;
	
	// 직급 가져오기
	@Override
	public List<ComDetCodeInfoVO> comDetCode() {
		return this.entProfileMapper.comDetCode();
	}
	
	// 산업군 가져오기
	@Override
	public List<ComCodeInfoVO> comSector() {
		return this.entProfileMapper.comSector();
	}
	
	// 관심키워드 가져오기
	@Override
	public List<ComDetCodeInfoVO> comIntWord() {
		return this.entProfileMapper.comIntWord();
	}

	// 일반 정보 가져오기
	@Override
	public MemberVO detail(String memId) {
		return this.entProfileMapper.detail(memId);
	}
	
	// 기업정보 가져오기
	@Override
	public EnterpriseVO entDetail(String memId) {
		return this.entProfileMapper.entDetail(memId);
	}
	
	// 일반정보 수정
	@Override
	public int updatePost(MemberVO memberVO) {
		
		String memThumb = "";
		
		int result = this.entProfileMapper.updatePost(memberVO);
		
		MultipartFile[] uploadFile = memberVO.getUploadFile();
		
		if(uploadFile[0].getOriginalFilename().length()>0) {
			memThumb += this.fileController.saveFileInTomcat(uploadFile, memberVO.getMemId());
			memberVO.setMemAfId(memThumb);
			
			log.info("memberVO.setMemAfId(memThumb) => " + memThumb);
			
			result += this.entProfileMapper.updateThumb(memberVO);
		}
		
		return result;
	}

	// 기업정보 수정
	@Override
	public int entUpdatePost(EnterpriseVO enterpriseVO) {
		
		String entThumb = "";
		
		int result = this.entProfileMapper.entUpdatePost(enterpriseVO);
		
		MultipartFile[] uploadFile = enterpriseVO.getUploadFile();
		
		if(uploadFile[0].getOriginalFilename().length()>0) {
			entThumb += this.fileController.saveFileInTomcat(uploadFile, enterpriseVO.getEntLogo());
			enterpriseVO.setEntLogo(entThumb);
		
			log.info("enterpriseVO.setEntLogo(entThumb) => " + entThumb);

			result += this.entProfileMapper.entUpdateThumb(enterpriseVO);
		}
		
		return result;
	}
	
}


