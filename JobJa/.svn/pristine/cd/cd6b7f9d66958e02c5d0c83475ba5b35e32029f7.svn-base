package jobja.mypage.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jobja.application.service.ApplicationService;
import jobja.atchfile.mapper.AtchFileDetailMapper;
import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.board.service.BoardEntReviewService;
import jobja.board.vo.BoardEntReviewVO;
import jobja.common.mapper.ComCodeMapper;
import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.member.service.EnterpriseService;
import jobja.member.service.PortfolioService;
import jobja.member.service.ResumeService;
import jobja.member.vo.ApplicationVO;
import jobja.member.vo.EnterpriseVO;
import jobja.mypage.member.service.MemberService;
import jobja.mypage.member.vo.MemberVO;
import jobja.util.ModelAttributeUtil;
import jobja.recruit.service.RecruitService;
import jobja.recruit.vo.BenefitsVO;
import jobja.recruit.vo.RecruitFormVO;
import jobja.recruit.vo.RecruitVO;
import jobja.sort.vo.JobOfferFilterVO;
import jobja.util.ArticlePage;


import lombok.extern.slf4j.Slf4j;

@RequestMapping("/enter")
@Slf4j
@Controller
public class EntMyPageController {
	
	@Autowired
	ModelAttributeUtil modelAttributeUtil;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	BoardEntReviewService boardEntReviewService;
	
	@Autowired
	ComCodeMapper comCodeMapper;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	RecruitService recruitService;
	
	@Autowired
	ApplicationService applicationService;
	
	@Autowired
	AtchFileDetailMapper atchFileDetailMapper;
	
	@Autowired
	ResumeService resumeService;
	
	@Autowired
	PortfolioService portfolioService;
	
	// 기업 마이페이지
	@GetMapping("/mypage")
	public String entMypage() {
		
		return "mypageEnt/entMyPage";
	}
	
	/**
	 * 기업 파일함
	 * @param model
	 * @return
	 * 
	 */
//	@GetMapping("/filepage")
//	public String filePage(Model model) {
//		
//		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
//		String memId = memberVO.getMemId();
//		
//		List<AtchFileDetailVO> atchDtVOList = this.memberService.atchDtList(memId);
//
//		memberVO.setAtchfileDetailVO(atchDtVOList);
//		
//		log.info("list => atchDtVOList : " +atchDtVOList);
//		log.info("list => memberVO : " +memberVO);
//		
//		model.addAttribute("memberVO",memberVO);
//		
//		return "mypageEnt/entSaveFile";
//	}
	
	/**
	 * ajax 파일첨부함 파일 추가
	 * entNo으로 넘기고 싶었는데 실패..
	 * @param uploadFile
	 * @return
	 */
//	@PostMapping("/entUploadFile")
//	@ResponseBody
//	public List<AtchFileDetailVO> uploadFile(@RequestParam("uploadFile") MultipartFile[] uploadFile) {
//	    
//	    log.info("uploadFile -> uploadFile : " + uploadFile);
//	    
//	    MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
//	    memberVO.setUploadFile(uploadFile);
//	    
//	    log.info("uploadFile -> memberVO.getUploadFile() : " + memberVO.getUploadFile());
//	    List<AtchFileDetailVO> atchFileDetailList = new ArrayList<>(); // 리스트 생성
//	    
//	    try {
//	        for (MultipartFile file : uploadFile) {
//	            if (!file.isEmpty()) {
//	                
//	                log.info("uploadFile => if문 안임");
//	                
//	                AtchFileDetailVO atchFileDetailVO = memberService.uploadFileKeyCheck(memberVO);
//	                log.info("uploadFile => atchFileDetailVO 들어가면 이거 나옴 : " + atchFileDetailVO);
//	                
//	                String memId = memberVO.getMemId();
//	                
//	                // 단일 파일 정보를 가져오는 대신 리스트를 가져오도록 변경
//	                List<AtchFileDetailVO> fileDetailList = this.memberService.atchFileDtVO(memId);
//	                log.info("uploadFile => fileDetailList : " + fileDetailList);
//	                
//	                // 가져온 리스트를 전체 리스트에 추가
//	                atchFileDetailList.addAll(fileDetailList);
//	            }
//	        }
//
//	        return atchFileDetailList;
//	        
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        return atchFileDetailList; // 예외 발생 시 빈 리스트 반환
//	    }
//	}

    
	/**
	 * 파일 첨부함 파일 삭제
	 * @param atchFileDetailVO
	 * @return
	 */
    // AtchFileDetailVO(afdSeq=9, afId=a111, ...
//    @PostMapping("/deleteFileAjax")
//    @ResponseBody
//    public String deleteFileAjax(@RequestBody AtchFileDetailVO atchFileDetailVO) {
//    	
////    	MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
//    	
//    	log.info("deleteFileAjax -> atchFileDetailVO : " +atchFileDetailVO);
//    	
//    	try {
//    		// 서비스를 통해 파일을 데이터베이스에서 삭제
//    		int result = memberService.deleteFileAjax(atchFileDetailVO);
//    		log.info("deleteFileAjax -> result : " + result);
//    		
//    		return "File deleted successfully!";
//    	} catch (Exception e) {
//    		e.printStackTrace();
//    		return "File deletion failed";
//    	}
//    }
	
