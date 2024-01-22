package jobja.ranking.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jobja.member.vo.EnterpriseVO;
import jobja.ranking.mapper.EntRankingMapper;
import jobja.ranking.service.EntRankingService;

@Service
public class EntRankingServiceImpl implements EntRankingService{

	@Autowired
	EntRankingMapper entRankingMapper;
	
	@Override
	public List<EnterpriseVO> entWelfareDesc() {
		return entRankingMapper.entWelfareDesc();
	}

	@Override
	public List<EnterpriseVO> entChancesDesc() {
		return entRankingMapper.entChancesDesc();
	}

	@Override
	public List<EnterpriseVO> entBalanceDesc() {
		return entRankingMapper.entBalanceDesc();
	}

	@Override
	public List<EnterpriseVO> entCultureDesc() {
		return entRankingMapper.entCultureDesc();
	}

	@Override
	public List<EnterpriseVO> entManagerDesc() {
		return entRankingMapper.entManagerDesc();
	}

	@Override
	public List<EnterpriseVO> entAvgDesc() {
		return entRankingMapper.entAvgDesc();
	}

	@Override
	public List<EnterpriseVO> getList(Map<String, Object> map) {
		return entRankingMapper.getList(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return entRankingMapper.getTotal(map);
	}

}
