<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<style>
body{
	background-color:#fff;
}
</style>

	<div class="flex">
		<p class="body-sub-title mb-20">이력서</p>
		<button class="btn btn-sm bg-sig txt-white ml-auto bold" id = "btn-createResume">이력서 작성</button>
	</div>
	
	<c:forEach var="resumeVO" items="${data}" >
		<a href="/memberResume/memberDetailResume?resumeNo=${resumeVO.resumeNo}">
			<div class="resume-item">
			
				<div class="resume-top mb-7">
					<c:if test="${resumeVO.resumeRep == 'RRY01002' }">
						<span class="badge-nm bg-sig txt-white">대표이력서</span>
					</c:if>
					<c:if test="${resumeVO.resumeTemp == 'RTS01001' }">
						<span class="badge-nm bg-gray">임시저장</span>
					</c:if>
				</div>
				<div class="resume-cont">
					<p class="p-14 mb-3 bold">이력서 제목</p>
					<p class="resume-tit">${resumeVO.resumeTitle}</p>
				</div>
			</div>
		</a> 
	</c:forEach>
	<div class="pagez">${info.getPagingArea()}
	</div>
	
	<div class="file-box">
		<div class="div-files">
			<div>
				<h2 class="body-sub-title">파일함</h2>
				<p class="txt-gray p-15 mb-9">20MB 이하의 파일을 추가할 수 있어요</p>
            </div>
            <div id="fileListsContainer">
				<ul class="file-list">
	            	<c:forEach var="atchFile" items="${memberVO.atchfileDetailVO}" varStatus="stat">
	            		<c:if test="${atchFile != null}">
								<li class="file-item">
									<div>
										<c:choose>
											<c:when test="${atchFile.afdExtsn == 'jpg' || atchFile.afdExtsn == 'jpeg' }">
												<img alt="" src="/resources/images/icon_file_jpg.svg">
											</c:when>
											<c:when test="${atchFile.afdExtsn == 'png' }">
												<img alt="" src="/resources/images/icon_file_png.svg">
											</c:when>
											<c:when test="${atchFile.afdExtsn == 'pdf' }">
												<img alt="" src="/resources/images/icon_file_pdf.svg">
											</c:when>
											<c:when test="${atchFile.afdExtsn == 'pptx' }">
												<img alt="" src="/resources/images/icon_pptx.svg">
											</c:when>
											<c:when test="${atchFile.afdExtsn == 'xlsx' }">
												<img alt="" src="/resources/images/icon_xlsx.svg">
											</c:when>
											<c:when test="${atchFile.afdExtsn == 'xls' }">
												<img alt="" src="/resources/images/icon_xls.svg">
											</c:when>
											<c:when test="${atchFile.afdExtsn == 'hwp' }">
												<img alt="" src="/resources/images/icon_hwp.svg">
											</c:when>
										</c:choose>
										<a href="http://localhost/file/download.do?afId=${atchFile.afId }&afdSeq=${atchFile.afdSeq}">${atchFile.afdOriginNm}</a>
										<span class="fileSize">${atchFile.afdFileSize }</span>
									</div>
									<div class="dateDel">
										<span class="time">${atchFile.afdUploadDt }</span>
										<i data-afd-seq="${atchFile.afdSeq}" data-af-id="${atchFile.afId}" class="fa-regular fa-trash-can deleteIcon" style="color:rgb(104,106,109)"></i>
									</div>
								</li>
	            		</c:if>
					</c:forEach>
				</ul> 
				<div id="imagePreview" class="input-file-box-sig mt-20">
				    <label for="fileInput"><i class="fa-solid fa-plus"></i>파일찾기</label> 
				    <input type="file" name="uploadFile" id="fileInput" onchange="handleFileSelect()">
				</div>
            </div>
        </div>
    </div>
	
	

