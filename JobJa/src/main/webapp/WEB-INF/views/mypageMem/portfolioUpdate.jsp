<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!-- lecture CSS 파일 링크 -->
<link rel="stylesheet" type="text/css" href="/resources/css/lecture.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resume.css">
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">

<style>

.justify-content-center {
	-ms-flex-pack: center !important;
	justify-content: center !important;
}

#editor {
	background-color: #0000; 
	border: none;
	padding: 10px;
}

.ck-content {
	height: 500px;
}

.title {
	text-align: left;
	margin: 10px 10px 10px 10px;
}

.list-btn {
	font-size: 14px;
	background-color: #0000;
	border-radius: 15px;
	border-color: #0000;
	cursor: pointer;
	display: inline-block;
	margin-right: 10px;
	margin-top: 10px;
	padding: 5px;
}

.list-btn:hover {
	padding:8px;
	background-color: rgba(143, 188, 143, 1);
	color: white;
}

.port-cntnt{
	text-align: left;
	margin-top: 10px;
	margin-bottom: 10px;
}

.body-sub-con {
    padding: 40px;
}
#wrapper {
	flex-wrap: wrap;
     justify-content: center;
     margin: 0 auto;
     padding: 20px;
     max-width: 1170px;
 }
 
.body-sub-title{
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 8px;
}

.title-hr{
	border: 1px solid #ccc;
	margin-bottom: 8px;
}

</style>

		
<!-- 기본양식 수정 페이지 -->
<div class="mypage-body-con body-sub-con" >
	<div class="body-sub-title justify-center mb-30">자기소개서 수정</div>
	

	<form class="mt-20" name="frm" action="/memberPortfolio/portfolioUpdatePost?${_csrf.parameterName}=${_csrf.token}" method="post" >
		<sec:csrfInput />
		<div class="flex mb-12">
		 	<p class="p-14 bold"> 작성자 : ${memberVO.memNm}</p>
		 	<p class="ml-auto p-14 bold"> 최종 업데이트일 : <fmt:formatDate value="${portfolioVO.ptflUpdtDt}" pattern="yyyy-MM-dd" /></p>
		</div>
	
		<p> <input type="hidden" name="memId" value="${portfolioVO.memId}" /> </p>
		<p> <input type="hidden" name="ptflNo" value="${portfolioVO.getPtflNo()}" /> </p>
		
		<div class="ptfl-name">
			<input class="notice-title-input" type="text" name="ptflTitle" value="${portfolioVO.ptflTitle}">
		</div>
		
		<div class="ptfl-one-line">
			<p class="ptfl-tit">성장과정</p>
			<textarea class="textarea" name="ptflGrowth" >${portfolioVO.portfolioBasicVO.ptflGrowth}</textarea>
		</div>
	
		<div class="ptfl-one-line">
			<p class="ptfl-tit">지원동기</p>
			<textarea class="textarea" name="ptflMotive" >${portfolioVO.portfolioBasicVO.ptflMotive}</textarea>
		</div>
		
		<div class="ptfl-one-line">
			<p class="ptfl-tit">성격 및 장단점</p>
			<textarea class="textarea" name="ptflPersonality" >${portfolioVO.portfolioBasicVO.ptflPersonality}</textarea>
		</div>
	
		<div class="ptfl-one-line">
			<p class="ptfl-tit">관련 업무 경험 및 경력</p>
			<textarea class="textarea" name="ptflJobExp" >${portfolioVO.portfolioBasicVO.ptflJobExp}</textarea>
		</div>
	
		<div class="ptfl-one-line">
			<p class="ptfl-tit">프로젝트 경험</p>
			<textarea class="textarea" name="ptflProjExp" >${portfolioVO.portfolioBasicVO.ptflProjExp}</textarea>
		</div>
	
		<div class="ptfl-one-line">
			<p class="ptfl-tit">입사 후 포부</p>
			<textarea class="textarea" name="ptflAspirations" >${portfolioVO.portfolioBasicVO.ptflAspirations}</textarea>
		</div>
	
		<div class="fixed-footer">
			<div class="cen">
				<button type="button"
					class="btn btn-big btn-primary p-17 btn-user btn-block" onclick="window.location.href='/memberPortfolio/portfolioList'">목록</button>
				<button type="submit" id="edit"
					class="btn btn-big btn-primary p-17 bg-sig color-white btn-user btn-block">저장</button>
				<button type="button" id="reset"
					class="btn btn-big btn-primary p-17 btn-user btn-block">초기화</button>
			</div>
		</div>


	</form>
	
</div>

<script>

	let reset = document.querySelector("#reset");
	let inputs = document.querySelectorAll("input");
	let textareas = document.querySelectorAll("textarea");
	
	console.log(reset);
	
	reset.addEventListener("click", function(){
		for(let i = 0; i < inputs.length; i++){
			inputs[i].value = "";
		}
		
		for(let i = 0; i < textareas.length; i++){
			textareas[i].value = "";
		}
	})

</script>