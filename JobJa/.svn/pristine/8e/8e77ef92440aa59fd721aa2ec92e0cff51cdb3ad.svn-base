<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.board {
		border-radius:0;
	}
	
	.photoA {
		width:100%!important;
		height:100%!important;
		object-fit:cover!important;;
	}
	.containerd  {
		width:135px;
	}
</style>

<link rel="stylesheet" href="/resources/css/news.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<script type="text/javascript">
$(function(){
	
	$("#delete").on("click",function(){
		
		$("#frm").attr("method","POST");
		$("#frm").attr("action","/boardConsulting/deletePost");
		
		let result = confirm("삭제하시겠습니까?");
		
		if(result > 0){
			$("#frm").submit();
			
			
		}else{
			
			alert("삭제가 취소되었습니다");
			
		}
	});
});
</script>

<form action="/boardConsulting/detailUpdate" method="get" id="frm">
<input type="hidden" name="boardId" value="${boardEmplConsultVO.boardId}" />
<div class="cen" style="margin:auto;">
	<div class="board">
		<div class="flex">
			<p id="title" name="boardTitle" class="input01 ph-tit w-100 inp-transparent" >${boardEmplConsultVO.boardTitle}</p>
			<c:if test="${getCurrentLoginVO.memId == boardEmplConsultVO.memId }">
				<div class="containerd ml-auto">
					<button type="submit" id="edit" class="btn btn-primary btn-sm bg-sig txt-white btn-user btn-block">수정</button>
					<button type="button" id="delete" class="btn btn-primary btn-sm bg-red txt-white btn-user btn-block">삭제</button>
				</div>
			</c:if>
		</div>
		
		<dl class="content_info fix flex mb-40" disabled>
			<dt class="p-14 bold">
				등록일 :
				<fmt:formatDate pattern="yyyy-MM-dd" value="${boardEmplConsultVO.boardWritingDt}" />
			</dt>
 
			<dt class="p-14 bold ml-auto">조회수 : ${boardEmplConsultVO.boardCnt}</dt>

		</dl>

		<div class="mb-30" style="text-align: center; margin:0 auto; max-width: 400px;" align="center" disabled >
			<c:forEach var="fileNm" items="${boardEmplConsultVO.atchFileVO.atchFileDetailVOList}">
				<img class="photoA" src="/resources/upload/${fileNm.afdSaveNm}" alt="">
			</c:forEach>
		</div>
		
		<pre name="boardCntnt" disabled
			class="input01 w-100 ph-cont resize-none inp-transparent"
			style="max-height: 500px;">${boardEmplConsultVO.boardCntnt}</pre>
		<div id="file-preview" class="mt-2"></div>

		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="containerd">
				<button type="submit" id="edit" class="btn btn-primary btn-user btn-block">수정</button>
				<button type="button" id="delete" class="btn btn-primary btn-user btn-block">삭제</button>
			</div>
		</sec:authorize>
		<a class="listbtn btn btn-sm" href="/boardConsulting/list">목록</a>
	</div>
</div>
<span id="spn1"> </span>
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