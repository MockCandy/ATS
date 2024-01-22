<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css"
	href="/resources/css/recruitList.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.css">
<div class="cen">
	<div class="recruit-detail-area">
	
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
						모집 직급 
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
			
			<p class="recruit-info-tit">기업 소개</p>
			<pre class="pre">
				${recruitVO.enterpriseVO.entIntrcn }
			</pre>
			
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
			
			<div class="img-box">
			</div>
			
			<p class="recruit-info-tit">첨부파일</p>
			<div class="atch-box">
			</div>
			
		</div>
	
		<div class="recruit-right">
		
		
			<div class="my-info mt-30">
				<div class="my-info-top">
					<div class="my-profile-img">
						<img alt="" src="/resources/images/empty-profile.png">
					</div>
					<div class="my-profile">
						<sec:authorize access="isAnonymous()">
							<p class="p-25">로그인을 해주세요.</p>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<p class="my-info-name">${getCurrentLoginVO.memNm }</p>
							<p class="wish-job">
								<c:choose>
									<c:when test="${getCurrentLoginVO.memWishJob != null }">
										${getCurrentLoginVO.memWishJob }
									</c:when>
									<c:otherwise>
										희망 직군이 없습니다
									</c:otherwise>
								</c:choose>
							</p>
						</sec:authorize>
					</div>
				</div>
		
				<button
					class="interest-recruit p-14 mt-25 w-100 btn bg-white bold border-sig
 						<c:if test='${fn:contains(interestRecruitVOList, recruitVO.recruitNo)}'>
 							active
 						</c:if>
					">
					공고 저장
				</button>
				
				<!-- @@@@@@@@@ 지원하기 기능 아직 미구현 @@@@@@@@@@@@@@@@@@@ -->
				<sec:authorize access="hasRole('ROLE_MEMBER')">
				<button id="application"
					class="p-14 mb-25 mt-15 w-100 btn bg-sig color-white bold">
					지원하기
				</button>
				</sec:authorize>
		
			</div>
		
		</div>    
	</div>
</div>



<!-- Modal structure -->
<div id="modal-application">
	<section>
		<button data-izimodal-close="" class="icon-close">
		</button>
		
		<p class="p-20 mb-25 bold">입사 지원</p>
		
		<div>
			<form action="/application/insert" method="post" class="grid-area">
				<div class="">
					<p class="p-15 mb-12">이력서 선택</p>
					<div class="cont-area">
						<c:forEach var="resumeVO" items="${resumeVOList }">
							<div class="resume-item">
			                    <label class="flex align-center">
			                        <input type="radio" name="resumeNo" value="${resumeVO.resumeNo }" />
			                        <span class="ml-7">${resumeVO.resumeTitle }</span>
			                    </label>
							</div>
						</c:forEach>
					</div>
						
				</div>
				<div class="">
					<p class="p-15 mb-12">자기소개서 선택</p>
					<div class="cont-area">
						<c:forEach var="portfolioVO" items="${portfolioVOList }">
							<div class="resume-item">
			                    <label class="flex align-center">
			                        <input type="radio" name="ptflNo" value="${portfolioVO.ptflNo }" />
			                        <span class="ml-7">${portfolioVO.ptflTitle }</span>
			                    </label>
							</div>
						</c:forEach>
					</div>
				</div>
			</form>
		</div>
		
		<input type="hidden" id="recruitNo" value="${recruitVO.recruitNo }" />
		
		<div class="mt-auto talign-center">
			<button class="btn btn-sm bg-sig color-white" id="modalSubmit"
				data-izimodal-close="" data-izimodal-transitionout="bounceOutDown">제출</button>
			<button class="btn btn-sm modalCancel" data-izimodal-close=""
				data-izimodal-transitionout="comingOut">취소</button>
		</div>
		
	</section>
</div>

<!-- Modal structure -->
<div id="modal-alert"> <!-- data-iziModal-fullscreen="true"  data-iziModal-title="Welcome"  data-iziModal-subtitle="Subtitle"  data-iziModal-icon="icon-home" -->
    <section>
		<p class="alert bold"></p>
       </section>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.min.js"></script>
