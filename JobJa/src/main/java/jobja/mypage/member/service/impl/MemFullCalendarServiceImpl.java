package jobja.mypage.member.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jobja.mypage.member.mapper.MemFullCalendarMapper;
import jobja.mypage.member.service.MemFullCalendarService;
import jobja.mypage.member.vo.MemFullCalendarVO;

@Service
public class MemFullCalendarServiceImpl implements MemFullCalendarService {
   
    @Autowired
    MemFullCalendarMapper memFullCalendarMapper;
   
    //DB에 있는 일정 정보를 가져오는 메소드.
    @Override
    public List<Map<String, Object>> getEvents(String memId) {
       return this.memFullCalendarMapper.getEvents(memId);
    }
   
    //일정추가
    @Override
    public int addEvent(MemFullCalendarVO event) {
	    return this.memFullCalendarMapper.addEvent(event);
    }
    
    //일정수정
	@Override
	public int updateEvent(MemFullCalendarVO event) {
		return this.memFullCalendarMapper.updateEvent(event);
	}
	
	//일정삭제
	@Override
	public int deleteEvent(String scherduleId) {
		return this.memFullCalendarMapper.deleteEvent(scherduleId);
	}

	//일정 중복 체크
	@Override
	public int addEventCheck(MemFullCalendarVO event) {
		return this.memFullCalendarMapper.addEventCheck(event);
	}

}