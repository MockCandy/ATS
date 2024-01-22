<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="/resources/css/news.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>


<form action="/news/updatePost" method="post" enctype="multipart/form-data">
<div class="bg-white">
	<div class="cen">
		<input type="hidden" name="boardId" value="${boardNewsVO.boardId}" />
		<div class="board01">
			<div class="board-top">
				<p id="title" name="boardTitle" class="boardTitle" >
				<input type="text" id="title" name="boardTitle"
					class="input01 w-100"
					value="${boardNewsVO.boardTitle}" />
				</p>
				<div class="flex">
					<p class="board-writeDt">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${boardNewsVO.boardWritingDt}" />
					</p>
					<p class="board-cnt">
						조회수 ${boardNewsVO.boardCnt}
					</p>
				</div>
			</div>
	
	
			<div class="board-cont">
				<div class="board-img">
					<c:forEach var="fileNm"
						items="${boardNewsVO.atchFileVO.atchFileDetailVOList}">
						<img class="newsImg" 
						src="http://localhost/file/download.do?afId=${fileNm.afId }&afdSeq=${fileNm.afdSeq}"
							alt=""> 
							
					</c:forEach>
				</div>
				<div id="imagePreview" class="input-file-box">
				
					<p class="bold mb-15">파일 첨부</p>
					
				    <input class="upload-name" readonly value="첨부파일" placeholder="첨부파일">
				    <label for="fileInput">파일찾기</label> 
				    <input type="file" name="uploadFile" id="fileInput" >
				    
				</div>
				
				<textarea name="boardCntnt" 
					class="input01 w-100 ph-cont resize-none inp-transparent"
					style="height:300px; overflow-y:scroll">${boardNewsVO.boardCntnt}</textarea>
				<!-- 수정모드 시작 -->
		
				<div class="flex mt-auto" style="gap:10px">
					<button type="submit" class="btn btn-sm hover_sig ml-auto">
						저장</button> 
					<button type="button" class="btn btn-sm hover_red" onclick="history.back()" >취소</button>
				</div>
			</div>
		</div>
	</div>
</div>
			
			

	<sec:csrfInput />
</form>

<script type="text/javascript">

document.getElementById('fileInput').addEventListener('change', function() {
    
	var file = this.files[0];
    
	var reader = new FileReader();
    
	var imagePreview = document.getElementById('imagePreview');
    
	var photw = document.querySelector(".board-img");

    console.log(photw);
    
    reader.onload = function(e) {
    	
    	var img = '';
    	
    	img += '<img src="'+e.target.result+'" alt="Selected Image" >';

    	photw.innerHTML = img; 
    }

    reader.readAsDataURL(file);
});
</script>





