package jobja.recruit.mapper;

import jobja.member.vo.InterestRecruitVO;

public interface InterestRecruitMapper {

	int ajaxInterestRecruit(InterestRecruitVO interestRecruitVO);

	int ajaxInterestRecAdd(InterestRecruitVO interestRecruitVO);

	int ajaxInterestRecDel(InterestRecruitVO interestRecruitVO);

	int getStoredRecruit(InterestRecruitVO interestRecruitVO);
}
