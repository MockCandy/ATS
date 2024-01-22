<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.css">
<link rel="stylesheet" type="text/css" href="/resources/css/enterprise.css">

<style>

.rev-btn-area {
    justify-content: flex-end;
}

.review-cont {
    display: grid;
    grid-template-columns: 40% auto;
}

.go-list {
	display: flex; 
	justify-content: flex-end;
}

.mypage-body-con{
	width:800px;
	margin:auto;
}

.body-sub-con {
	padding:35px;
}

#modal-custom {
	width:550px!important;
	height: 520px!important;
}


body {
	background-color:#fff;
}

.review-item {
	margin-bottom:20px;
	padding:0;
}
</style>

<div class="mypage-body-con">
		<div class="body-sub-con">
			<div class="body-sub-title mb-50"><span class="p-30">${memVO.memNcnm}</span> 상담사님의 리뷰</div>
			
			<!-- 신고 대상자 아이디 -->
			<input type="hidden" value="" id="repSubId">
			<!-- 신고 게시판아이디 -->
			<input type="hidden" value="" id="repBoardId">

	<p class="p-14 txt-gray mb-20">총 <span class="bold">${total }</span>건</p>

	<div class="review-list">
		<c:if test="${total == 0}">
			<p class="empty-tit">리뷰가 없습니다.</p>
		</c:if>
	
		<c:forEach var="consultReviewVO" items="${data.content }">
			<div class="review-item">
				<div class="review-top">
					<p class="bold p-15">${consultReviewVO.reviewMemId }</p>
				</div>

				<div class="mt-3 mb-12 flex align-center">
					<input type="hidden" class="rev-avg-rate" value="${consultReviewVO.reviewRate}">
					<span class="star star-ssm review-star"> ★★★★★ 
						<span class="rev-avg-star-filled" style="width: 20%;">★★★★★</span> 
					</span> 
					<div class="v-div-line"></div>
					<div class="p-13 txt-gray">
						<fmt:formatDate value="${consultReviewVO.reviewRegDt }" pattern="yyyy.MM.dd"/>
					</div>
				</div>
				
				<div>
					${consultReviewVO.reviewCntnt }
				</div>
					
				
				<div class="rev-btn-area">
					<div class="btn-custom">
						<button type="button" class="btn btn-sm btn-report ml-7">신고하기</button>
					</div>
					
					<!-- 리뷰번호 = 신고접수번호 -->
					<input type="hidden" name="entRevNo" class="entRevNo" value="${entReviewVO.entRevNo}">
					<!-- 신고접수 대상자ID = 게시글 작성자-->
					<input type="hidden" name="repSubId" class="repSubId" value="${entReviewVO.memId}">
				</div>
			</div>
		</c:forEach>	
	
		
	</div>
	
	<div class="pagez">${data.getPagingArea8() }</div>
		
		
		
	<!-- Modal structure -->
		<div id="modal-custom"> <!-- data-iziModal-fullscreen="true"  data-iziModal-title="Welcome"  data-iziModal-subtitle="Subtitle"  data-iziModal-icon="icon-home" -->
		    <section>
		    	<button data-izimodal-close="" class="icon-close"></button>
				<p class="bold p-13">신고 사유를 선택해 주세요</p>
                <fieldset class="mt-20">
                	<div class="flex align-center mb-7">
	                    <label class="flex align-center">
	                        <input type="radio" name="repType" value="RCC01001" checked />
	                        <span class="ml-7">스팸 및 홍보글</span>
	                    </label>
                	</div>
                	
                	<div class="flex align-center mb-7">
	                    <label class="flex align-center">
	                        <input type="radio" name="repType" value="RCC01002" />
	                        <span class="ml-7">음란성이 포함된 글</span>
	                    </label>
                	</div>
                	
                	<div class="flex align-center mb-7">
	                    <label class="flex align-center">
	                        <input type="radio" name="repType" value="RCC01003" />
	                        <span class="ml-7">욕설 및 혐오발언이 포함된 글</span>
	                    </label>
                	</div>
                	
                	<div class="flex align-center mb-7">
	                    <label class="flex align-center">
	                        <input type="radio" name="repType" value="RCC01004" />
	                        <span class="ml-7">분란을 조장하는 글</span>
	                    </label>
                	</div>
                	
                	<div class="flex align-center mb-7">
	                    <label class="flex align-center">
	                        <input type="radio" name="repType" value="RCC01005" />
	                        <span class="ml-7">사실과 무관한 거짓 글</span>
	                    </label>
                	</div>
                </fieldset>
                
                <div class="mt-20 talign-center">
                <textarea id="repReason" name="repReason" class="input01 w-100 ph-cont resize-none inp-transparent" style="height: 150px;" placeholder="신고 내용을 입력해 주세요"></textarea>
                    <button class="btn btn-sm" data-izimodal-close="" data-izimodal-transitionout="comingOut">취소</button>
                    <button type="button" id="btnSubmit" class="btn btn-sm bg-red color-white submit" data-izimodal-close="" data-izimodal-transitionout="bounceOutDown">신고</button>
                </div>
             </section>
		</div>
		
	<!-- Modal structure -->
	
	</div>
