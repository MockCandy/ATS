<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.table-wrap{
	display: flex;
	justify-content: center;
}
.mypage-sub-title{
	font-size: 24px;
	margin-bottom: 24px;
}
.mypage-table {
    border-collapse: collapse;
    width: 100%;
/*     border-radius: 20px; */
    overflow: hidden;
}
.mypage-table th, .mypage-table td {
    padding: 16px;
    border-bottom: 1px solid #ddd;
}
.mypage-table thead {
    background-color: #f7f7f7;
}
.mypage-table thead tr td {
 	text-align: center;
}
.mypage-table tbody tr:nth-child(even) {
    background-color: #fbfbfb;
}
.mypage-table tbody tr:hover {
    background-color: #ddd;
}
.mypage-table td:first-child {
    text-align: center;
    width: 80px; 
}
.mypage-table th:nth-child(2),
.mypage-table td:nth-child(2) {
  	width: 400px;
}
.mypage-table th:nth-child(3),
.mypage-table td:nth-child(3) {
  	width: 160px; 
  	text-align: center;
}
.mypage-table th:nth-child(4),
.mypage-table td:nth-child(4) {
  	width: 160px; 
  	text-align: center;
}

</style>


<div class="mypage-div">
	<div class="mypage-left">
		<div class="mypage-left-tit">신청관리</div>
		<ul>
			<li class="active"><a href="/entApplication/offerEntList">기업회원 신청내역</a></li>
			<li><a href="/entApplication/offerReportList">신고내역</a></li>
		</ul>
	</div>
	<div class="mypage-body-con">
		<div class="sub-title-area">
			<div class="body-sub-title">
				기업회원 신청 내역
			</div>
		</div>
			
		<div class="body-sub-con">
			<div class="table-wrap">
					<table class="table1">
						<colgroup>
							<col width="20%">
							<col width="*">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th>기업명</th>
								<th>신청일자</th>
								<th>결과</th>
								<th>신청처리일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${list}" varStatus="stat">
								<tr>
									<td>${list.entNm}</td>
									<td><fmt:formatDate value="${list.entRegDt}" pattern="yyyy-MM-dd"/></td>
								<c:if test="${list.entYn=='AYN01001'}">
									<td>승인완료</td>
								</c:if>
								<c:if test="${list.entYn=='AYN01002'}">
									<td>승인대기</td>
								</c:if>
								<c:if test="${list.entYn=='AYN01003'}">
									<td>승인거절</td>
								</c:if>
									<td><fmt:formatDate value="${list.entAprvDt}" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<div class="pagez">
				 ${info.getPagingArea()}
				</div>
			
		</div>
	</div>

</div>

