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
<script src="/resources/js/jspdf.min.js"></script>
<script src="/resources/js/html2canvas.js"></script>

<style>


</style>

<!-- 자유양식 상세보기 -->
<div class="mypage-body-con body-sub-con">

	<form class="mt-20" id="frm" name="frm" action="/memberPortfolio/portfolioFreeUpdate" method="get" enctype="multipart/form-data">
		
		<div class="flex mb-12">
		 	<p class="p-14 bold"> 작성자 : ${memberVO.memNm}</p>
		 	<p class="ml-auto p-14 bold"> 최종 업데이트일 : <fmt:formatDate value="${portfolioVO.ptflUpdtDt}" pattern="yyyy-MM-dd" /></p>
		</div>

		<p> <input type="hidden" name="memId" value="${portfolioVO.memId}" /> </p>
		<p> <input type="hidden" name="ptflNo" value="${portfolioVO.getPtflNo()}" /> </p>
		
		<div class="ptfl-name">
			${portfolioVO.ptflTitle}
		</div>
			
		<div id="wrapper">
			
			
			<c:forEach var="portVO" items="${portfolioVO.portfolioFreeVOList}">
				<div class="ptfl-one-line">
					<p class="ptfl-tit">${portVO.ptflFreeq} </p>
					
					<pre class="ptfl-cntnt">${portVO.ptflFreea}</pre>
				</div>
			</c:forEach>
		
			
		</div>

		<div class="fixed-footer">
			<div class="cen">
				<button type="button" class="p-17 btn-big" id="btnPDFSave">PDF저장</button>
				<button type="button"
					class="btn btn-big btn-primary p-17 btn-user btn-block" onclick="window.location.href='/memberPortfolio/portfolioList'">목록</button>
				<button type="submit" id="edit"
					class="btn btn-big btn-primary p-17 bg-sig color-white btn-user btn-block">수정</button>
				<button type="button" id="delete"
					class="btn btn-big btn-primary p-17  bg-red color-white  btn-user btn-block">삭제</button>
			</div>
		</div>
	</form>
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
                $("#frm").attr("action", "/memberPortfolio/portfolioDeletePost?${_csrf.parameterName}=${_csrf.token}");
                $("#frm").submit();
        } else {
            alert("삭제가 취소되었습니다");
        }
    });
	 

	$(document).on("click", "#btnPDFSave", function() {
		
		let fixedFooter = document.querySelector(".fixed-footer");
		
		fixedFooter.style.display = "none";
		
		const element = document.querySelector("#frm");
		
		window.scrollTo(0,0);
		
		html2canvas(element).then(function(canvas) {
            // 캔버스를 이미지로 변환
			var imgData = canvas.toDataURL('image/png');
            
	        let margin = 20; // 출력 페이지 여백설정
	        let imgWidth = 210 - (20 * 2); // 이미지 가로 길이(mm) A4 기준
	        let pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
	        let imgHeight = canvas.height * imgWidth / canvas.width;
	        
	        let heightLeft = imgHeight;
			
			// jsPDF 객체 생성
			var doc = new jsPDF('p', 'mm', 'a4');
			let position = margin;
			
			// 이미지를 PDF에 추가
			doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
			heightLeft -= pageHeight;
			
	        while (heightLeft >= 20) {
	        	
	            position = heightLeft - imgHeight;
	            doc.addPage();
	            doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
	            heightLeft -= pageHeight;
	        }
			
	        doc.save('MyPortfolio.pdf');
			
// 			var blob = pdf.output('blob');
// 			var uploadFile = new FormData();
// 			uploadFile.append('uploadFile', blob);
			
			
// 			// 서버로 전송
// 			$.ajax({
// 			    type: 'POST',
// 			    url: '/mypageMem/uploadFile',
// 			    data: uploadFile,
// 			    processData: false,
// 			    contentType: false,
// 			    enctype: 'multipart/form-data',
// 			    beforeSend: function(xhr) {
// 			        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
// 			    },
// 			    success: function(rst) {
			    	
// 					console.log(rst);
// 			    },
// 			    error: function(error) {
// 			        console.error('오류 발생:', error);
// 			    }
// 			});
		});
		window.scrollTo(0, document.body.scrollHeight || document.documentElement.scrollHeight);
		
		fixedFooter.style.display = "block";
	});
	 
});

</script>

