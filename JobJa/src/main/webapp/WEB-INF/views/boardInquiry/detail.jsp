<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/resources/css/boardInquiry.css">
<link rel="stylesheet" href="/resources/css/mypage.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<script type="text/javascript">
$(function(){
	
	$("#delete").on("click",function(){
		
		$("#frm").attr("method","POST");
		$("#frm").attr("action","/boardInquiry/deletePost");
		
		let result = confirm("삭제하시겠습니까?");
		
		if(result > 0){
			
			$("#frm").submit();
			
		}else{
			
			alert("삭제가 취소되었습니다");
			
		}
	});
}); 
</script>

<form action="/boardInquiry/detailUpdate" method="get" id="frm">
<input type="hidden" name="boardId" value="${boardInquiryVO.boardId}" />
<div class="cen" >
	<div class="board" style="border-radius:0;">
		<div class="flex">
			<p id="title" name="boardTitle" class="input01 p-24 ph-tit inp-transparent" >${boardInquiryVO.boardTitle}</p>
			<div class="ml-auto">
				<button type="button" class="listbtn btn btn-sm" onclick="history.back()">목록</button>
				<button type="submit" id="edit" class="btn btn-sm btn-primary btn-user btn-block">수정</button>
				<button type="button" id="delete" class="btn btn-sm btn-red btn-primary btn-user btn-block">삭제</button>
			</div>
		</div>
		
		<dl class="content_info fix" disabled>
			<dt class="p-14 bold mb-40">
				등록일 :
				<fmt:formatDate pattern="yyyy년  MM월 dd일" value="${boardInquiryVO.wirtDt}" />
			</dt>
		</dl>

		<div style="text-align: center; margin:0 auto; max-height: 400px; max-width: 600px;" align="center" disabled >
			<c:forEach var="fileNm" items="${boardInquiryVO.atchFileVO.atchFileDetailVOList}">
				<img class="photoA" src="/resources/upload/${fileNm.afdSaveNm}" alt="">
			</c:forEach>
		</div>
		
		<textarea name="boardCntnt" disabled
			class="input01 mt-40 w-100 ph-cont resize-none inp-transparent"
			style="min-height: 200px; margin-bottom:50px; ">${boardInquiryVO.boardCntnt}</textarea>
		<div id="file-preview" class="mt-2"></div>
		
		<div class="rsm_hgroup">
			<div class="rsm-vertical-center">
				<h3 class="rsm_ttl bold p-18 mb-30">답변</h3>
			</div>
		</div>
		
		<div class="admin-answer">
			<textarea name="boardAdminAnswer" id="boardAdminAnswer" readonly>${boardInquiryVO.boardAdminAnswer}</textarea>
		</div>
	</div>
</div>
<sec:csrfInput />
</form>

<script>
	function previewFile() {
		const preview = document.getElementById('file-preview');
		const file = document.querySelector('input[type=file]').files[0];
		const reader = new FileReader();

		reader.onloadend = function() {
			const img = document.createElement('img');
			img.src = reader.result;
			img.style.maxWidth = '300px';
			img.style.maxHeight = '300px';
			img.style.width = 'auto';
			img.style.height = 'auto';
			preview.innerHTML = '';
			preview.appendChild(img);
		}

		if (file) {
			reader.readAsDataURL(file);
		} else {
			preview.innerHTML = '미리보기 없음';
		}
	}
</script>