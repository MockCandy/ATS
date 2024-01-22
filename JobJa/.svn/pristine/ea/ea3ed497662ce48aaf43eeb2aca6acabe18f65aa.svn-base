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
		<div class="mypage-left-tit">활동내역</div>
		<ul>
			<li><a href="/memberMyActivity/myBoardInquiry">일대일 문의</a></li>
			<li><a href="/memberMyActivity/myBoardQNA">취업 Q&A</a></li>
			<li class="active"><a href="/memberMyActivity/myEntReview">기업리뷰</a></li>
			<li><a href="/memberMyActivity/consultantReview">상담리뷰</a></li>
			<li><a href="/memberMyActivity/counselOffer">상담사회원 신청 내역</a></li>
			<li><a href="/memberMyActivity/reportOffer">신고 신청 내역</a></li>
		</ul>
	</div>
	
	<div class="mypage-body-con">
		<div class="sub-title-area">
			<div class="body-sub-title">
				기업 리뷰
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
								<th>번호</th>
								<th>기업이름</th>
								<th>작성자</th>
								<th>작성날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="entReviewVO" items="${entReviewList}" varStatus="stat">
								<tr>
									<td>${stat.count}</td>
									<td><a href="/enterprise/${entReviewVO.entNo}/review">${entReviewVO.entNm}</a></td>
									<td>${entReviewVO.memNm}</td>
									<td><fmt:formatDate value="${entReviewVO.regDate}" pattern="yyyy-MM-dd"/></td>
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

