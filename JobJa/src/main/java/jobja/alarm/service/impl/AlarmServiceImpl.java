package jobja.alarm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jobja.alarm.mapper.AlarmMapper;
import jobja.alarm.service.AlarmService;
import jobja.alarm.vo.AlarmVO;


@Service
public class AlarmServiceImpl implements AlarmService{

	@Autowired
	AlarmMapper alarmMapper;
	
	@Override
	public int insert(AlarmVO alarmVO) {
		return alarmMapper.insert(alarmVO);
	}

}
