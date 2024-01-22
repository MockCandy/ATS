package jobja.report.mapper;

import java.util.List;

import jobja.report.vo.ReportVO;

public interface ReportMapper {

	int report(ReportVO reportVO);

	List<ReportVO> getReportListById(String memId);

}
