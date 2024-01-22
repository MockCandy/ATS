<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!-- lecture CSS 파일 링크 -->
<link rel="stylesheet" type="text/css" href="/resources/css/lecture.css">

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

.textarea-tit{
	display: inline-table;
    text-align: left;
    border: 1px solid #c7c6c6;
    width: 100%;
    height:40px;;
    padding: 15px;
    border-radius: 5px;
    margin-bottom: 15px;
}

.textarea {
	white-space: pre-line;
	overflow:auto;
	resize: none;
    border: 1px solid #c7c6c6;
    width: 100%;
    height:200px;;
    padding: 15px;
    box-sizing: border-box;
    border-radius: 5px;
    margin-bottom: 15px;
    text-align: left;
}

.textarea-q{

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

.fasBtn {
	display: flex;
    justify-content: flex-end;
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
 
</style>

<!-- 자유양식 수정 페이지 -->
<div class="lectureCen">
	<div class="lectureBoard">
		<h1 class="lecture-main-tit">자기소개서 수정</h1>
		<div class="lec-h-div-line"></div>
		
		<form class="mt-20" name="frm" action="/portfolio/freeUpdatePost" method="post" enctype="multipart/form-data">
			<sec:csrfInput />
			
			<p> <input type="hidden" name="memId" value="${portfolioVO.memId}" /> </p>
			<p> <input type="hidden" name="ptflNo" value="${portfolioVO.ptflNo}" /> </p>
			
			<div id="wrapper">
				<p style="text-align: right;">
					<button type="submit" id="saveBtn" class="list-btn">저장</button>	
					<button type="reset" class="list-btn">초기화</button>
					<button type="button" onclick="location.href='/portfolio/list'" class="list-btn" >목록 </button>
				</p>
			
				<p class="port-cntnt">자기소개서 제목</p>
				<p> <input class="notice-title-input" type="text" name="ptflTitle" value="${portfolioVO.ptflTitle}"  /> </p>
				<br />
				
				<div class="fasBtn">
					<button type="button" id="plus-cntnt" class="list-btn">
						<i class="fas fa-plus"></i>
					</button>
					<button type="button" id="minus-cntnt" class="list-btn">
						<i class="fas fa-minus"></i>
					</button>
				</div>
<!-- 				<div class="port-contnet"> -->
<!-- 					<div class="pro-con-sub"> -->
<!-- 						<p class="port-cntnt port-title">문항</p> -->
<!-- 						<hr/> -->
<!-- 					</div> -->

					<div>
						<c:forEach var="portVO" items="${portfolioVO.portfolioFreeVOList}" varStatus="stat">
							<div class="port-contnet">
								<p class="port-cntnt">질문</p>
								<input type="text" class="question" name="portfolioFreeVOList[${stat.index}].ptflFreeq" value="${portVO.ptflFreeq}" />
								<p class="port-cntnt">답변</p>
								<textarea class="answer" name="portfolioFreeVOList[${stat.index}].ptflFreea">${portVO.ptflFreea}</textarea>
							</div>
						</c:forEach>
					</div>
<!-- 					portFreeVO -->
<!-- 				</div> -->
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
		
		let strCntct = "<div class='port-contnet'>";
			strCntct += "<p class='port-cntnt'>질문</p>";
			strCntct += "<input type='text' class='question' name='portfolioFreeVOList["+(cntCntnt)+"].ptflFreeq' placeholder='질문을 입력하세요.'>";
			strCntct += "<p class='port-cntnt'>답변</p>";
			strCntct += "<textarea class='answer' name='portfolioFreeVOList["+(cntCntnt)+"].ptflFreea' placeholder='답변을 입력해주세요.'></textarea>";
			strCntct += "</div>";
		
		$("#wrapper").append(strCntct);
	});
	
	
// 	$(document).ready(function() {
// 	    $("#saveBtn").click(function() {
// 			console.log("Asdasd");	
			
// 			$("input[name='frm']").submit();
// 	    });
// 	});
});

</script>

