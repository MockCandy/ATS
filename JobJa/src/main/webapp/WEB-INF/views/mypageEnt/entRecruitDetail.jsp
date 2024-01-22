<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="/resources/css/recruitList.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.css">

<style>
.mypage-body-con{
	background-color: #fff;
	border-radius: 30px;
 	padding: 24px; 
 	height: 800px;
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

.summary {
	border-bottom: 1px solid #c9c9c9;
    padding: 0px 0px 20px 30px;
}
.btn {
	float: right;
}

</style>


<div class="mypage-body-con">
	<div class="sub-con-area">
		<div class="body-sub-title">기업 마이페이지</div>
		<hr class="title-hr"/>
	</div>
		
		<div class="body-sub-con">

<div class="cen">
	<div class="ent-recruit-detail-area">
	
	<!-- 삭제 버튼 깡통입니다~~ -->
	<button type="button" class="btn">삭제</button>
	
		<div class="recruit-info">
			<p class="rec-tit">
				${recruitVO.recruitPart }
			</p>
			
			<div class="flex align-center">
				<p class="p-14">${recruitVO.enterpriseVO.entNm }</p>
				<div class="v-div-line ml-9 mr-9"></div>
				<p class="p-14">
					${fn:split(fn:split(recruitVO.recruitLocation,' ')[0], ',')[1]}
				</p>
			</div>
			
			<div class="h-div-line mt-40 mb-40"></div>
			
		<div class="summary">
			<p class="recruit-info-tit" style="margin-top:30px">요약</p>
			<div class="summ-box">
				<div class="summ-row">
					<i class="fa-regular fa-calendar"></i>
					<p class="summ-tit">
						마감일 
					</p>
					<p class="summ-cont">
						<c:choose>
							<c:when test="${recruitVO.remainingDate == null}">
								<span class="txt-sig p-15 bold">상시채용</span>
							</c:when>
							<c:when test="${recruitVO.remainingDate > 0 }">
								<span class="mr-15">
									<fmt:formatDate value="${recruitVO.recruitEddt }" pattern="yyyy.MM.dd"/>
								</span>
								<span class="txt-orange p-15 bold">D-${recruitVO.remainingDate }</span>							
							</c:when>
							<c:otherwise>							
								<span class="txt-darkgray p-15 bold">마감</span>							
							</c:otherwise>
						</c:choose>
					</p>
				</div>
			
				<div class="summ-row">
					<i class="fa-solid fa-suitcase"></i>
					<p class="summ-tit">
						직무 
					</p>
					<p class="summ-cont">
						${job.comDetCodeInfoVO[0].comDetCdNm }
					</p>
				</div>
				
				<div class="summ-row">
					<i class="fa-solid fa-signal"></i>
					<p class="summ-tit">
						경력 
					</p>
					<p class="summ-cont">
						${recruitVO.recruitCareer }
					</p>
				</div>
				
				<div class="summ-row">
					<i class="fa-regular fa-circle-check"></i>
					<p class="summ-tit">
						고용형태 
					</p>
					<p class="summ-cont">
						${workType.comDetCodeInfoVO[0].comDetCdNm }
					</p>
				</div>
				
				<div class="summ-row">
					<i class="fa-solid fa-circle-check"></i>
					<p class="summ-tit">
						직급/직책 
					</p>
					<p class="summ-cont">
						${level.comDetCodeInfoVO[0].comDetCdNm}
					</p>
				</div>
				
				<div class="summ-row">
					<i class="fa-solid fa-location-dot"></i>
					<p class="summ-tit">
						근무지역 
					</p>
					<p class="summ-cont">
						${fn:split(fn:split(recruitVO.recruitLocation,' ')[0], ',')[1]}
					</p>
				</div>
				
			</div>
		</div>
			
			<p class="recruit-info-tit">기업 소개</p>
			<div>
				${recruitVO.enterpriseVO.entIntrcn }
			</div>
			
			<p class="recruit-info-tit">주요 업무</p>
			<div>
				<c:forEach var="work" items="${fn:split(recruitVO.recruitWork,'|')}">
				    <p class="bar-indent">${work}</p>
				</c:forEach>
			</div>
			
			<p class="recruit-info-tit">근무지</p>
			<div>
				${fn:split(recruitVO.recruitLocation,',')[1]}
			</div>
			
			<p class="recruit-info-tit">자격 요건</p>
			<div>
				<c:forEach var="work" items="${fn:split(recruitVO.recruitQlf,'|')}">
				    <p class="bar-indent">${work}</p>
				</c:forEach>
			</div>
			
			<p class="recruit-info-tit">우대사항</p>
			<div>
				<c:forEach var="work" items="${fn:split(recruitVO.recruitPrefer,'|')}">
				    <p class="bar-indent">${work}</p>
				</c:forEach>
			</div>
			
			<p class="recruit-info-tit">복지 및 혜택</p>
			<div>
				<c:forEach var="benefitsVO" items="${benefitsVOList }">
					<p class="bar-indent">${benefitsVO.comDetCodeInfoVO.comDetCdNm }</p>
				</c:forEach>
				
			</div>
			
			
			<p class="recruit-info-tit">회사위치</p>
			<div>
				${recruitVO.enterpriseVO.entAddr }
			</div>
			
			<c:forEach var="atchFileDetail" items="${atchFileList[0].atchFileDetailVOList }">
				<div class="${atchFileDetail.afdSeq}">
					<input type="hidden" name="atchFileId" value="${atchFileDetail.afId}">  
					<input type="hidden" name="atchFileName" value="${atchFileDetail.afdOriginNm}">  
					<input type="hidden" name="atchFileSeq" value="${atchFileDetail.afdSeq}">  
				</div>
			</c:forEach>
			
				<p class="recruit-info-tit">첨부파일</p>
				<div class="atch-box">
			</div>
			
			
		</div>
	</div>
</div>

	</div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.min.js"></script>
<script type="text/javascript">

	let modal = document.querySelector("#modal-compare");
	let application = document.querySelector("#application");
	let submit = document.querySelector("#modalSubmit");
	
	
	let atchFiles = document.querySelectorAll("input[name=atchFileName]");
	console.log(atchFiles);
	
	var imgs = ['gif', 'jpg', 'jpeg', 'png', 'bmp' ,'ico', 'apng'];

	let imgBox = document.querySelector(".img-box");
	
	let atchBox = document.querySelector(".atch-box");

	if(atchFiles.length == 0){
		atchBox.innerHTML = "<p class='p-13'>첨부파일이 없습니다.</p>";
		imgBox.remove();
	}  

	for(let i = 0; i < atchFiles.length; i++){
		let fileName = atchFiles[i].value;
		let fileLen = fileName.length;
		let lastDot = fileName.lastIndexOf(".");
		let fileExt = fileName.substring(lastDot + 1 , fileLen).toLowerCase();
		
		console.log("atchFiles[i]",atchFiles[i]);

		let afId = atchFiles[i].previousElementSibling.value;
		
		let afdSeq = atchFiles[i].nextElementSibling.value;

		
		
       if(imgs.includes(fileExt)){
			let img = '<img src="http://localhost/file/download.do?afId='+afId+'&afdSeq='+afdSeq+'">';
			console.log(img);
	       	imgBox.insertAdjacentHTML("beforeend", img);
       }else{
    	   let file = "";
    	   if(fileExt == 'xlsx' || fileExt == 'xls'){
	    	   file = '<a class="excel" href="http://localhost/file/download.do?afId='+afId+'&afdSeq='+afdSeq+'" >'+ fileName +'</a>';    		   
    	   }else if(fileExt == 'pdf'){
	    	   file = '<a class="pdf" href="http://localhost/file/download.do?afId='+afId+'&afdSeq='+afdSeq+'" >'+ fileName +'</a>';    		       		   
    	   }else if(fileExt == 'txt'){
	    	   file = '<a class="text" href="http://localhost/file/download.do?afId='+afId+'&afdSeq='+afdSeq+'" >'+ fileName +'</a>';    		       		       		   
    	   }else{
	    	   file = '<a class="text" href="http://localhost/file/download.do?afId='+afId+'&afdSeq='+afdSeq+'" >'+ fileName +'</a>';    		       		       		       		   
    	   }
    	   atchBox.insertAdjacentHTML("beforeend", file);
       }
       
	}
    if(imgBox.innerHTML.trim() == '' || atchBox.innerHTML.trim() == null){
 	   imgBox.remove();
    }

    if(atchBox.innerHTML.trim() == '' || atchBox.innerHTML.trim() == null){
 	   atchBox.innerHTML = "<p class='p-13'>첨부파일이 없습니다.</p>";
    }       
	
	
</script>