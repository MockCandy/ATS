<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/resources/css/news.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<style>
	.board {
		border-radius:0;
	}
	
	.photoW {
		width:100%!important;
		height:100%!important;
		object-fit:cover!important;;
	}	
	.photoW img{
		width:400px!important;
	}
	.containerd  {
		width:135px;
	}
	#imagePreview {
		margin-top:20px;
	}
</style>
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

<form action="/boardConsulting/updatePost" method="post" enctype="multipart/form-data">
	<input type="hidden" name="boardId" value="${boardEmplConsultVO.boardId}" />
	<div class="cen" style="margin: auto;">
		<div class="board">
			<div class="flex">
				<input type="text" id="title" name="boardTitle" class="input01 ph-tit w-100 inp-transparent" 
					value="${boardEmplConsultVO.boardTitle}" />
					
				<!-- 수정모드 시작 -->
				<span id="spn2" class="containerd ml-auto">
					<button type="submit" class="btn btn-sm bg-sig txt-white btn-primary btn-user btn-block">저장</button> 
					<a href="/boardConsulting/detail?boardId=${boardEmplConsultVO.boardId}" class="btn btn-sm bg-red txt-white"> 취소 </a>
				</span>
						
			</div>

			<dl class="content_info fix flex p-14 bold mb-40" disabled>
				<dt>
					등록일 :
					<fmt:formatDate pattern="yyyy년  MM월 dd일" value="${boardEmplConsultVO.boardWritingDt}" />
				</dt>
				<dt class="ml-auto">조회수 :${boardEmplConsultVO.boardCnt}</dt>
			</dl>

			<div class="photw" style="text-align: center;" align="center" >
				<c:forEach var="fileNm" items="${boardEmplConsultVO.atchFileVO.atchFileDetailVOList}">
					<img class="phot" style="width:400px;" src="/resources/upload/${fileNm.afdSaveNm}" alt="">
				</c:forEach>
			</div>
			<div id="imagePreview"style="text-align:center;">
			    <input type="file" name="uploadFile" id="fileInput"  >
			</div>
			
			<textarea name="boardCntnt" 
				class="input01 w-100 ph-cont resize-none inp-transparent"
				style="max-height: 500px;">${boardEmplConsultVO.boardCntnt}</textarea>
			<div id="file-preview" class="mt-2"></div>
		</div>
	</div>
	<sec:csrfInput />
</form>

<script>

	document.getElementById('fileInput').addEventListener('change', function() {
	    
		var file = this.files[0];
	    
		var reader = new FileReader();
	    
		var imagePreview = document.getElementById('imagePreview');
	    
		var photw = document.querySelector(".photw");
	
	    console.log(photw);
	    
	    reader.onload = function(e) {
	    	
	    	var img = '';
	    	
	    	img += '<img src="'+e.target.result+'" alt="Selected Image" >';
	
	    	photw.innerHTML = img; 
	    }
	
	    reader.readAsDataURL(file);
	});
	
	function previewFile() {
		console.log("asdasdasd");
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