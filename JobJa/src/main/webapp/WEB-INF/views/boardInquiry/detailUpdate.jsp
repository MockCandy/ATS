<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/resources/css/boardInquiry.css">

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

<form action="/boardInquiry/updatePost" method="post" enctype="multipart/form-data">
	<input type="hidden" name="boardId" value="${boardInquiryVO.boardId}" />
	<div class="cen" >
		<div class="board">
			<div class="flex">
				<input type="text" id="title" name="boardTitle" class="input01 ph-tit w-100 inp-transparent" 
					value="${boardInquiryVO.boardTitle}" />
			</div>
			
			<dl class="content_info fix" disabled>
				<dt class="p-14 bold">
					등록일 :
					<fmt:formatDate pattern="yyyy년  MM월 dd일" value="${boardInquiryVO.wirtDt}" />
				</dt>
			</dl>
			
			<div class="photw" style="text-align: center;" align="center" >
				<c:forEach var="fileNm" items="${boardInquiryVO.atchFileVO.atchFileDetailVOList}">
					<img class="phot" src="/resources/upload/${fileNm.afdSaveNm}" alt="">
				</c:forEach>
			</div>
			
			
	
			<div style="text-align: center; margin:0 auto; max-height: 400px; max-width: 600px;" align="center" disabled >
				<c:forEach var="fileNm" items="${boardInquiryVO.atchFileVO.atchFileDetailVOList}">
					<img class="photoA" src="/resources/upload/${fileNm.afdSaveNm}" alt="">
				</c:forEach>
			</div>
			
			<textarea name="boardCntnt"
				class="input01 mt-40 w-100 ph-cont resize-none inp-transparent"
				style="min-height: 200px; margin-bottom:50px; ">${boardInquiryVO.boardCntnt}</textarea>
				
			<div id="file-preview" class="mt-2"></div>
			
			<div id="imagePreview">
			    <input type="file" name="uploadFile" id="fileInput"  >
			</div>
			
			<div class="flex mt-30">
				<div class="ml-auto">
					<button type="submit" id="edit" class="btn btn-sm btn-primary btn-user btn-block">저장</button>
				</div>
			</div>
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