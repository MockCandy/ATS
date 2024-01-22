<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/css/resume.css">
<link rel="stylesheet" href="/resources/css/consult.css">
<style>
/* 공통 스타일 */
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
</style>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.css">
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.min.js"></script>
<div class="mypage-body-con">
	<div class="sub-title-area">
		<div class="body-sub-title">리뷰 목록</div>
		<hr class="title-hr" />
	</div>

	<div class="body-sub-con">

		<p class="mypageSubTit">
			고객님들이 남겨주신 소중한 리뷰 내역입니다. <span class="p-13">(총 <span
				class="bold">${total }</span>건)
			</span>
		</p>
		
		<form class="mb-12 flex flex-end" id="sortForm" action="/consultantMyPage/consultReview">
			<input type="hidden" id="sort" name="sort">
			<input type="hidden" id="keyword" value="${param.keyword }">
			<input type="hidden" id="currnetPage" value="${param.currentPage }">
			<span id="recentSort" class="
				<c:if test="${param.sort == 'recentSort' || param.sort == null }">
					active
				</c:if>
				mr-5
			">최신순</span>
			<span id="olderSort" class="
				<c:if test="${param.sort == 'olderSort' }">
					active
				</c:if>
			">오래된순</span>
			
			<div class="ml-auto">
				<input class="input01 input-ssm" type="text" placeholder="상담자 ID를 입력해 주세요">
				<button type="submit" class="btn btn-ssm btn-search"></button>
			</div>
		</form>

		<table class="table1">
			<colgroup>
				<col width="12%">
				<col width="*">
				<col width="12%">
				<col width="15%">
				<col width="12%">
			</colgroup>
			<thead>
				<tr>
					<th>리뷰 번호</th>
					<th>리뷰 내용</th>
					<th>리뷰 점수</th>
					<th>작성 일시</th>
					<th>신고 여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="consultantReviewVO"
					items="${consultantReviewVOList }">
					<tr class="pointer row">
						<input type="hidden" name="reviewNo"
							value="${consultantReviewVO.reviewNo }">
						<input type="hidden" name="reviewCntnt"
							value="${consultantReviewVO.reviewCntnt }">
						<input type="hidden" name="reviewRate"
							value="${consultantReviewVO.reviewRate }">
						<input type="hidden" name="reviewRegDt"
							value="${consultantReviewVO.reviewRegDt }">
						<input type="hidden" name="repSubId"
							value="${consultantReviewVO.reviewMemId }">
						<td>${consultantReviewVO.reviewNo }</td>
						<td class="talign-left">${consultantReviewVO.reviewCntnt }</td>
						<td>
							<c:forEach begin="1" end="${consultantReviewVO.reviewRate }">
								<i class="fa-solid fa-star" style="color:#ffc107"></i>
							</c:forEach>
							
						</td>
						<td class="time">${consultantReviewVO.reviewRegDt }</td>
						<td>
							<c:choose>
								<c:when test = "${fn:contains(reportVOList, consultantReviewVO.reviewNo)}">
									<span class="txt-red bold">신고</span>
								</c:when>
								<c:otherwise>
									<span class="txt-sig bold">미신고</span>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<div class="pagez mt-30">
			${data.getPagingArea4()}
		</div>

	</div>
</div>


<div id="modal-cnsltntReview">
	<section>
		<button data-izimodal-close="" class="icon-close"></button>

		<p class="bold p-18 mb-9">리뷰 번호</p>
		<p class="review-no">12312</p>

		<p class="bold p-18 mt-20 mb-9">리뷰 점수</p>
		<div class="review-rate">
			<span class="star star-sm mr-9"> ★★★★★ <span
				class="star-color" style="width: 50%;">★★★★★</span>
			</span> ( <span class="review-rate-value"><fmt:formatNumber value="4"
					pattern="0.0" /></span>점)
		</div>

		<p class="bold p-18 mt-20 mb-9">리뷰 작성 일자</p>
		<p class="review-reg-dt time2">12312</p>

		<p class="bold p-18 mt-20 mb-9">리뷰 내용</p>
		<p class="review-cont">12312</p>

		<div class="btnArea">
			<button data-izimodal-close="" class="btn btn-sm mr-9">확인</button>
			<button class="btn bg-red txt-white btn-sm" id="btn-report">신고</button>
		</div>

	</section>
