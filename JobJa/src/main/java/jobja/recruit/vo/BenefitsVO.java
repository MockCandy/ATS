package jobja.recruit.vo;

import java.util.Arrays;
import java.util.List;

import jobja.common.vo.ComDetCodeInfoVO;
import lombok.Data;


public class BenefitsVO {

	private String recruitNo; //공고 글 번호

	private List<String> benCd; // com code 에서 가지고온거
	
	private String benCd2; // com code 에서 가지고온거
	
	private ComDetCodeInfoVO comDetCodeInfoVO;

	@Override
	public String toString() {
		return "BenefitsVO [recruitNo=" + recruitNo + ", benCd=" + benCd + ", benCd2=" + benCd2 + ", comDetCodeInfoVO="
				+ comDetCodeInfoVO + "]";
	}

	public String getRecruitNo() {
		return recruitNo;
	}

	public void setRecruitNo(String recruitNo) {
		this.recruitNo = recruitNo;
	}

	public List<String> getBenCd() {
		return benCd;
	}

	public void setBenCd(List<String> benCd) {
		this.benCd = benCd;
	}

	public ComDetCodeInfoVO getComDetCodeInfoVO() {
		return comDetCodeInfoVO;
	}

	public void setComDetCodeInfoVO(ComDetCodeInfoVO comDetCodeInfoVO) {
		this.comDetCodeInfoVO = comDetCodeInfoVO;
	}

	public BenefitsVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BenefitsVO(String recruitNo, List<String> benCd, ComDetCodeInfoVO comDetCodeInfoVO) {
		super();
		this.recruitNo = recruitNo;
		this.benCd = benCd;
		this.comDetCodeInfoVO = comDetCodeInfoVO;
	}

	public String getBenCd2() {
		return benCd2;
	}

	public void setBenCd2(String benCd2) {
		this.benCd2 = benCd2;
	}

	

}
