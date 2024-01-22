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

.mypage-body-con {
    padding: 40px;
}
.list-btn {
	border-radius: 10px;
	cursor: pointer;
	display: inline-block;
	margin-right: 10px;
	margin-top: 10px;
	padding: 5px;
}

.list-btn:hover {
	background-color: white;
}

.port-cntnt {
	text-align: left;
	margin: 10px 10px;
}
.port-title{
	font-weight: bold;
	font-size: 20px;
}

.answer {
	 overflow:hidden;
	 resize: none;
     border: 1px solid #c7c6c6;
     width: 100%;
     height:200px;;
     padding: 20px;
     box-sizing: border-box;
     border-radius: 5px;
     margin-bottom: 15px;
}

.question{
	height: 20%;
}

#wrapper {
	flex-wrap: wrap;
     justify-content: center;
     margin: 0 auto;
     padding: 20px;
     max-width: 1170px;
 }
 
.port-contnet {
    border: 1px solid gray;
    border-radius:10px;
    padding: 20px;
    margin-top: 20px;
}
 
 .fasBtn{
	display: flex;
    justify-content: flex-end;
 }
 
 .row{
	width: 100%;
	margin-bottom: 20px;
 }
</style>





<!-- 자유양식 등록 페이지 -->
<div class="mypage-body-con">
		
	<div class="body-sub-title justify-center mb-30">자기소개서 작성(자유양식)</div>
		
	<div class="body-sub-con">
				
		<form class="mt-20" name="frm" action="/memberPortfolio/portfolioFreeCreateForm?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
			<sec:csrfInput />
			
			<p> <input type="hidden" name="memId" value="${memId}" /> </p>
			
			<div id="wrapper">
				
				<div class="ptfl-name">
					<input class="notice-title-input" type="text" name="ptflTitle" value="" placeholder="자기소개서 제목을 입력해 주세요">
				</div>
				
				
				<div class="flex mb-7">
					<button type="button" class="btn-plus mr-9" id="plus-cntnt">+ 추가</button> 
					<button type="button" class="btn-minus ml-auto" id="minus-cntnt">- 삭제</button>
				</div>
				
				 
				
				<div class="ptfl-one-line">
					<p class="ptfl-tit">
						<input type="text" class="question" name="portfolioFreeVOList[0].ptflFreeq" placeholder="질문을 입력하세요." />
					</p>
					<textarea class="answer textarea" name="portfolioFreeVOList[0].ptflFreea" placeholder="답변을 입력해주세요." ></textarea>
				</div>
	
			</div>
			
			
			<div class="fixed-footer">
				<div class="cen">
					<button type="button"
						class="btn btn-big btn-primary p-17 btn-user btn-block" onclick="window.location.href='/memberPortfolio/portfolioList'">목록</button>
					<button type="submit" id="saveBtn"
						class="btn btn-big btn-primary p-17 bg-sig color-white btn-user btn-block">저장</button>
					<button type="button" id="reset"
						class="btn btn-big btn-primary p-17 btn-user btn-block">초기화</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">

//전역변수(경력사항 카운터)
let cntCntnt = 0;

$(function(){
	
	// 항목 삭제
	$("#minus-cntnt").on("click",function(){
		
		cntCntnt = $(".question").length;
		
		if (cntCntnt < 2) {
			alert("최소 한 개는 작성해주세요!");
			return;
		}
		
		$("#wrapper").children().last().remove();
	});
	
	// 항목 추가
	$("#plus-cntnt").on("click",function(){

		cntCntnt = $(".question").length;
		
// 		let strCntct = "<div class='port-contnet'>";
// 			strCntct += "<p class='port-cntnt'>질문</p>";
// 			strCntct += "<input type='text' class='question' name='portfolioFreeVOList["+(cntCntnt)+"].ptflFreeq' placeholder='질문을 입력하세요.'>";
// 			strCntct += "<p class='port-cntnt'>답변</p>";
// 			strCntct += "<textarea class='answer' name='portfolioFreeVOList["+(cntCntnt)+"].ptflFreea' placeholder='답변을 입력해주세요.'></textarea>";
// 			strCntct += "</div>";
		
		let strCntct = '<div class="ptfl-one-line">';
			strCntct += '<p class="ptfl-tit">';
			strCntct += '<input type="text" class="question" name="portfolioFreeVOList['+(cntCntnt)+'].ptflFreeq" placeholder="질문을 입력하세요." />';
			strCntct += '</p>';
			strCntct += '<textarea class="answer textarea" name="portfolioFreeVOList['+(cntCntnt)+'].ptflFreea" placeholder="답변을 입력해주세요." ></textarea>';
			strCntct += '</div>';
			
				
					
				
				
			
			
		$("#wrapper").append(strCntct);
	});
	
	$(document).ready(function() {
	    $("#saveBtn").click(function() {
			console.log("Asdasd");	
			
			
			$("input[name='frm']").submit();
	    });
	});
});


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