<script type="text/javascript" src="/resources/js/func.js"></script>
 <script type="text/javascript">
 
	let files = [];
	
	let fileSize = document.querySelectorAll(".fileSize");
	console.log(fileSize);
	for(let i = 0; i < fileSize.length; i++){
		console.log(fileSize[i].innerText);
		fileSize[i].innerText = getByteSize(fileSize[i].innerText);
	}
	
	timeConvert();
	
	function handleFileSelect() {
	    const fileInput = document.getElementById('fileInput');
	    const fileListsContainer = document.getElementById('fileListsContainer');
	    const fileList = document.querySelector('.file-list');
	    
	    const file = fileInput.files[0];
	    if (file) {
	    	
	        const uploadFile = new FormData();
	        uploadFile.append('uploadFile', file);
	        
	        files.push(file);
	
	        $.ajax({
	            url: '/memberResume/uploadFile',
	            type: 'POST',
	            data: uploadFile,
	            contentType: false,
	            processData: false,
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
	            success: function(atchFileDetailVO) {
	                // 서버 응답에 대한 처리를 원하는 대로 추가
	                //response : atchFileDetailVO
	                console.log("atchFileDetailVO : " ,atchFileDetailVO);
	            
                	let str = '';
	    	        str += '<li class="file-item">'
	    	        str += '<div>';
					if(atchFileDetailVO.afdExtsn == 'jpg' || atchFileDetailVO.afdExtsn == 'jpeg' ){
						str += '<img alt="" src="/resources/images/icon_file_jpg.svg">';
					}else if(atchFileDetailVO.afdExtsn == 'png'){
						str += '<img alt="" src="/resources/images/icon_file_png.svg">';
					}else if(atchFileDetailVO.afdExtsn == 'pptx'){
						str += '<img alt="" src="/resources/images/icon_pptx.svg">';
					}else if(atchFileDetailVO.afdExtsn == 'pdf'){
						str += '<img alt="" src="/resources/images/icon_file_pdf.svg">';
					}else if(atchFileDetailVO.afdExtsn == 'xls'){
						str += '<img alt="" src="/resources/images/icon_xls.svg">';
					}else if(atchFileDetailVO.afdExtsn == 'xlsx'){
						str += '<img alt="" src="/resources/images/icon_xlsx.svg">';
					}else if(atchFileDetailVO.afdExtsn == 'hwp'){
						str += '<img alt="" src="/resources/images/icon_hwp.svg">';
					}
	    	        str += '<a  href="http://localhost/file/download.do?afId='+atchFileDetailVO.afId+'&afdSeq='+atchFileDetailVO.afdSeq+'">' + file.name + '</a>';
	    	        str += '<span class="fileSize">'+atchFileDetailVO.afdFileSize+'</span>';
	    	        str += '</div>';
	    	        str += '<div class="dateDel">';
	    	        console.log("####",atchFileDetailVO)
	    	        str += '<span class="time">'+atchFileDetailVO.afdUploadDt+'</span>';
	    	        str += '<i data-afd-seq="'+atchFileDetailVO.afdSeq+'" data-af-id="'+atchFileDetailVO.afId+'" class="fa-regular fa-trash-can deleteIcon" style="color:rgb(104,106,109)"></i>';
	    	        str += '</div>';
    	            fileList.insertAdjacentHTML('beforeend', str);
	    	

    	        	let fileSize = document.querySelectorAll(".fileSize");
   	        		fileSize[fileSize.length - 1].innerText = getByteSize(fileSize[fileSize.length - 1].innerText);
    	            
   	        		
   	        		
	            },
	            error: function(error) {
	                // 에러 발생 시 처리를 원하는 대로 추가
	                console.error('File upload failed:', error);
	            }
	        });
	    }
	}
	
	$(function(){
		$(document).on("click",".deleteIcon",function(){
			// <button type="button" class="deleteIcon" data-afd-seq="6" data-af-id="a111">Delete</button>
			let afdSeq = $(this).data("afdSeq");
			let afId = $(this).data("afId");
			
			console.dir($(this));
			
			$(this)[0].parentElement.parentElement.remove();
			
			let data = {
				"afdSeq":afdSeq,
				"afId":afId
			};
			
			console.log("data : ", data);
			
			$.ajax({
				url:"/memberResume/deleteFileAjax",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data),
				type:"post",
				dataType:"text",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(result){
					console.log("result : ", result);
				}
			});
			
		});
	});
	
	
	function downloadFile(linkElement) {
	    const ulElement = linkElement.closest('ul');
	    const index = Array.from(ulElement.parentElement.children).indexOf(ulElement);
	    const file = files[index];
	
	    const blob = new Blob([file], { type: file.type });
	    const url = URL.createObjectURL(blob);
	
	    const a = document.createElement('a');
	    a.href = url;
	    a.download = file.name;
	    a.click();
	
	    URL.revokeObjectURL(url);
	}
	
	$(document).on("click", "#btn-createResume", function() {
		
		window.location.href = "/memberResume/memberCreateResume";
	});
	
// 	function formatBytes(bytes, decimals = 2) {
// 	    if (bytes === 0) return '0 Bytes';
	
// 	    const k = 1024;
// 	    const dm = decimals < 0 ? 0 : decimals;
// 	    const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
	
// 	    const i = Math.floor(Math.log(bytes) / Math.log(k));
	
// 	    return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
// 	}
</script>