	/**
	 * 채용공고 목록
	 * @param entNo
	 * @param model
	 * @return
	 */
//	@GetMapping("/recruit")
//	public String recruitList(String entNo, Model model) {
//		
//		// 현재 로그인한 회원 정보
//		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
//		String memId = memberVO.getMemId();
//		log.info("recruit -> memberVO : " + memberVO);
//		
//		List<RecruitVO> recruitVO = this.recruitService.recruitList(memId);
//		log.info("recruit -> recruitVO : " +recruitVO);
//		
//	    // 해당 기업의 총 리뷰 개수
//	    int totalReviewCount = boardEntReviewService.getTotalCount(entNo);
//	    
//	    model.addAttribute("recruitVO", recruitVO);
//	    model.addAttribute("totalReviewCount", totalReviewCount);
//	    
//	    return "mypageEnt/entRecruitList";
//	}
	
	/**
	 * 채용 공고 디테일 
	 */
//   @GetMapping("/{recruitNo}/detail")
//   public String detail(@PathVariable("recruitNo") String recruitNo , Model model) {
//	   
//	   // 회원 아이디
//	   MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
//	   
//	   log.info("recruitNo : " + recruitNo);
//	   // 채용 공고 상세정보
//	   RecruitVO recruitVO = recruitService.getByRecNo(recruitNo);
//	   log.info("recruitVO : " + recruitVO);
//
//	   // 직무 공통코드로 불러오기
//	   ComCodeInfoVO job = comCodeMapper.getComDetCodeInfo(recruitVO.getRecruitJob());
//	   log.info("job : " + job);
//
//	   // 고용형태 공통코드로 불러오기
//	   ComCodeInfoVO workType = comCodeMapper.getComDetCodeInfo(recruitVO.getRecruitWorkType());
//	   log.info("workType : " + workType);
//
//	   // 인사 담당자 직급 가지고 오는것 
//	   ComCodeInfoVO level = comCodeMapper.getComDetCodeInfo2(recruitVO.getRecruitLevel());
//	   
//	   // 혜택 및 복지 정보
//	   List<BenefitsVO> benefitsVOList = recruitService.getBenefits(recruitNo);
//	   log.info("benefitsVOList : " , benefitsVOList);
//	   
//	   // 첨부파일 리스트
//	   List<AtchFileDetailVO> atchFileList = atchFileDetailMapper.getAtchByAfId(recruitNo);
//
//	   model.addAttribute("recruitVO", recruitVO);
//	   model.addAttribute("benefitsVOList", benefitsVOList);
//	   model.addAttribute("job", job);
//	   model.addAttribute("level", level);
//	   model.addAttribute("workType", workType);
//	   model.addAttribute("atchFileList", atchFileList);
//	   
//	   return "mypageEnt/entRecruitDetail";
//   }
	