</div>

<!-- Modal structure -->
<div id="modal-report">
	<!-- data-iziModal-fullscreen="true"  data-iziModal-title="Welcome"  data-iziModal-subtitle="Subtitle"  data-iziModal-icon="icon-home" -->
	<section>
		<button data-izimodal-close="" class="icon-close"></button>
		<p class="bold p-13">신고 사유를 선택해 주세요</p>
		<fieldset class="mt-20">
			<div class="flex align-center mb-7">
				<label class="flex align-center"> <input type="radio"
					name="repType" value="RCC01001" checked /> <span class="ml-7">스팸
						및 홍보글</span>
				</label>
			</div>
			<div class="flex align-center mb-7">
				<label class="flex align-center"> <input type="radio"
					name="repType" value="RCC01002" /> <span class="ml-7">음란성이
						포함된 글</span>
				</label>
			</div>
			<div class="flex align-center mb-7">
				<label class="flex align-center"> <input type="radio"
					name="repType" value="RCC01003" /> <span class="ml-7">욕설 및
						혐오발언이 포함된 글</span>
				</label>
			</div>
			<div class="flex align-center mb-7">
				<label class="flex align-center"> <input type="radio"
					name="repType" value="RCC01004" /> <span class="ml-7">분란을
						조장하는 글</span>
				</label>
			</div>
			<div class="flex align-center mb-7">
				<label class="flex align-center"> <input type="radio"
					name="repType" value="RCC01005" /> <span class="ml-7">사실과
						무관한 거짓 글</span>
				</label>
			</div>
		</fieldset>
		<textarea id="repReason"
			class="input01 w-100 ph-cont resize-none inp-transparent"
			style="height: 150px;" placeholder="신고 내용을 입력해 주세요"></textarea>
		<div class="mt-20 talign-center">
			<button class="btn btn-sm" data-izimodal-close=""
				data-izimodal-transitionout="comingOut">취소</button>
			<button class="btn btn-sm bg-red color-white submit"
				data-izimodal-transitionout="bounceOutDown">신고</button>
			<input type="hidden" id="repSubId" value="">
			<input type="hidden" id="repBoardId" value="">
		</div>
	</section>
</div>
<!-- Modal structure -->
<div id="modal-alert">
	<!-- data-iziModal-fullscreen="true"  data-iziModal-title="Welcome"  data-iziModal-subtitle="Subtitle"  data-iziModal-icon="icon-home" -->
	<section>
		<p class="alert bold"></p>
	</section>
