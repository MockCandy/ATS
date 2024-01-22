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
 

.delete-btn{
	display: block;
    margin-left: auto;
    margin-right: 0;
}

.fas-btn{
	display: inline-flex;
    align-items: center;
    justify-content: center;
    background-color: white;
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    cursor: pointer;
    padding: 10px 10px;
}

.body-sub-con{
	padding:40px;
}

</style>


<!-- 자유양식 수정 페이지 -->
<div class="mypage-body-con body-sub-con" >
	<div class="body-sub-title justify-center mb-30">자기소개서 수정</div>
	
	<form class="mt-20" name="frm" action="/memberPortfolio/portfolioFreeUpdatePost?${_csrf.parameterName}=${_csrf.token}" method="post" >
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
		
		
		<div class="flex mb-7">
			<button type="button" class="btn-plus mr-9" id="plus-cntnt">+ 추가</button> 
			<button type="button" class="btn-minus ml-auto" id="minus-cntnt">- 삭제</button>
		</div>
		
		<div id="wrapper">
			<c:forEach var="portVO" items="${portfolioVO.portfolioFreeVOList}" varStatus="var">
				<div class="ptfl-one-line">
					<p class="ptfl-tit">
						<input type="text" value="${portVO.ptflFreeq} " class="question" name="portfolioFreeVOList[${var.index }].ptflFreeq" placeholder="질문을 입력하세요." />
					</p>
					
					<textarea class="answer textarea" name="portfolioFreeVOList[${var.index }].ptflFreea" placeholder="답변을 입력해주세요." >${portVO.ptflFreea}</textarea>
				</div>
			</c:forEach>
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
			
		let strCntct ='<div class="ptfl-one-line">';
			strCntct += '<p class="ptfl-tit">';
			strCntct += '<input type="text" value="" class="question" name="portfolioFreeVOList['+(cntCntnt)+'].ptflFreeq" placeholder="질문을 입력하세요." />';
			strCntct += '</p>';
			strCntct += '<textarea class="answer textarea" name="portfolioFreeVOList['+(cntCntnt)+'].ptflFreea" placeholder="답변을 입력해주세요." ></textarea>';
			strCntct += '</div>';
			
				
					
				
				
				
			
		
		$("#wrapper").append(strCntct);
	});
	
    // 각 삭제 버튼에 대한 이벤트 핸들러
    $(".delete-btn").on("click", function() {
        let index = $(this).data("index");
        let result = confirm("삭제하시겠습니까?");
        console.log("Confirm 결과:", result);

        // 확인 선택 시 해당 항목을 삭제
        if (result) {
            // 서버로 해당 index를 전송하여 삭제 로직 수행
            console.log("삭제할 항목의 index:", index);

            // 여기에 삭제 로직 추가

            // 해당 포트폴리오 항목을 화면에서도 삭제
            $(this).closest(".port-contnet").remove();
        } else {
            alert("삭제가 취소되었습니다");
        }
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

