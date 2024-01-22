package jobja.board.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import jobja.atchfile.controller.FileController;
import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.board.dao.AtchFileDetailDao;
import jobja.board.mapper.BoardInquiryMapper;
import jobja.board.service.BoardInquiryService;
import jobja.board.vo.BoardInquiryVO;
import jobja.item.vo.PaymentVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@Service
public class BoardInquiryServiceImpl implements BoardInquiryService {
	
	@Autowired
	FileController fileController;
	
	@Autowired
	AtchFileDetailDao atchFileDetailDao;
	
	@Autowired
	BoardInquiryMapper boardInquiryMapper;

	@Autowired
	String uploadFolder;
	
	@Override
	public int createPost(BoardInquiryVO boardInquiryVO) {
		
		int result = this.boardInquiryMapper.createPost(boardInquiryVO);
		
		result += this.fileController.uploadFile(boardInquiryVO.getUploadFile(), boardInquiryVO.getBoardId());
		
		return result;
	}

	@Override
	public List<BoardInquiryVO> list(Map<String, Object> map) {
		
		return this.boardInquiryMapper.list(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		
		return this.boardInquiryMapper.getTotal(map);
	}

	@Override
	public BoardInquiryVO detail(String boardId) {
		
		return boardInquiryMapper.detail(boardId);
	}

	@Override
	public int updatePost(BoardInquiryVO boardInquiryVO) {
		
		int result = this.boardInquiryMapper.updatePost(boardInquiryVO);
		
		MultipartFile[] uploadFile = boardInquiryVO.getUploadFile();
		
		log.info("uploadFile zzzzzzzz: " + uploadFile);
		
		uploadFile(uploadFile, boardInquiryVO.getBoardId());
		
		return result;
	}

	@Transactional
	@Override
	public int deletePost(BoardInquiryVO boardInquiryVO) {
		
		int result = this.boardInquiryMapper.delAtchdt(boardInquiryVO.getBoardId());
		
		result += this.boardInquiryMapper.delAtch(boardInquiryVO.getBoardId());
		
		result += this.boardInquiryMapper.deletePost(boardInquiryVO);
		
		return result;
	}
	
	public int uploadFile(MultipartFile[] uploadFile, String boardId) {
		//파일이 업로드 될 경로
		String uploadFileName = "";
		log.info("uploadFile->uploadFolder : " + uploadFolder);
		
		int result = 0;
		
		//연월일 폴더 만들기 시작/////////////////////
		// , : \\
		//...\\upload\\2023\\10\\31
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("uploadPath : " + uploadPath);
		
		//만약 연/월/일 해당 폴더가 없으면 생성
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		//연월일 폴더 만들기 끝/////////////////////
		
		//uploadFile : MultipartFile[] uploadFile
		//uploadFile[0] : MultipartFile 1개
		if(uploadFile[0].getOriginalFilename().length()>0) {
			//ATCH_FILE_DETAIL 테이블의 데이터를 삭제
			this.boardInquiryMapper.delAtch(boardId);
			this.boardInquiryMapper.delAtchdt(boardId);
			
			//파일객체배열로부터 파일을 하나씩 꺼내보자
			for(MultipartFile multipartFile : uploadFile) {
					log.info("-------------------");
					log.info("파일명 : " + multipartFile.getOriginalFilename());
					log.info("크기 : " + multipartFile.getSize());
					log.info("MIME타입 : " + multipartFile.getContentType());
					
					//파일명
					uploadFileName = multipartFile.getOriginalFilename();
					
					// 같은날 같은 이미지를 업로드 시 파일 중복 방지 시작//////////////
					//java.util.UUID => 랜덤값 생성
					UUID uuid = UUID.randomUUID();	//임의의 값을 생성
					//원래의 파일 이름과 구분하기 위해서 _를 붙임
					uploadFileName = uuid.toString() + "_" + uploadFileName;
					// 같은날 같은 이미지를 업로드 시 파일 중복 방지 끝//////////////
					
					//File 객체 설계(복사할 대상 경로, 파일명)
					//uploadPath : 연월일 처리된 경로
					//uploadFileName : uuid 처리된 파일명
					File saveFile = new File(uploadPath, uploadFileName);
					
					try {
						//파일 복사가 일어남
						//파일객체.transferTo(설계)
						multipartFile.transferTo(saveFile);
						
						//썸네일
						//이미지인지 체킹
						if(checkImagetype(saveFile)) {//이미지라면..
							//설계
							FileOutputStream thumbnail = new FileOutputStream(
								new File(uploadPath, "s_" + uploadFileName)
							);
							//섬네일 생성
							Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
							thumbnail.close();
						}
						
						//ATCH_FILE_DETAIL 테이블에 insert
						//ATCH_FILE_ID, FILE_SN, FILE_STRE_COURS, STRE_FILE_NM
						//, ORIGNL_FILE_NM, FILE_EXTSN, FILE_CN, FILE_SIZE
						AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();
						atchFileDetailVO.setAfId(boardId);	//P.K
						atchFileDetailVO.setAfdSeq(0);				//P.K
						atchFileDetailVO.setAfdSavePath(
								uploadPath + "\\" + uploadFileName);
						// 2023\\10\\31\\safdlkdsfj_개똥이2.jpg
						// getFolder() : 2023\\10\\31
						// uploadFileName : safdlkdsfj_개똥이2.jpg	
						// 2023/10/31/safdlkdsfj_개똥이2.jpg				
						atchFileDetailVO.setAfdSaveNm(
								getFolder().replaceAll("\\\\", "/") + "/" + uploadFileName);
						atchFileDetailVO.setAfdOriginNm(multipartFile.getOriginalFilename());
						atchFileDetailVO.setAfdExtsn(
								uploadFileName.substring(uploadFileName.lastIndexOf(".")+1));
						atchFileDetailVO.setAfdCntnt("");
						atchFileDetailVO.setAfdFileSize(multipartFile.getSize());
						
						log.info("atchFileDetailVO : " + atchFileDetailVO);
						
						//쿼리 실행
						result += this.atchFileDetailDao.insertAtchFileDetail(atchFileDetailVO);
					} catch (IllegalStateException | IOException e) {
						log.error(e.getMessage());
					}
			}//end for
		}//end if
		
		return result;
	}
	
	private boolean checkImagetype(File file) {
		
		/* Multipurpose Internet Mail Extensions
		 .jpeg / .jpg(JPEG 이미지)의 MIME 타입 : image/jpeg
		 */
		//MIME 타입을 통해 이미지 여부 확인
		//file.toPath() : 파일 객체를 path객체로 변환
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			log.info("contentType : " + contentType);		
	
			return contentType.startsWith("image");
		} catch (IOException e) {
			log.error(e.getMessage());
		}
		return false;
	}

	//연/월/일 폴더 생성
	private String getFolder() {
		
		//2023-10-31형식(format) 지정
		//간단 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//날짜 객체 생성(java.util패키지)
		Date date = new Date();
		//2023-10-31
		String str = sdf.format(date);
		//윈도의 경로는 역슬러시 두개 2023\\10\\31
		return str.replace("-", File.separator);
	}
	
	//마이페이지 내가쓴 게시물 가져오기.
	@Override
	public List<BoardInquiryVO> myList(Map<String, Object> map) {
		return this.boardInquiryMapper.myList(map);
	}

	@Override
	public PaymentVO chatConsultant(Map<String, Object> map) {
		
		return this.boardInquiryMapper.chatConsultant(map);
	}
	
	//마이페이지 활동내역 총 갯수 가져오기.
	@Override
	public int getMyTotal(Map<String, Object> map) {
		return this.boardInquiryMapper.getMyTotal(map);
	}
	

}