<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/resume.css">
<link rel="stylesheet" href="/resources/css/consult.css">
<link rel="stylesheet" href="/resources/css/mypage.css">

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.css">
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.min.js"></script>
	

<div class="mypage-div">
	<div class="mypage-left">
		<div class="mypage-left-tit">상담</div>
		<ul>
			<li><a href="/consultantMyPage/consultantLog">진행한 상담 내역</a></li>
			
			<li><a href="/consultantMyPage/consultantHistory">매출 내역</a></li>
			
			<li class="active"><a href="/consultantMyPage/myConsultReview">나의 상담 리뷰</a></li>
		</ul>
	</div>
	

	<div class="mypage-body-con"> 
		<div class="sub-title-area">
			<div class="body-sub-title">나의 상담 리뷰</div>
		</div>
	
		<div class="body-sub-con">
		
			<p class="mypageSubTit">회원님에게 작성된 상담 리뷰 내역입니다. <span class="p-13">(총 <span class="bold">${total }</span>건)</span></p>
			
			<form class="mb-12 flex flex-end" id="sortForm" action="/consultantMyPage/consultantLog">
				<input type="hidden" id="sort" name="sort">
				<input type="hidden" id="keyword" value="${param.keyword }">
				<input type="hidden" id="currnetPage" value="${param.currentPage }">
				<span id="recentSort" class="active
					<c:if test="${param.sort == 'recentSort' || param.sort == null }">
						active
					</c:if>
					mr-5
				">최신순</span>
				<span id="olderSort" class="
					<c:if test="${param.sort == 'olderSort' }">
						active
					</c:if>
				">오래된순</span>
				
			</form>
			
			<table class="table1">
				<colgroup>
					<col width="15%">
					<col width="15%">
					<col width="13%">
					<col width="*">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>상담자 ID</th>
						<th>상담자 성함</th>
						<th>리뷰 평점</th>
						<th>리뷰 내용</th>
						<th>리뷰 작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="consultantReviewLogVO" items="${data.content }">
						<tr class="pointer" onclick="window.location.href='/consultantMyPage/reviewDetail?reviewNo=${consultantReviewLogVO.reviewNo}'">
							<td>${consultantReviewLogVO.reviewMemId }</td>
							<td>${consultantReviewLogVO.memberVO.memNm }</td>
							<td>${consultantReviewLogVO.reviewRate }</td>
							<td class="talign-left">${consultantReviewLogVO.reviewCntnt }</td>
							<td><fmt:formatDate value="${consultantReviewLogVO.reviewRegDt }" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			
			<div class="pagez mt-30">
				${data.getPagingArea4()}
			</div>
		
		
		  
		</div>
	</div>
</div>
	


<script>
let time = document.querySelectorAll(".time");

console.log(time);

for(let i = 0 ; i < time.length; i++){
   console.log(time[i].innerText);
   let year = time[i].innerText.split(" ")[5];
   console.log(year);
   let month = time[i].innerText.split(" ")[1];
   if(month == "Jan"){
      month = '1';
   }else if(month == "Feb"){
      month = '2';         
   }else if(month == "Mar"){
      month = '3';         
   }else if(month == "Apr"){
      month = '4';         
   }else if(month == "May"){
      month = '5';         
   }else if(month == "Jun"){
      month = '6';         
   }else if(month == "Jul"){
      month = '7';         
   }else if(month == "Aug"){
      month = '8';         
   }else if(month == "Sep"){
      month = '9';         
   }else if(month == "Oct"){
      month = '10';         
   }else if(month == "Nov"){
      month = '11';         
   }else if(month == "Dec"){
      month = '12';         
   }
   let day = time[i].innerText.split(" ")[2];
   console.log(day);
   
   time[i].innerText = year+"-"+month+"-"+day
}

let form = document.querySelector("#sortForm");
let recentSort = document.querySelector("#recentSort");
let olderSort = document.querySelector("#olderSort");

recentSort.addEventListener("click", function(e){
	e.target.parentElement[0].value = "recentSort";
	console.log(e.target.parentElement[0])
	form.submit();
})
olderSort.addEventListener("click", function(e){
	e.target.parentElement[0].value = "olderSort";
	console.log(e.target.parentElement[0])
	form.submit();
})

</script>