</div>
<script>
	let time = document.querySelectorAll(".time");

	console.log(time);

	for (let i = 0; i < time.length; i++) {
		console.log(time[i].innerText);
		let year = time[i].innerText.split(" ")[5];
		console.log(year);
		let month = time[i].innerText.split(" ")[1];
		if (month == "Jan") {
			month = '1';
		} else if (month == "Feb") {
			month = '2';
		} else if (month == "Mar") {
			month = '3';
		} else if (month == "Apr") {
			month = '4';
		} else if (month == "May") {
			month = '5';
		} else if (month == "Jun") {
			month = '6';
		} else if (month == "Jul") {
			month = '7';
		} else if (month == "Aug") {
			month = '8';
		} else if (month == "Sep") {
			month = '9';
		} else if (month == "Oct") {
			month = '10';
		} else if (month == "Nov") {
			month = '11';
		} else if (month == "Dec") {
			month = '12';
		}
		let day = time[i].innerText.split(" ")[2];
		console.log(day);

		time[i].innerText = year + "-" + month + "-" + day
	}

	let form = document.querySelector("#sortForm");
	let recentSort = document.querySelector("#recentSort");
	let olderSort = document.querySelector("#olderSort");

	recentSort.addEventListener("click", function(e){
		e.target.parentElement[0].value = "recentSort";
		console.log(e.target.parentElement[0])
		form.submit();
	})
	olderSort.addEventListener("click", function(e){
		e.target.parentElement[0].value = "olderSort";
		console.log(e.target.parentElement[0])
		form.submit();
	})

	$("#modal-cnsltntReview").iziModal({
		title : '',
		subtitle : '',
		headerColor : '#88A0B9',
		background : null,
		theme : '', // light
		icon : null,
		iconText : null,
		iconColor : '',
		rtl : false,
		width : 600,
		top : null,
		bottom : null,
		borderBottom : true,
		padding : 0,
		radius : 3,
		zindex : 999,
		iframe : false,
		iframeHeight : 400,
		iframeURL : null,
		focusInput : true,
		group : '',
		loop : false,
		arrowKeys : true,
		navigateCaption : true,
		navigateArrows : true, // Boolean, 'closeToModal', 'closeScreenEdge'
		history : false,
		restoreDefaultContent : false,
		autoOpen : 0, // Boolean, Number
		bodyOverflow : true,
		fullscreen : false,
		openFullscreen : false,
		closeOnEscape : true,
		closeButton : true,
		appendTo : 'body', // or false
		appendToOverlay : 'body', // or false
		overlay : true,
		overlayClose : true,
		overlayColor : 'rgba(0, 0, 0, 0.4)',
		timeout : false,
		timeoutProgressbar : false,
		pauseOnHover : false,
		timeoutProgressbarColor : 'rgba(255,255,255,0.5)',
		transitionIn : 'comingIn',
		transitionOut : 'comingOut',
		transitionInOverlay : 'fadeIn',
		transitionOutOverlay : 'fadeOut',
		onFullscreen : function() {
		},
		onResize : function() {
		},
		onOpening : function() {
		},
		onOpened : function() {
		},
		onClosing : function() {
		},
		onClosed : function() {
		},
		afterRender : function() {
		}
	});

	$("#modal-report").iziModal({
		title : '',
		subtitle : '',
		headerColor : '#88A0B9',
		background : null,
		theme : '', // light
		icon : null,
		iconText : null,
		iconColor : '',
		rtl : false,
		width : 500,
		top : null,
		bottom : null,
		borderBottom : true,
		padding : 0,
		radius : 3,
		zindex : 999,
		iframe : false,
		iframeHeight : 400,
		iframeURL : null,
		focusInput : true,
		group : '',
		loop : false,
		arrowKeys : true,
		navigateCaption : true,
		navigateArrows : true, // Boolean, 'closeToModal', 'closeScreenEdge'
		history : false,
		restoreDefaultContent : false,
		autoOpen : 0, // Boolean, Number
		bodyOverflow : true,
		fullscreen : false,
		openFullscreen : false,
		closeOnEscape : true,
		closeButton : true,
		appendTo : 'body', // or false
		appendToOverlay : 'body', // or false
		overlay : true,
		overlayClose : true,
		overlayColor : 'rgba(0, 0, 0, 0.4)',
		timeout : false,
		timeoutProgressbar : false,
		pauseOnHover : false,
		timeoutProgressbarColor : 'rgba(255,255,255,0.5)',
		transitionIn : 'comingIn',
		transitionOut : 'comingOut',
		transitionInOverlay : 'fadeIn',
		transitionOutOverlay : 'fadeOut',
		onFullscreen : function() {
		},
		onResize : function() {
		},
		onOpening : function() {
		},
		onOpened : function() {
		},
		onClosing : function() {
		},
		onClosed : function() {
		},
		afterRender : function() {
		}
	});

	let star = document.querySelector(".star-color");
	star.style.width = star.parentElement.nextElementSibling.innerHTML * 20
			+ "%";


	// 신고대상자 아이디
	let repSubId = document.querySelector("#repSubId");
	// 신고 게시글 번호
	let repBoardId = document.querySelector("#repBoardId");
	// 신고접수자 아이디
	let reporterId = "${getCurrentLoginVO.memId}";
	// 신고사유
	let repReason = document.querySelector("#repReason");
	
	let btnReport = document.querySelector("#btn-report");
	
	let rows = document.querySelectorAll(".row");
	console.log(rows);
	for (let i = 0; i < rows.length; i++) {

		rows[i]
				.addEventListener(
						"click",
						function(e) {

							console
									.dir(e.target.parentElement.children.reviewCntnt.value);
							console
									.dir(e.target.parentElement.children.reviewNo.value);
							console
									.dir(e.target.parentElement.children.reviewRate.value);
							console
									.dir(e.target.parentElement.children.reviewRegDt.value);

							let reviewNo = document.querySelector(".review-no");
							let reviewRate = document
									.querySelector(".review-rate-value");
							let reviewRegDt = document
									.querySelector(".review-reg-dt");
							let reviewCont = document.querySelector(".review-cont");

							reviewNo.innerText = e.target.parentElement.children.reviewNo.value;
							reviewRate.innerText = e.target.parentElement.children.reviewRate.value;
							reviewRegDt.innerText = e.target.parentElement.children.reviewRegDt.value;
							reviewCont.innerText = e.target.parentElement.children.reviewCntnt.value;

							repSubId.value = e.target.parentElement.children.repSubId.value;
							repBoardId.value = e.target.parentElement.children.reviewNo.value;
							
							let star = document.querySelector(".star-color");
							star.style.width = star.parentElement.nextElementSibling.innerHTML
									* 20 + "%";

							let time = document.querySelectorAll(".time2");
							for (let i = 0; i < time.length; i++) {
								console.log(time[i].innerText);
								let year = time[i].innerText.split(" ")[5];
								console.log(year);
								let month = time[i].innerText.split(" ")[1];
								if (month == "Jan") {
									month = '1';
								} else if (month == "Feb") {
									month = '2';
								} else if (month == "Mar") {
									month = '3';
								} else if (month == "Apr") {
									month = '4';
								} else if (month == "May") {
									month = '5';
								} else if (month == "Jun") {
									month = '6';
								} else if (month == "Jul") {
									month = '7';
								} else if (month == "Aug") {
									month = '8';
								} else if (month == "Sep") {
									month = '9';
								} else if (month == "Oct") {
									month = '10';
								} else if (month == "Nov") {
									month = '11';
								} else if (month == "Dec") {
									month = '12';
								}
								let day = time[i].innerText.split(" ")[2];
								console.log(day);

								time[i].innerText = year + "-" + month + "-"
										+ day
							}

							$('#modal-cnsltntReview').iziModal('open');
						})

	}


	btnReport.addEventListener("click", function(e) {

		
		
		$('#modal-cnsltntReview').iziModal('close');
		$('#modal-report').iziModal('open');

	})


	console.log(document.querySelectorAll("input[name=repType]"));
	$(document).on("click",".submit",function(e) {
		
		
		event.preventDefault();

		// 		repReason.value = ;
		// 신고유형 코드
		let repTypeCd = document
				.querySelector("input[name=repType]:checked").value;
		console.log(repSubId.value);
		console.log(repBoardId.value);
		console.log(repReason.value);
		console.log(reporterId);
		console.log(repTypeCd);

		data = {
			"repSubId" : repSubId.value,
			"repReason" : repReason.value,
			"repBoardId" : repBoardId.value,
			"reporterId" : reporterId,
			"repTypeCd" : repTypeCd
		}
		console.log(data);
		$.ajax({
			url : "/report/ajaxReport",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(
						"${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(res) {
				console.log(res);

				if (res == 1) {
					alert("신고가 정상적으로 접수되었습니다.");
					document
							.querySelectorAll("input[name=repType]")[0].checked = true;
					document
							.querySelector("#repReason").value = '';
					window.location.reload();
				} else {
					alert("신고 접수에 실패하였습니다.");
					document
							.querySelectorAll("input[name=repType]")[0].checked = true;
					document
							.querySelector("#repReason").value = '';
				};

				$('#modal-report').iziModal('close');

			}
		})
	})
	
	
</script>