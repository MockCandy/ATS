<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/resume.css">
<link rel="stylesheet" href="/resources/css/consult.css">
<link rel="stylesheet" href="/resources/css/admin.css">
<style>
/* 공통 스타일 */
.mypage-body-con {
	background-color: #fff;
	padding: 30px;
	width:800px;	
	height: 750px;
	margin:auto;
	margin-top:25px;
	margin-bottom:25px;
}

.body-sub-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 8px;
}
.con-count{
	text-align: center;
	width: 32px;
}
.flex{
	align-items: center !important;
}
.body-sub-con {
	padding:0;
}

</style>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.css">
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.min.js"></script>
<div class="mypage-body-con">
	<form action="/consultantLog/insertConsultantLog?${_csrf.parameterName}=${_csrf.token}" method="post">
		<div class="body-sub-con">
			<h1 class="admin-h1 p-30 mb-30">상담 기록 작성</h1>
			<div class="focus-green mb-30">
		        <input type="text" name="cnsltntTitle" class="input01 ph-tit w-100 inp-transparent" placeholder="제목을 입력해 주세요">
			</div>
			
			<div class="focus-green">
		        <textarea name="cnsltntCntnt" class="input01 w-100 ph-cont resize-none inp-transparent" style="height: 450px;" placeholder="내용을 입력해 주세요"></textarea>
			</div>
			
			<div class="focus-green flex" style="align-items:flex-end;">
			  	<p class="name-label" style="margin-bottom:0;margin-right:10px;">상담자</p>
		        <input class="input01 input-ssm mr-9" type="text" readonly value="${paymentVO.memNm}">
		        <p class="name-label" style="margin-bottom:0;margin-right:10px;">상담자 아이디</p>
		        <input class="input01 input-ssm mr-12" type="text" readonly value="${paymentVO.payUserId}" name="memId">
		        
<!-- 		        <p class="name-label" style="margin-bottom:0;margin-right:10px;">상담회차 </p> -->
<%-- 		        <input class="input01 input-ssm con-count" type="text" readonly value="${paymentVO.logCnt}" name="cnsltntTimes"> --%>
		        
		        
		        <button type="submit" class="btn btn-sm ml-auto">작성</button>
		        <input name="payNo" type="hidden" value="${paymentVO.payNo}">
		        <input name="conMemId" type="hidden" value="${paymentVO.payConId}">
			</div>
		  
		</div>
		<sec:csrfInput />
	</form>
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