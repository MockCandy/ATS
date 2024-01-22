<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/resources/css/mypage.css">
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
		<div class="mypage-left-tit">지원관리</div>
		<ul>
			<li class="active"><a href="/memberApplication/myApplicationList">입사지원 관리</a></li>
			<li><a href="/memberApplication/myJobOffer">받은 입사제안</a></li>
		</ul>
	</div>
	

	<div class="mypage-body-con">
		<div class="sub-title-area">
			<div class="body-sub-title">
				입사지원
			</div>
		</div>
			
		<div class="body-sub-con">
			<div class="table-wrap">
					<table class="table1">
						<colgroup>
							<col width="15%"> 
							<col width="*"> 
							<col width="15%"> 
							<col width="15%"> 
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>공고제목</th>
								<th>입사지원상태</th>
								<th>입사지원날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="applicationVO" items="${myApplicationList}" varStatus="stat">
								<tr>
									<td>${stat.count}</td>
									<td><a href="/recruit/${applicationVO.recruitNo}/detail">${applicationVO.recruitTitle}</a></td>
									<td>${applicationVO.appStateNm}</td>
									<td><fmt:formatDate value="${applicationVO.appApplyDt}" pattern="yyyy-MM-dd"/></td>
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

