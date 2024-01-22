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
	background-color: rgba(143, 188, 143, 0.8);
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

#wrapper {
	 flex-wrap: wrap;
     justify-content: center;
     padding: 20px;
     max-width: 1170px;
	 margin: 20px;
 }
 
.port-contnet {
    border: 1px solid gray;
    border-radius:10px;
    padding: 20px;
    margin-top: 20px;
}

.mypage-body-con{
	background-color: #fff;
	border-radius: 30px;
 	padding: 24px; 
 	height: 800px;ㅊ
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

<!-- 자유 양식 상세보기 페이지  -->
<div class="mypage-body-con">
	<div class="sub-title-area">
	<div class="body-sub-title">자기소개서</div>
		<hr class="title-hr"/>
	</div>
		<div class="body-sub-con">
		
		<form class="mt-20" id="frm" name="frm" action="/mypageMem/portfolioFreeUpdate" method="get" enctype="multipart/form-data">
		
<%-- 		 <p style="text-align: right;"> 마지막 수정일시 : <fmt:formatDate value="${portfolioVO.ptflUpdtDt}" pattern="yyyy.MM.dd HH:mm" /></p> --%>

			<p> <input type="hidden" name="memId" value="${portfolioVO.memId}" /> </p>
			<p> <input type="hidden" name="ptflNo" value="${portfolioVO.ptflNo}" /> </p>
			
			<div id="wrapper">
				<p class="port-cntnt">자기소개서 제목</p>
				<p class="textarea-tit">${portfolioVO.ptflTitle}</p>
					<c:forEach var="portVO" items="${portfolioVO.portfolioFreeVOList}">
						<div class="port-contnet">
							<p class="port-cntnt">질문 Q : ${portVO.ptflFreeq} </p>
							
							<p class="port-cntnt">답변 A</p>
							<pre class="textarea">${portVO.ptflFreea}</pre>
						</div>
					</c:forEach>
				
			</div>

			<p style="text-align: right;"> 
				<button type="submit" class="list-btn">수정</button>	
				<button type="button" id="delete" class="list-btn">삭제</button>
				<button type="button" onclick="location.href='/consultantMyPage/portfolioList'" class="list-btn" >목록 </button>
				<button type="button" id="pdfDw" class="list-btn">PDF다운로드</button>
			</p>
		</form>
	</div>
</div>

<script type="text/javascript">
$(function(){
	
	 // 삭제
    $("#delete").on("click", function(){
    	
       let result = confirm("삭제하시겠습니까?");
       console.log("Confirm 결과:", result);

     // 확인 선택 시 form을 submit
        if (result) {
                $("#frm").attr("method", "post");
                $("#frm").attr("action", "/mypageMem/portfolioDeletePost?${_csrf.parameterName}=${_csrf.token}");
                $("#frm").submit();
        } else {
            alert("삭제가 취소되었습니다");
        }
    });
	 
});

</script>