	/**
	 * 채용공고 등록
	 * @param recruitFormVO
	 * @param model
	 * @return
	 */
//	@GetMapping("/recruitCreate")
//	   public String recruitCreate(RecruitFormVO recruitFormVO, Model model) {
//	      
//		 List<ComCodeInfoVO> comCodeInfoVOList = this.recruitService.getComCode();
//	      
//	      //학력 공통 코드 가지고 오는것
//	      List<ComDetCodeInfoVO> comCodeAb = this.recruitService.getComCodeInfoa();
//	      
//	      //고용형태 가지고 오는것 
//	      List<ComDetCodeInfoVO> comCodeAC = this.recruitService.getComCodeInfob();
//	      
//	      // 인사 담당자 직급 가지고 오는것 
//	      List<ComDetCodeInfoVO> comCodeAd = this.recruitService.getComCodeInfod();
//	      
//	      MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
//	      
//	      
//	      String memId = memberVO.getMemId();
//	      
//	      log.info("memIdZZZ:"+memId);
//	      String entNo = this.recruitService.getEntNo(memId);
//	      log.info("memIdZZZz:"+entNo);
//	      recruitFormVO.setComCodeInfoVOList(comCodeInfoVOList);
//	      recruitFormVO.setComCodeAb(comCodeAb);
//	      recruitFormVO.setComCodeAC(comCodeAC);
//	      recruitFormVO.setComCodeAd(comCodeAd);
//	      recruitFormVO.setEntNo(entNo);
//	      
//	      
//	      model.addAttribute("recruitFormVO", recruitFormVO);
//
//	      log.info("comCodeInfoVOListikjjij :" +recruitFormVO.getEntNo());
//	      log.info("comCodeInfoVOListikjjijZZZ :" +comCodeAb);
//	      log.info("comCodeInfoVOListikjjijZZZaa :" +comCodeAb);
//	      log.info("comCodeInfoVOListikjjijZZZaa :" +comCodeAC);
//	      log.info("comCodeInfoVOList comCodeAd @@@ :" +comCodeAd);
//	      log.info("comCodeInfoVOListikjjijZZZaa :" + recruitFormVO.getBenCd());
//	      
//	      return "mypageEnt/entRecruitCreate";
//	}
	
