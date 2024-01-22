package jobja.atchfile.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class AtchFileDetailVO {
	
	@NotNull
	private int afdSeq;
	
	@NotBlank
	private String afId;
	
	private String afdOriginNm;
	
	private String afdSaveNm;
	
	private long afdFileSize;
	
	private String afdSavePath;
	
	private String afdExtsn;
	
	private String afdCntnt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date afdUploadDt;
}
