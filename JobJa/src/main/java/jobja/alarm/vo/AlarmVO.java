package jobja.alarm.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AlarmVO {

	private String alarmNo;
	private String memId;
	private String contentCd;
	private Date checkDt;
	private String checkCd;
	private String prefixCntnt;
	
}
