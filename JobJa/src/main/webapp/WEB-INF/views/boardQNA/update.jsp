<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	.img-grid {
		display:grid;
		width:100%;
		grid-template-columns: 1fr 1fr 1fr;
		gap:20px;
	}
	.img-grid img {
		width:100%;
		min-height:200px;
		max-height:200px;
		object-fit: cover;
	}
	.img-grid>div{
		position:relative;
	}
	.x{
		position:absolute;
		top:0;
		right:0;
		width:25px;
		height:25px;
		background-color:black;
		display:flex;
		align-items:center;
		justify-content:center;
		color:red;
	}
</style>
<div class="cen" style="margin: 50px auto;">
    <p class="main-h1">취업 Q&A</p>

    <div class="board">
    
        <p class="main-tit">글 수정</p>

        <div class="h-div-line"></div>
		
		<form action="/boardQNA/updateForm?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
			<input type="hidden" name="boardId" value="${boardQNAVO.boardId}" >
	        <input id="title" name="boardTitle" type="text" class="input01 ph-tit w-100 inp-transparent" value="${boardQNAVO.boardTitle }" placeholder="제목을 입력해 주세요">
			
	        <textarea name="boardCntnt" class="input01 w-100 ph-cont resize-none inp-transparent" style="height: 500px;" placeholder="내용을 입력해 주세요">${boardQNAVO.boardCntnt }</textarea>
	        
	        <div class="flex align-center">
	            <div class="filebox bs3-primary preview-image flex" >
	                <input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
	
	                <label for="uploadFile" class="ml-7" style="margin-bottom:0;">업로드</label> 
	                <input type="file" id="uploadFile" name="uploadFile" class="upload-hidden"> 
	            </div>
	            
	            <button type="submit" class="btn btn-write ml-auto">게시글 수정</button>
	        </div>
	        
	        <div id="img-preview" class="mt-12"></div>

     		<div class="img-grid">
				<c:forEach var="atchFileDetailVO" items="${boardQNAVO.atchFileDetailVOList}">
					<div>
						<img src="/resources/upload/${atchFileDetailVO.afdSaveNm }">
						<span>${atchFileDetailVO.afdOriginNm }</span>
						<div class="x">X</div>
						<input type="hidden" name="afId" value="${atchFileDetailVO.afId}" />
						<input type="hidden" name="afdSeq" value="${atchFileDetailVO.afdSeq }" />
					</div>
				</c:forEach>
			</div>
	        
	        
	        <input type="hidden" name="memId" value="a111" />
	        
			<sec:csrfInput />
			
		</form>

    </div>

</div>
<script src="/resources/js/boardQNAUpdate.js"></script>
<script>
let grid = document.querySelectorAll(".img-grid");
console.log(grid);
for(let i = 0; i < grid.length; i++){
	grid[i].addEventListener("click", function(e){
		
		if(e.target.className == "x"){
		
			if(confirm("해당 사진을 삭제하시겠습니까? ")){
				
				console.dir(e.target);
				let afId = e.target.parentElement.children.afId;
				let afdSeq = e.target.parentElement.children.afdSeq;
				console.log(afId);
				console.log(afdSeq);
				
				let data = {
					"afId": afId.value,
					"afdSeq": afdSeq.value
				};
				console.log("data : ", data);
				
				console.log(header);
				console.log(token);
				$(function() {
				    $(document).ajaxSend(function(e, xhr, options) {
				        xhr.setRequestHeader(header, token);
				    });
				});
				
				console.log(data);
				
				$.ajax({
					
					url : "/file/deleteOneAtch",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify(data),
					type:"post",
					dataType:"json",
					beforeSend:function(xhr){
						xhr.setRequestHeader(header,token);
					},
					success:function(res){
						console.log("res : " , res);
						alert("정상적으로 삭제되었습니다.");
						
						let grid = $(".img-grid");
						
						grid.html("");
						
						let files = "";
						
						for(let i = 0; i < res.length; i++){
							files += "<div>";
							
							files += "<img src='/resources/upload/"+res[i].streFileNm+"'>";
							
							files += "<span>" + res[i].orignlFileNm + "</span>";
							
							files += "<div class='x'>X</div>";
							
							files += "<input type='hidden' name='atchFileId' value='"+res[i].atchFileId+"' />";
							files += "<input type='hidden' name='fileSn' value='"+res[i].fileSn+"' />";
							
							files += "</div>";
						}
						console.log(files);
						
						grid.append(files);
						
					},
					error:function(xhr){
						console.log(xhr);
						alert("삭제가 실패하였습니다.")
					}
					
				})
			}else{
				return;
			}
			
		}
		
	})
}

let uploadFile = $("#uploadFile");
console.log(uploadFile);

uploadFile.on("click", function(e){
	
	let imgGrid = $(".img-grid");
	console.log(imgGrid[0].child);
})

var fileTarget = $('#uploadFile');

   fileTarget.on('change', function(){
       if(window.FileReader){
           // 파일명 추출
           var filename = $(this)[0].files[0].name;
       } 

       else {
           // Old IE 파일명 추출
           var filename = $(this).val().split('/').pop().split('\\').pop();
       };

       $(this).siblings('.upload-name').val(filename);
   });

   $("#uploadFile").on("change",handleImg);

//e : onchange 이벤트 객체
function handleImg(e){
   //files : ala.jpg, bara1.jpg, bars2.jpg
   let files = e.target.files;
   let fileArr = Array.prototype.slice.call(files);
   //fileArr = [ala.jpg, bara1.jpg, bars2.jpg]
   fileArr.forEach(function(f){
       console.log(f);
       if(!f.type.match("image.*")){
           alert("이미지 확장자만 가능합니다.");
           $("#uploadFile").val('');
           return;
       }
       console.dir(f);
       let reader = new FileReader();
       //e : reader가 이미지 객체를 읽는 이벤트
       reader.onload = function(e){
       let img_html = "<div>";
	   img_html += "<img src='"+e.target.result + "' style='width:100%;' />";
	   img_html += '<span>'+f.name+'</span>';
		img_html += '<div class="x">X</div>';
		img_html += '<input type="hidden" name="afId" value="${boardQNAVO.boardId}" />';
		img_html += '<input type="hidden" name="afdSeq" value="1" />';
	          //요소.append : 누적, 요소.html : 새로고침, 요소.innerHTML : J/S에서 새로고침
	          console.log(img_html);
	          console.log($(".img-grid"));
	          $(".img-grid").html(img_html);
	      }
	      reader.readAsDataURL(f);
   });
}

</script>