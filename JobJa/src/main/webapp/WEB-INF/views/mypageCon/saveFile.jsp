<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<style>
.mypage-body-con {
	background-color: #fff;
	border-radius: 30px;
	padding: 24px;
	height: 800px;
}

.body-sub-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 8px;
}

.title-hr {
	border: 1px solid #ccc;
	margin-bottom: 8px;
}

.fileBtn {
	font-size: 14px;
	display: inline-block;
	box-sizing: border-box;
	color: rgb(0, 195, 98);
	border: 1px solid rgb(0, 195, 98);
	border-radius: 6px;
	padding: 9px 12px;
	margin-top: 10px;
	background: #fff;
	cursor: pointer;
}

.delFileBtn {
	font-size: 14px;
	display: inline-block;
	box-sizing: border-box;
	color: rgb(0, 195, 98);
	border: 1px solid rgb(0, 195, 98);
	border-radius: 6px;
	padding: 9px 12px;
	background: #fff;
	cursor: pointer;
}

.file-list {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    height: 65px;
    border: 1px solid rgb(229, 230, 233);
    border-radius: 10px;
    padding: 10px 15px;
    margin-bottom: 15px;
    list-style-type: none;
}

.file-title{
  font-weight: bold; 
  font-size: 18px; 
}


.file-list li {
	display: flex;
    align-items: center;
    margin: 15px;
	padding: 5px;
	width: 100%;
    justify-content: space-between;
}

.file-list li button {
    cursor: pointer;
}

.btn-upload {
	font-size: 16px;
/* 	font-weight:bold; */
	width: 150px;
	height: 50px;
	background: #fff;
	border-radius: 10px;
	ont-weight: 500;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 10px;
	border: 2px solid rgb(0, 195, 98);
	color: rgb(0, 195, 98);
	padding: 9px 12px;
}

a:hover {
    	text-decoration: revert;
  }

#fileInput {
  display: none;
}

.delFileBtn {
  margin-left: 20px;
}

.fileListDiv {
	display: flex;
	align-items: center;
    justify-content: space-between;
	width: 100%;
}

.fileNameDiv {
	width: 15%;
}

</style>

<div class="mypage-body-con">
	<div class="sub-con-area">
		<div class="body-sub-title"> 파일 보관함 </div>
		<hr class="title-hr" />
	</div>
	
	<div class="body-sub-con">
	
		<div class="inner-box2">
			<div class="div-files">
				<div>
					<h2 class="file-title mt-20 mb-20">보관할 파일을 추가해주세요</h2>
				</div>
				<div id="fileListsContainer">
					<c:forEach var="atchFile" items="${memberVO.atchfileDetailVO}" varStatus="stat">
						<c:if test="${atchFile != null}">
							<ul class="file-list">
								<li>
									<div class="fileListDiv">
											<div class="fileNameDiv">
												<a href="http://localhost/file/download.do?afId=${atchFile.afId }&afdSeq=${atchFile.afdSeq}" class="alink">${atchFile.afdOriginNm}</a>
											</div>
											<div>
												<span><fmt:formatDate value="${atchFile.afdUploadDt}" pattern="yyyy-MM-dd" /></span>
											</div>
											<div>
												<button type="button" class="delFileBtn" data-afd-seq="${atchFile.afdSeq}" data-af-id="${atchFile.afId}">삭제 </button>
											</div>
									</div>
								</li>
							</ul>
						</c:if>
					</c:forEach>
				</div>
					<label for="fileInput"><div class="btn-upload"> + 파일 선택 </div> </label>
						<input type="file" class="fileBtn" name="file" id="fileInput" onchange="handleFileSelect()" />
			</div>
		</div>
		
	</div>
</div>

<script type="text/javascript">

	let files = [];

$(function(){
	$(document).on("click",".delFileBtn",function(){
		console.log("삭제버튼이얌");
		
		// 삭제 버튼 클릭시
		let afdSeq = $(this).data("afdSeq");
		let afId = $(this).data("afId");
		
		$(this).closest('ul').remove();
// 		$(this).parent().parent().parent().remove();
		
		let data = {
			"afdSeq":afdSeq,
			"afId":afId
		};
		
		console.log("data : ", data);
		
		$.ajax({
			url:"/enter/deleteFileAjax",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"POST",
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

function handleFileSelect() {
    const fileInput = document.getElementById('fileInput');
    const fileListsContainer = document.getElementById('fileListsContainer');
    
    const file = fileInput.files[0];
    if (file) {
    	
        const uploadFile = new FormData();
        uploadFile.append('uploadFile', file);
        
        files.push(file);

        $.ajax({
            url: '/enter/entUploadFile',
            type: 'POST',
            data: uploadFile,
            contentType: false,
            processData: false,
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(fileDetailList) {
                // 서버 응답에 대한 처리를 원하는 대로 추가
                // response : List<AtchFileDetailVO>
                console.log("fileDetailList : ", fileDetailList);
                
                $("#fileListsContainer").html("");
                
                // fileDetailList가 리스트이므로 각각의 아이템을 처리
                fileDetailList.forEach(function(atchFileDetailVO) {
                    const ul = document.createElement('ul');
                    ul.classList.add('file-list');
                    const li = document.createElement('li');
                    li.innerHTML =
                        '<div class="fileNameDiv"><a href="http://localhost/file/download.do?afId='+atchFileDetailVO.afId+'&afdSeq='+atchFileDetailVO.afdSeq+'">' + atchFileDetailVO.afdOriginNm + '</a></div>' +
                        '<div><span>' + atchFileDetailVO.afdUploadDt + '</span></div>' +
                        '<div><p><button type="button" class="delFileBtn" data-afd-seq="' + atchFileDetailVO.afdSeq + '" data-af-id="' + atchFileDetailVO.afId + '"> 삭제 </button></p></div>';
                    ul.appendChild(li);
                    
                    fileListsContainer.appendChild(ul);
                });
            },

            error: function(error) {
                // 에러 발생 시 처리를 원하는 대로 추가
                console.error('File upload failed:', error);
            }
        });
    }
}

// function downloadFile(linkElement) {
//     const ulElement = linkElement.closest('ul');
//     const index = Array.from(ulElement.parentElement.children).indexOf(ulElement);
//     const file = files[index];

//     const blob = new Blob([file], { type: file.type });
//     const url = URL.createObjectURL(blob);

//     const a = document.createElement('a');
//     a.href = url;
//     a.download = file.name;
//     a.click();

//     URL.revokeObjectURL(url);
// }



$(document).on("click", ".alink", function(e){
	if(confirm("해당 파일을 다운로드 받으시겠습니까?")){
		alert("파일을 다운로드 받습니다.")
	}else{
		e.preventDefault();
		e.stopPropagation();
	};
})




</script>