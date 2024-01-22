package jobja.report.service;

import java.util.List;

import jobja.report.vo.ReportVO;

public interface ReportService {

	int report(ReportVO reportVO);

	List<ReportVO> getReportListById(String memId);

}
