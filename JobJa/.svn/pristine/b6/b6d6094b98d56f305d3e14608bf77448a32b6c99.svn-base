package jobja.mypage.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemFullCalendarVO {
   
   private String scherduleId;         //일정관리 ID
   private String memId;            //회원ID
   private String scheduleTitle;      //일정명
   @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd'T'HH:mm:ss")
   @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
   private Date scheduleStdt;         //일정시작일.
   @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd'T'HH:mm:ss")
   @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
   private Date scheduleEddt;         //일정종료일
   private int schduleAllday;         //하루종일 일정.
   private String scheduleType;		  //스케줄종류

}