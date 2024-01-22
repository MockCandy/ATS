<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="/resources/css/mypage.css">

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<style>

body{
	background-color:#fff;
}

</style>

<!-- 자유양식 페이지 -->

<div class="mypage-body-con">
	<div class="body-sub-title">자기소개서</div>
		
<!-- 		<form class="port-search"> -->
<!-- 			<input class="port-keyword" type="text" placeholder="검색어를 입력하세요" -->
<%-- 				name="keyword" value="${keyword}" /> <input class="port-search-btn" --%>
<!-- 				type="submit" value="검색" /> -->
<!-- 		</form> -->

		
		<div class="sel mb-12">
			<div class="port-select">
				<select id="selectForm" name="selectForm">
					<option value="">양식을 선택해주세요</option>
					<option value="basic">기본양식</option>
					<option value="free">자유양식</option>
				</select>
			</div>

			<div style="justify-content: right; display: flex;">
				<button type="button" id="btnSel" class="port-search-btn ml-7">등록</button>
			</div>
		</div>
		<c:forEach var="portVO" items="${data.content}" >
				<c:if test="${portVO.gubun=='BASIC'}">
					<a href="/memberPortfolio/portfolioDetail?ptflNo=${portVO.ptflNo}">
				</c:if>
				<c:if test="${portVO.gubun=='FREE'}">
					<a href="/memberPortfolio/portfolioFreeDetail?ptflNo=${portVO.ptflNo}">
				</c:if>
				<div class="resume-item">
				
					<div class="resume-top mb-7">
						<c:if test="${portVO.gubun == 'FREE' }">
							<span class="badge-nm bg-orange txt-white">자유양식</span>
						</c:if>
						<c:if test="${portVO.gubun == 'BASIC' }">
							<span class="badge-nm bg-sig txt-white">기본양식</span>
						</c:if>
					</div>
					<div class="resume-cont">
						<p class="p-14 mb-3 bold">자기소개서 제목</p>
						<p class="resume-tit">${portVO.ptflTitle }</p>
					</div>
					
					<div class="mt-12 flex align-center">
						<p class="p-13 bold">최종 업데이트일 : </p>
						<p class="p-14 time ml-3">${portVO.ptflUpdtDt }</p>
					</div>
				</div>
			</a> 
		</c:forEach>
		<div class="pagez">${info.getPagingArea()}</div>


		<div class="pagez">
			${data.getPagingArea()}
		</div>
</div>


<script type="text/javascript" src="/resources/js/func.js"></script>
<script type="text/javascript">

timeConvert();

$(function(){
	//자기소개서 작성
	$("#btnSel").on("click",function(){
		let selectForm = $("#selectForm").val();
		console.log("selectForm : " + selectForm);
		
		if(selectForm==""){
			alert("작성할 양식을 선택해주세요");	
			return;
		}else{
			if(selectForm=="basic"){
				location.href="/memberPortfolio/portfolioCreate";
			}else{
				location.href="/memberPortfolio/portfolioFreeCreate";
			}
		}
	});
});

</script>