</div>

<!-- <div id="modal-alert"> data-iziModal-fullscreen="true"  data-iziModal-title="Welcome"  data-iziModal-subtitle="Subtitle"  data-iziModal-icon="icon-home" -->
<%--     <section> --%>
<!-- 		<p class="alert bold"></p> -->
<%--        </section> --%>
<!-- </div> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.min.js"></script>
<script type="text/javascript">
$(function(){
	

// 신고 모달 설정 & 초기화하는 부분
$("#modal-custom").iziModal({
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




// console.log("${getCurrentLoginVO.memId}");

// 신고대상자 아이디
let repSubId = document.querySelector("#repSubId");
// 신고 게시글 번호
let repBoardId = document.querySelector("#repBoardId");
// 신고접수자 아이디
let reporterId = "${getCurrentLoginVO.memId}";
// 신고사유
var repReason = $("textarea[id='repReason']").val();

// 신고버튼 기능
$(".btn-report").on("click", function(e) {
	
	// 로그인 한 아이디 값이 없으면 신고 불가
	event.preventDefault();

	if(reporterId =='' || reporterId == null){
		alert("로그인 한 회원만 신고기능을 이용하실 수 있습니다.");
		return;
	}
	// 	console.log(e);
// 	console.log(e.target);
// 	console.log(e.target.nextElementSibling.value);

	// ** nextElementSibling => 다음 요소를 반환해주는 메소드
	
// @@@ 여기서 값 넣어주는지 확인해!!@!!@@!!@

repSubId.value = document.querySelector('.repSubId').value;
repBoardId.value = document.querySelector('.entRevNo').value;

console.log("repReason: ", repReason);
// repReason = document.getElementById('repReason');
	
		$('#modal-custom').iziModal('open');
});

console.log(document.querySelectorAll("input[name=repType]"));

$(document).on("click",".submit", function(e) {
	event.preventDefault();
	
	 //		repReason.value = ;
	// 신고유형 코드
	let repTypeCd = document.querySelector("input[name=repType]:checked").value;
	console.log(repSubId.value);
	console.log(repBoardId.value);
	console.log($("#repReason").val());
	console.log(reporterId);
	console.log(repTypeCd);
	
	let data = {
		"repSubId" : repSubId.value,
		"repReason" : $("#repReason").val(),
		"repBoardId" : repBoardId.value,
		"reporterId" : reporterId,
		"repTypeCd" : repTypeCd
	}
	
	/*
	{"repSubId": "c111","repBoardId": "REV00014","reporterId": "po123","repTypeCd": "RCC01001"}
	*/
	console.log("data : ", data);
	$.ajax({
		url : "/report/ajaxReport",
		contentType : "application/json; charset=UTF-8",
		data : JSON.stringify(data),
		dataType : "json",
		type : "post",
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(res) {
			console.log("res : ", res);

			if(res == 1){
				alert("신고가 정상적으로 접수되었습니다.");
				document.querySelectorAll("input[name=repType]")[0].checked = true;
				document.querySelector("#repReason").value = '';
			}else{
				alert("신고 접수에 실패하였습니다.");
				document.querySelectorAll("input[name=repType]")[0].checked = true;
				document.querySelector("#repReason").value = '';
			};
		}
	});//end ajax
	});
	
	

//통계 그리는 부분 @@@
let entNo = "${enterpriseVO.entNo}";
let memId = "${getCurrentLoginVO.memId}";
console.log(entNo);
console.log(memId);

function drawRate(){		

    let revRate = document.querySelectorAll(".rev-avg-rate");
    for(let i = 0; i < revRate.length; i++){
       let star = revRate[i].nextElementSibling.children[0];
       star.style.width = revRate[i].value * 20 +'%'; 
    }
}

drawRate();

});

</script>
