<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/resources/css/mypage.css"></link>
<style>
.check-start-day, .check-end-day{
	padding: 4px; 
	border-radius: 5px; 
	border: 1px solid #ccc;
	margin-bottom: 8px;
	height: 30px;
}
.btn-write{
	width: 56px;
    height: 30px;
}
.check-day-box{
	margin-bottom: 6px;
}
.pay-total{
	display: flex;
}
.pay-total * {
	font-size: 18px;
}
</style>



<div class="mypage-div">
	<div class="mypage-left">
		<div class="mypage-left-tit">상담</div>
		<ul>
			<li><a href="/consultantMyPage/consultantLog">진행한 상담 내역</a></li>
			<li class="active"><a href="/consultantMyPage/consultantHistory">매출 내역</a></li>
			<li><a href="/consultantMyPage/myConsultReview">나의 상담 리뷰</a></li>
		</ul>
	</div>
	
	<div class="mypage-body-con">
		<div class="sub-title-area flex">
				<div class="body-sub-title">매출 내역</div>
		</div>
			<div class="body-sub-con">
	<!-- 			<div class="check-day-box"> -->
	<!-- 				<input type="date" class="check-start-day"> -->
	<!-- 				<input type="date" class="check-end-day"> -->
	<!-- 				<input type="button" class="btn btn-write check-submit" value="조회"> -->
	<%-- 				<input type="hidden" class="" value="${memberVO.entNo}"> --%>
	<!-- 			</div>		 -->
	
				<div class="pay-total mb-9">
					<div class="p-15">총 매출 : </div>
					<div class="p-15 ml-5 bold">
						 <fmt:formatNumber value="${consultTotalSales}" pattern="#,###" />&nbsp;원 
					</div>
				</div>
				<table class="table1">
				<colgroup>
					<col width="12%">
					<col width="12%">
					<col width="*">
					<col width="10%">
					<col width="12%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>구매자</th>
						<th>구매 상품</th>
						<th>결제금액</th>
						<th>결제 수단</th>
						<th>결제일</th>
						<th>잔여횟수</th>
					</tr>
				</thead>
				<tbody>
						<!-- 상품 이름, 결제 수단, 시작일, 종료일, 남은 날짜, -->
					<c:forEach var="paymentVO" items="${paymentVOList}" varStatus="stat">
						<tr class="pointer row">
							<td>
								${stat.count}
							</td>
							<td>
								${paymentVO.payUserId}
							</td>
							<td>
								${paymentVO.itemNm}
							</td>
							<td>
								<fmt:formatNumber value="${paymentVO.payAmount}" pattern="#,###" />
							</td>
							<td>
								${paymentVO.payMethod}
							</td>
							<td>
								<fmt:formatDate value="${paymentVO.payDt}" pattern="yyyy-MM-dd"/>
							</td>
							<td>
						        ${paymentVO.payRemndrCnt}
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			
			<div class="pagez">
            	 ${info.getPagingArea()}
            </div>
				
				
			</div>
	</div>
		
</div>