<script type="text/javascript">
	let pre = document.querySelector(".pre");
	
	console.log(pre);
	
	pre.innerText = pre.innerText.replace(/^\s*/, "");


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
	////////////////////// 관심공고 기능
	$(document).on("click",".interest-recruit",function(e) {

		if(${getCurrentLoginVO == null}){
			alert("로그인 한 회원만 관심공고를 등록할 수 있습니다.");
			return;
		};
		
		console.dir(e.target);
		let recruitNo = "${recruitVO.recruitNo}";
		console.log("recruitNo : " + recruitNo);
		e.target.classList.toggle("active");

		data = {
			"recruitNo" : recruitNo,
			"memId" : "${getCurrentLoginVO.memId}"
		}
		console.log(data);

		$.ajax({
			url : "/recruit/ajaxInterestRecruit",
			data : JSON.stringify(data),
			type : "post",
    		contentType : "application/json;charset=utf-8",
    		dataType:"json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(res) {
				console.log("res", res);
				
			}

		})
	})
	
	
	$("#modal-application").iziModal({
	    title: '',
	    subtitle: '',
	    headerColor: '#88A0B9',
	    background: null,
	    theme: '',  // light
	    icon: null,
	    iconText: null,
	    iconColor: '',
	    rtl: false,
	    width: 550,
	    top: null,
	    bottom: null,
	    borderBottom: true,
	    padding: 0,
	    radius: 3,
	    zindex: 999,
	    iframe: false,
	    iframeHeight: 400,
	    iframeURL: null,
	    focusInput: true,
	    group: '',
	    loop: false,
	    arrowKeys: true,
	    navigateCaption: true,
	    navigateArrows: true, // Boolean, 'closeToModal', 'closeScreenEdge'
	    history: false,
	    restoreDefaultContent: false,
	    autoOpen: 0, // Boolean, Number
	    bodyOverflow: false,
	    fullscreen: false,
	    openFullscreen: false,
	    closeOnEscape: true,
	    closeButton: true,
	    appendTo: 'body', // or false
	    appendToOverlay: 'body', // or false
	    overlay: true,
	    overlayClose: false,
	    overlayColor: 'rgba(0, 0, 0, 0.4)',
	    timeout: false,
	    timeoutProgressbar: false,
	    pauseOnHover: false,
	    timeoutProgressbarColor: 'rgba(255,255,255,0.5)',
	    transitionIn: 'comingIn',
	    transitionOut: 'comingOut',
	    transitionInOverlay: 'fadeIn',
	    transitionOutOverlay: 'fadeOut',
	    onFullscreen: function(){},
	    onResize: function(){},
	    onOpening: function(){},
	    onOpened: function(){},
	    onClosing: function(){},
	    onClosed: function(){},
	    afterRender: function(){}
	});

	$("#modal-alert").iziModal({
	    title: '',
	    subtitle: '',
	    headerColor: '#88A0B9',
	    background: null,
	    theme: '',  // light
	    icon: null,
	    iconText: null,
	    iconColor: '',
	    rtl: false,
	    width: 400,
	    height:400,
	    top: null,
	    bottom: null,
	    borderBottom: true,
	    padding: 0,
	    radius: 3,
	    zindex: 999,
	    iframe: false,
	    iframeHeight: 400,
	    iframeURL: null,
	    focusInput: true,
	    group: '',
	    loop: false,
	    arrowKeys: true,
	    navigateCaption: true,
	    navigateArrows: true, // Boolean, 'closeToModal', 'closeScreenEdge'
	    history: false,
	    restoreDefaultContent: false,
	    autoOpen: 0, // Boolean, Number
	    bodyOverflow: false,
	    fullscreen: false,
	    openFullscreen: false,
	    closeOnEscape: true,
	    closeButton: true,
	    appendTo: 'body', // or false
	    appendToOverlay: 'body', // or false
	    overlay: true,
	    overlayClose: true,
	    overlayColor: 'rgba(0, 0, 0, 0.4)',
	    timeout: false,
	    timeoutProgressbar: false,
	    pauseOnHover: false,
	    timeoutProgressbarColor: 'rgba(255,255,255,0.5)',
	    transitionIn: 'comingIn',
	    transitionOut: 'comingOut',
	    transitionInOverlay: 'fadeIn',
	    transitionOutOverlay: 'fadeOut',
	    onFullscreen: function(){},
	    onResize: function(){},
	    onOpening: function(){},
	    onOpened: function(){},
	    onClosing: function(){},
	    onClosed: function(){},
	    afterRender: function(){}
	});
	let applicated = ${applicated};
	application.addEventListener("click", function(e){
		
		
		console.log("${getCurrentLoginVO.memId}");
		
		if("${getCurrentLoginVO.memId}" == null || "${getCurrentLoginVO.memId}" ==''){
			alert("로그인 후 입사지원을 진행해 주세요");
			return;
		}
		
		if(applicated != 0){
			alert("이미 지원한 채용 공고입니다");
			return;
		}
		$("#modal-application").iziModal('open');	
		
	})
	
	$("#modalSubmit").on("click", function(){
		
		
		let recruitNo = "${recruitVO.recruitNo}";
		let resumeNo = document.querySelector("input[name=resumeNo]").value;
		let ptflNo = document.querySelector("input[name=ptflNo]").value;
		console.log(recruitNo);
		
		let data = {
			"recruitNo" : recruitNo,
			"resumeNo" : resumeNo,
			"ptflNo" : ptflNo,
			"memId" : "${getCurrentLoginVO.memId}"
		}
		console.log(data);
		$.ajax({
			url : "/application/insert",
			data : JSON.stringify(data),
			type : "post",
    		contentType : "application/json;charset=utf-8",
    		dataType:"json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(res) {
				console.log("res", res);
				console.log("appNo", res.appNo);
				if(res.appNo != null){
					applicated = 1;	
					$(".alert").text("입사 지원 되었습니다.");
					$("#modal-alert").iziModal('open');						
				}else {
					$(".alert").text("입사 지원에 실패하였습니다. 다시 시도해 주세요.");
					$("#modal-alert").iziModal('open');	
				}
			}

		})
	})
	
</script>