	/**
	 * 지원자 현황의 채용공고 목록
	 * @param model
	 * @param keyword
	 * @param currentPage
	 * @return
	 */
//	@GetMapping("/application")
//	public String applicationRecList(Model model,
//			@RequestParam(value = "keyword",required = false) String keyword,	
//			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
//			) {
//		
//		log.info("applicationRecList -> keyword : " + keyword);
//		log.info("applicationRecList -> currentPage : " + currentPage);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("currentPage", currentPage);
//		map.put("keyword", keyword);
//		
//		// 현재 로그인한 회원 정보
//		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
//		String memId = memberVO.getMemId();
//		log.info("recruitVOList -> memberVO : " + memberVO);
//		int appCount = 0;
//		
//		// 채용공고 목록
//		List<RecruitVO> recruitVOList = this.recruitService.recruitList(memId);
//		log.info("recruitVOList -> recruitVO : " +recruitVOList);
//		
//		// 공통코드 - 지원상태코드
//		List<ComDetCodeInfoVO> comDetCodeInfoVOList = this.applicationService.comDetCdState();
//		
//		// 입사 관련
//		List<ApplicationVO> applicationVOList = this.applicationService.applicationVOList();
//		log.info("recruit -> applicationVOList : " +applicationVOList);
//		
//		int total = this.recruitService.getTotal(map);
//		log.info("recruitVOList -> total : " +total);
//		
//		map.put("recruitVOList", recruitVOList);
//		map.put("applicationVOList", applicationVOList);
//		map.put("appCount", appCount);
//
//		// 채용공고 목록
//		ArticlePage<RecruitVO> data = new ArticlePage<RecruitVO>(total, currentPage, 10, 5, recruitVOList );
//		log.info("recruitVOList -> data : " +data);
//		
//		data.setUrl("/enter/application");
//
//		model.addAttribute("recruitVO", recruitVOList);
//		model.addAttribute("comDetCodeInfoVO", comDetCodeInfoVOList);
//		model.addAttribute("applicationVO", applicationVOList);
//		model.addAttribute("appCount", appCount);
//		model.addAttribute("data", data);
//		
//		return "mypageEnt/entApplicationList";
//	}
	
//	/**
//	 * 지원자 상태 변경
//	 * @param applicationVO
//	 * @param model
//	 * @return
//	 */
///*	 let data = {
//		"appNo":APP00014,
//		"appStateCd":APP01004
//	}; 								*/
//	@ResponseBody
//	@PostMapping("/appUpdate")
//	public int applicationUpdate(@RequestBody ApplicationVO applicationVO, Model model) {
//		
//	   	int result = this.applicationService.updatePost(applicationVO);
//		log.info("applicationUpdate -> updatePost : "+result);
//		
//		return result;
//	}
//	
//	/**
//	 * 지원자 목록
//	 * @param recNo
//	 * @param keyword
//	 * @param currentPage
//	 * @param model
//	 * @return
//	 */
//	@GetMapping("/applicationList")
//	public String applicationList(String recNo
//			, @RequestParam(value="keyword",required=false) String keyword
//			, @RequestParam(value="currentPage",required=false, defaultValue="1") int currentPage
//			, Model model) {
//		
//		log.info("applicationList -> keyword : " + keyword);
//		log.info("applicationList -> currentPage : " + currentPage);
//		
//		int size = 10;
//		int pageSize = 5;
//		
//	    MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
//	    String memId = memberVO.getMemId();
//	    log.info("applicationList -> memberVO: " + memId);
//
//	    List<RecruitVO> recruitVOList = recruitService.recruitList(memId);
//	    log.info("applicationList -> recruitVOList: " + recruitVOList);
//
//	    Map<String, Object> map = new HashMap<String, Object>();
//	    map.put("recruitNo", recNo);
//	    map.put("keyword",keyword);
//	    map.put("currentPage",currentPage);
//	    
//	    List<ApplicationVO> applicationVOList = applicationService.applicationList(map);
//	    log.info("applicationList -> applicationVOList: " + applicationVOList);
//
//	    // 지원자 상태 공통코드
//	    List<ComDetCodeInfoVO> comDetCodeInfoVOList = applicationService.comDetCdState();
//	    log.info("applicationList -> comDetCodeInfoVOList: " + comDetCodeInfoVOList);
//
//	    int total = this.applicationService.getTotal(map);
//	    
//	    ArticlePage<ApplicationVO> data = new ArticlePage<ApplicationVO>(total, currentPage, size, pageSize, applicationVOList);
//		log.info("applicationList - > data"+data);
//		
//	    data.setUrl("/enter/applicationList");
//	    
//	    model.addAttribute("recruitVO", recruitVOList);
//	    model.addAttribute("applicationVO", applicationVOList);
//	    model.addAttribute("comDetCodeInfoVO", comDetCodeInfoVOList);
//	    model.addAttribute("data", data);
//
//	    return "mypageEnt/applicationList";
//	}

	
	/**
	 * 채용 일정 관리
	 * @return
	 */
//	@GetMapping("/calendar")
//	public String calendar() {
//		
//		return "mypageEnt/entCalendar";
//	}
	
	/**
	 * 맞춤인재 (입사제안)
	 * @param model
	 * @param jobOfferFilterVO
	 * @param currentPage
	 * @return
	 * @throws JsonProcessingException
	 */
//	@GetMapping("/jobOffer")
//	public String jobOffer(Model model,
//			JobOfferFilterVO jobOfferFilterVO,
//			@RequestParam(value = "currentPage",required = false, defaultValue = "1") int currentPage) throws JsonProcessingException {
//		
//		log.info("jobOfferFilterVO : " + jobOfferFilterVO);
//		
//		int size = 12;
//		int pageSize = 5;
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("currentPage", currentPage);
//		map.put("size", size);
//		
//		List<ComCodeInfoVO> comCodeInfoVOList = recruitService.getComCode();
//		log.info("comCodeInfoVOList : "+ comCodeInfoVOList);
//		
//		List<ComDetCodeInfoVO> comCodeAb = this.recruitService.getComCodeInfoa();
//		log.info("comCodeAb : "+ comCodeAb);
//		
//
//		log.info("livingLocation -> "+ jobOfferFilterVO.getLivingLocation());
//		log.info("wishJobs ->"+ jobOfferFilterVO.getWishJobs());
//		log.info("acdmCrs ->"+ jobOfferFilterVO.getAcdmCrs());
//		
//		log.info("comCodeInfoVOList -> "+ comCodeInfoVOList);
//		
//		if (jobOfferFilterVO.getWishJobs() != null) {
//		    map.put("wishJobs", jobOfferFilterVO.getWishJobs());
//		}
//		if (jobOfferFilterVO.getLivingLocation() != null) {
//		    map.put("livingLocation", jobOfferFilterVO.getLivingLocation());
//		}
//
//		log.info("map -> " + map);
//		
//		List<MemberVO> memberVOList = memberService.getRecommMemList(map);
//		log.info("memberVOList", memberVOList);
//		
//
//		String wishJobsJson = new ObjectMapper().writeValueAsString(jobOfferFilterVO.getWishJobs());
//		log.info("wishJobsJson : "+wishJobsJson);
//		
//		int total = memberService.getRecommMemCount(map);
//		
//		ArticlePage<MemberVO> data = new ArticlePage<MemberVO>(total, currentPage, size, pageSize, memberVOList);
//		
//
//		data.setUrl("/enter/jobOffer");
//		data.setRecruitJobs(jobOfferFilterVO.getWishJobs() );
//		data.setRecruitLocation(jobOfferFilterVO.getLivingLocation());
//		
//		model.addAttribute("livingLocation", jobOfferFilterVO.getLivingLocation());
//		model.addAttribute("wishJobs", jobOfferFilterVO.getWishJobs());
//		model.addAttribute("wishJobsJson", wishJobsJson);   
//		model.addAttribute("comCodeInfoVOList", comCodeInfoVOList);
//		model.addAttribute("comCodeAb", comCodeAb);
//		model.addAttribute("memberVOList", memberVOList);
//		model.addAttribute("data", data);
//		
//		return "mypageEnt/entJobOffer";
//	}
	
	/**
	 * 기업 리뷰
	 * @param model
	 * @param entNo
	 * @param boardEntReviewVO
	 * @return
	 */
	@GetMapping("/review")
	public String review(Model model,String entNo, BoardEntReviewVO boardEntReviewVO) {
		
		// 현재 로그인한 회원 정보
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		
		// 리뷰 목록
		List<BoardEntReviewVO> brdEntReviewVOList = this.boardEntReviewService.brdEnterpriseVOList(memId);
		log.info("enterReview -> brdEntReviewVOList : " + brdEntReviewVOList); 
		
		// 리뷰 통계
		EnterpriseVO enterpriseVO = this.enterpriseService.entReviewAvg(memId);
		log.info("enterReview -> enterpriseVO : " + enterpriseVO); 
		
		// 리뷰 총 개수
		int totalReviewCount = boardEntReviewService.getTotalCount(enterpriseVO.getEntNo());
		log.info("enterReview -> totalReviewCount : " + totalReviewCount); 
		
		model.addAttribute("memberVO",memberVO);
		model.addAttribute("enterpriseVO",enterpriseVO);
		model.addAttribute("brdEntReviewVOList",brdEntReviewVOList);
		model.addAttribute("totalReviewCount",totalReviewCount);
		
		return "mypageEnt/entReview";
	}

}

