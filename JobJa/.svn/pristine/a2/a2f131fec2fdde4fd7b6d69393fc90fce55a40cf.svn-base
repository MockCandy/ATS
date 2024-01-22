<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="/resources/css/admin.css">
<link rel="stylesheet" href="/resources/css/resumeModal.css">
<link rel="stylesheet" href="/resources/css/resume.css">

<!-- Favicons -->
<link href="/resources/assets/img/favicon.png" rel="icon">
<link href="/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<!-- <link href="https://fonts.gstatic.com" rel="preconnect"> -->
<!-- <link -->
<!-- 	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" -->
<!-- 	rel="stylesheet"> -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<!-- Vendor CSS Files -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/resources/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="/resources/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="/resources/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/resources/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/resources/css/style.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>


<style>
thead {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
	font-weight: bold;
}

.sub-title-area {
	display: flex;
	align-items: center;
	width: fit-content;
	margin: 20px 50px -16px 50px;
}

.body-sub-title {
	font-size: 20px;
	display: flex;
	align-items: center;
	padding-inline-start: 32px;
	gap: 16px;
}

.card-title {
	font-size: 24px;
}

.mypage-aside-con {
	font-family: 'Noto Sans KR', sans-serif;
}

.aside-name {
	padding-top: 34px;
}

table .modaltable {
	border-collapse: collapse;
}

.thth, .tdtd {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

.thth {
	background-color: #f2f2f2;
}

.modal-content {
	padding: 20px;
}

.infomation {
	font-weight: bold; /* 진하게 */
	font-size: 20px; /* 크기 조절 */
}
/* 원 모양 프로필 사진 스타일 */
.rounded-circle {
	border-radius: 50% !important;
}

.border-2 {
	border-width: 2px !important;
}

.border-primary { -
	-bs-border-opacity: 1;
	border-color: rgba(var(- -bs-primary-rgb), var(- -bs-border-opacity))
		!important;
}

.modaltable {
	margin-top: 20px; /* .modaltable 위쪽 여백 추가 */
}

#closeModal {
	margin-top: 15px;
}

.modal-body {
	text-align: center;
}

.warning-icon {
	text-align: center;
	display: flex; /* Flexbox를 사용하여 수직, 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
	justify-content: center; /* 수평 가운데 정렬 */
	background-color: mistyrose;
	border-radius: 50%;
	width: 40px; /* 원의 지름으로 크기 조정 */
	height: 40px; /* 원의 지름으로 크기 조정 */
	margin-left: 45%;
}

.warning-icon i {
	color: red;
	font-size: 20px;
	margin-top: -3px; /* 아이콘 위치 조정 */
}

.card-tools {
	width: 100%;
	font-size: 20px;
}

.serchbox {
	display: flex;
	align-items: center;
}

.serch-input {
	margin-right: 10px; /* 원하는 간격으로 조절 */
}

.serch button {
	margin-left: auto; /* 나머지 공간을 모두 차지하여 오른쪽에 정렬 */
	height: 35px;
	border-radius: 15px; /* 버튼을 더 둥글게 만들기 */
}

.sub-title-area {
	display: flex;
	align-items: center;
	width: fit-content;
	margin: 20px 50px -16px 50px;
}

.body-sub-title {
	font-size: 20px;
	display: flex;
	align-items: center;
	padding-inline-start: 32px;
	gap: 16px;
}

.card-title {
	font-size: 24px;
}

.list-counting__applicants-btn {
	background-color: white;
}

tbody {
	margin: 20px;
	padding: 20px;
	margin-bottom: 20px;
	padding-bottom: 20px;
}

.u_u {
	height: 100px;
	border-bottom: 1px solid #d2d2d2;
}

.naesajin {
	max-width: 150px;
	max-height: 150px;
	display: block;
	margin: 0 auto; /* 수평 가운데 정렬을 위해 추가 */
}

.pagination {
	display: flex;
	list-style: none;
}

.pagez {
	display: flex;
	justify-content: center;
	margin: 32px 0px;
}

.pagez  li.is_active {
	font-weight: bold;
	border-bottom: 3px solid #2ecc71;
}

.pagez .pagination a {
	display: inline-block;
	color: #222;
}

.pagez .pagination ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
	display: flex;
	justify-content: center;
}

.pagez.pagination {
	padding: 30px 0;
}

.pagez .paginate_button {
	margin: 0 15px;
}

.pagez  .disabled {
	pointer-events: none;
	cursor: default;
}

.disabled>.page-link {
	background-color: transparent !important;
	border-color: transparent !important;
}

.page-link {
	border-color: transparent !important;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
	background-color: #fefefe;
	margin: 5% auto; /* 수정된 부분 */
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 1060px; /* 수정된 부분 */
	max-height: 80vh; /* 추가된 부분 */
}

.close {
	text-align: center;
	background: #FFF;
	margin-bottom: 10px;
	position: absolute;
	right: 144px;
	top: 50px;
	font-size: 23px;
	border-radius: 50%;
	width: 30px;
	height: 30px;
	border: 0;
	color: #a9a9a9;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-right: 263px;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.resume-modal {
	width: 1060px;
	margin: 64px auto;
}

.skills-box {
	display: inline-block;
	padding: 5px;
	margin: 5px;
	border: 1px solid #000;
	background-color: #f0f0f0;
}

.biz-tab__item--active {
	background-color: #50C785;
	font-weight: bold;
	color: white;
}

p {
	margin-bottom: 0;
}

.rsm_ttl {
	font-size: 22px;
	font-weight: bold;
}

.wordButton {
	margin-left: 0
}

.modal-dialog-scrollable {
	width: 800px;
	max-width: 800px;
}

.tdtd {
	display: flex;
	align-items: center;
}
</style>
<div class="mypage-body-con">

	<div class="body-sub-con">

		<h1 class="admin-h1">상담회원 승인요청</h1>
		<form:form modelAttribute="memberVO"
			action="/admin/adminCounselorProposal" method="post">
		</form:form>
		<div class="biz-tab">
			<a
				class="biz-tab__item 
					<c:if test="${param.sort == '' || param.sort == null }"> biz-tab__item--active</c:if>
				"
				href="/admin/adminCounselorProposal">전체<span
				class="biz-tab__number"> ${totalCounsel}</span></a> <a
				class="biz-tab__item 
						<c:if test="${param.sort == 'success' }">biz-tab__item--active</c:if>
					"
				href="/admin/adminCounselorProposal?sort=success">승인<span
				class="biz-tab__number">${csCompleteCount}</span>
			</a> <a
				class="biz-tab__item 
						<c:if test="${param.sort == 'waiting' }"> biz-tab__item--active</c:if>"
				href="/admin/adminCounselorProposal?sort=waiting">승인 대기<span
				class="biz-tab__number">${csWaitCount}</span>
			</a> <a
				class="biz-tab__item border-right <c:if test="${param.sort == 'false' }"> biz-tab__item--active</c:if>"
				href="/admin/adminCounselorProposal?sort=false">승인 취소<span
				class="biz-tab__number">${csFalseCount}</span>
			</a>

			<div class="serchbox ml-auto">
				<input class="serch-input" placeholder="이름을 검색해주세요." type="text"
					name="memNm" id="" value="" style="margin-left: auto;">
				<button type="submit" class="btn btn-sm btn-secondary serch">검색</button>
			</div>
		</div>
		<table class="counsel table1">
			<colgroup>
				<col style="width: 10%">
				<col style="width: 10%">
				<col style="width: 14%">
				<col style="width: 15%">
				<col style="width: 15%">
				<col style="width: 12%">
			</colgroup>
			<thead>
				<tr class="uu_uu">
					<th scope="col" class="headdd">이름</th>
					<th scope="col" class="headdd">아이디</th>
					<th scope="col" class="headdd">지원 분야</th>
					<th scope="col" class="headdd">전화번호</th>
					<th scope="col" class="headdd">가입일</th>
					<th scope="col" class="headdd">신청 상태</th>
					<th scope="col" class="headdd">비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="memberVO" items="${memberVOList}" varStatus="stat">
					<tr class="u_u">
						<td class="num" scope="row">${memberVO.memNm}</td>
						<td class="goods">${memberVO.memId}</td>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01000'}">
								<td class="term">개발 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01001'}">
								<td class="term">경영 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01002'}">
								<td class="term">마케팅/광고 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01003'}">
								<td class="term">디자인 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01004'}">
								<td class="term">영업 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01005'}">
								<td class="term">고객 서비스 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01006'}">
								<td class="term">미디어 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01007'}">
								<td class="term">엔지니어링 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01008'}">
								<td class="term">HR 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01009'}">
								<td class="term">게임/제작 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01010'}">
								<td class="term">금융 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01011'}">
								<td class="term">제조/생산 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01012'}">
								<td class="term">의료/제약/바이오 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01013'}">
								<td class="term">교육 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01014'}">
								<td class="term">물류/무역 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01015'}">
								<td class="term">법률/법집행 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01016'}">
								<td class="term">식/음료 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01017'}">
								<td class="term">건설/시설 직군<br></td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${memberVO.memWishJobCate == 'MWJ01018'}">
								<td class="term">공공/복지 직군<br></td>
							</c:when>
						</c:choose>
						<td class="phoneNumber"><c:out value="${memberVO.memTel}" /></td>
						<td><fmt:formatDate pattern="yyyy년 MM월 dd일"
								value="${memberVO.memRegDt}" /></td>
						<c:choose>
							<c:when test="${memberVO.memYn =='AYN01001'}">
								<td class="cert cert-approved">승인완료</td>
							</c:when>
							<c:when test="${memberVO.memYn == 'AYN01002'}">
								<td class="cert cert-waiting">승인대기</td>
							</c:when>
							<c:otherwise>
								<td class="cert cert-cancelled">승인취소</td>
							</c:otherwise>
						</c:choose>

						<td>
							<!-- 셀 병합을 통해 전체 너비를 차지하도록 설정합니다 --> <input type="hidden"
							class="memberId" value="${memberVO.memId}" /> <input
							type="hidden" class="ComCodeInfoVO"
							value="${memberVO.memWishJobCate}" /> <input type="hidden"
							class="ComDetInfoVO" value="${memberVO.memWishJob}" /> <input
							type="hidden" class="ComDetInfoVO2"
							value="${memberVO.memIntWord}" /> <input type="hidden"
							class="submitResumeNo" value="${memberVO.submitResumeNo}" /> <a
							class="list-counting__applicants-btn showResume" href="#"
							data-resumno="${memberVO.submitResumeNo}"> <span></span>이력서
								보기
						</a> <c:if test="${memberVO.freeYn eq 'Y'}">
								<a type="button"
									onclick="protfolioView('${memboerVO.memId}','FREE','${memberVO.ptflNo}')"
									class="open-resume-modal list-counting__applicants-btn"
									data-izimodal-close=""
									data-izimodal-transitionout="bounceOutDown">자소서 보기</a>
							</c:if> <c:if test="${memberVO.basicYn eq 'Y'}">
								<a type="button"
									onclick="protfolioView('${memberVO.memId}','BASIC','${memberVO.ptflNo}')"
									class="open-resume-modal list-counting__applicants-btn"
									data-izimodal-close=""
									data-izimodal-transitionout="bounceOutDown">자소서 보기</a>
							</c:if>

							<button type="button"
								class="list-counting__applicants-btn detailGo"
								data-memwishjobcate="${memberVO.memWishJobCate}"
								data-bs-toggle="modal" data-bs-target="#modalDialogScrollable">상세보기</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagez">${info.getPagingArea5()}</div>
	</div>
</div>
<div class="card">

	<!-- 모달시작 -->
	<div class="modal fade" id="modalDialogScrollable" tabindex="-1"
		aria-hidden="true" style="display: none; z-index: 1100;">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="infomation"></div>
				<img class="naesajin rounded-circle border-2 border-primary"
					id="naesajin" alt="회원 사진">
				<table class="modaltable">
					<tr>

						<th class="thth">회원 ID</th>
						<td class="tdtd" id="memId"></td>
					</tr>
					<tr>
						<th class="thth">회원 이름</th>
						<td class="tdtd" id="memName"></td>
					</tr>
					<tr>
						<th class="thth">주소</th>
						<td class="tdtd" id="memAddr"></td>
					</tr>
					<tr>
						<th class="thth">전화번호</th>
						<td class="tdtd" id="memTel"></td>
					</tr>
					<tr>
						<th class="thth">가입일</th>
						<td class="tdtd" id="memRegDt"></td>
					</tr>
					<tr>
						<th class="thth">회원분류</th>
						<td class="tdtd" id="memStateCd"></td>
					</tr>
					<tr>
						<th class="thth">생년월일</th>
						<td class="tdtd" id="memBirth"></td>
					</tr>
					<!-- 나머지 항목도 같은 형식으로 추가 -->
					<tr>
						<th class="thth">성별</th>
						<td class="tdtd" id="memGen"></td>
					</tr>
					<!-- 나머지 항목도 같은 형식으로 추가 -->
					<tr>
						<th class="thth">이메일</th>
						<td class="tdtd" id="memEmail"></td>
					</tr>
					<!-- 나머지 항목도 같은 형식으로 추가 -->
					<tr>
						<th class="thth">닉네임</th>
						<td class="tdtd" id="memNcnm"></td>
					</tr>
					<tr>
						<th class="thth">소개글</th>
						<td class="tdtd" id="memIntrcn"></td>
					</tr>
					<tr>
						<th class="thth">희망직군</th>
						<td class="tdtd" id="memWishJobCate"></td>
					</tr>
					<!-- 나머지 항목도 같은 형식으로 추가 -->
					<tr>
						<th class="thth">희망직업</th>
						<td class="tdtd" id="memWishJob"></td>
					</tr>
					<!-- 나머지 항목도 같은 형식으로 추가 -->
					<tr>
						<th class="thth">관심키워드</th>
						<td class="tdtd" id="memIntWord"></td>
					</tr>
					<tr>
						<th class="thth">신청 상태</th>
						<td class="tdtd" id="memYn"></td>
					</tr>

					<!-- 나머지 항목도 같은 형식으로 추가 -->
				</table>

				<button id="closeModal" type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 자소서 기본양식 모달 -->
<div class="card">
	<div class="modal fade" id="modal-portfolioBasic" tabindex="-1"
		aria-hidden="true" style="display: none; z-index: 1100;">
		<div class="modal-dialog modal-dialog-scrollable modal-content">
			<p class="bold p-20 mb-25">자기소개서</p>

			<div id="divBasic"></div>

			<button id="closeModal" type="button" class="btn btn-secondary"
				data-bs-dismiss="modal">닫기</button>
		</div>
	</div>
</div>
<!-- 자소서 기본양식 모달 끝 -->


<!-- 자소서 자유양식 모달 -->
<div class="card">
	<div class="modal fade" id="modal-portfolioFree" tabindex="-1"
		aria-hidden="true" style="display: none; z-index: 1100;">
		<div class="modal-dialog modal-dialog-scrollable">
			<p class="bold p-20 mb-25">자기소개서</p>

			<div id="divFree"></div>

			<button id="closeModal" type="button" class="btn btn-secondary"
				data-bs-dismiss="modal">닫기</button>
		</div>
	</div>
</div>
<!-- 자소서 자유양식 모달 끝 -->

<!-- 모달 -->
<div id="myModal" class="modal">
	<div class="resume-modal">
		<span class="close">&times;</span>
		<div id="modalContent"></div>
	</div>
</div>


<!-- Vendor JS Files -->
<script src="/resources/vendor/apexcharts/apexcharts.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/vendor/chart.js/chart.umd.js"></script>
<script src="/resources/vendor/echarts/echarts.min.js"></script>
<script src="/resources/vendor/quill/quill.min.js"></script>
<script src="/resources/vendor/simple-datatables/simple-datatables.js"></script>
<script src="/resources/vendor/tinymce/tinymce.min.js"></script>
<script src="/resources/vendor/php-email-form/validate.js"></script>


<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<!-- Template Main JS File -->
<script src="/resources/js/main.js"></script>

<script src="/resources/js/admin.js"></script>

<script>

//자소서 모달
function protfolioView(memId,gubun,ptflNo) {

	// 로직 추가
          if(gubun=="FREE"){// /appPortfolioFree
       		
          	 $.ajax({
          	        url: "/entApplicant/appPortfolioFree", 
          			contentType : "application/json; charset=utf-8",
          			data :  JSON.stringify({
          				memId : memId,
          				ptflNo: ptflNo
          			}),
          	        type: "POST",
          	        dataType: "json",
          	      	beforeSend: function(xhr) {
	                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                },
          	        success: function(res) {
          			
          	        	//res : List<PortfolioFreeVO>
          	        	console.log("res =>>>>> ",res);
          	        	
          	        	let ptflTitle = res[0].ptflTitle;
          	        	
          	        	let str = "";

          	        		str += "<div style='font-size:18px; font-weight: bold; '>" + ptflTitle + "</div>";
          	        	
          	        	$.each(res,function(idx,portfolioFreeVO){
          	        		
            	        	str += "<div id='modalContent'><div class='mypage-body-con'><div class='body-sub-con'><div class='page-main-box'>";
          	        		str += "<div class='ptfl-one-line mt-15'><p class='ptfl-tit'>질문</p><pre class='ptfl-cntnt'>"+portfolioFreeVO.ptflFreeq+"</pre></div>";
          	        		str += "<div class='ptfl-one-line'><p class='ptfl-tit'>답변</p><pre class='ptfl-cntnt'>"+portfolioFreeVO.ptflFreea+"</pre></div></div></div></div>";
          	        		
          	        	});
          	        	
						openModal(str);
						
						
       	      },
               error: function(error) {
               	
                   // AJAX 요청이 실패한 경우의 처리
                   console.error("Error fetching data:", error);
               }
          	
          	}); // free ajax end
          	
          } else{            // /appPortfolioBasic
        	  
        	  $.ajax({
        	        url: "/entApplicant/appPortfolioBasic", 
        			contentType : "application/json; charset=utf-8",
        	        type: "POST",
        	        data :  JSON.stringify({
        	        	memId : memId,
          				ptflNo: ptflNo
          			}),        	       
          			dataType: "json",
          			 beforeSend: function(xhr) {
 	                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
 	                },
        	        success: function(res) {
        			
        	        	console.log("res =>>>>> ",res);
        	        	
        	        	let str ="";
        	        	str += "<div id='modalContent'><div class='mypage-body-con'><div class='body-sub-con'><div class='page-main-box'>";
        	        	str += "<div style='font-size:20px; font-weight: bold; margin-bottom: 20px;'>" + res.ptflTitle + "</div>";
        	        	str += "<div class='ptfl-one-line'><p class='ptfl-tit'>성장과정</p><pre class='ptfl-cntnt'>" + res.ptflGrowth + "</pre></div>";
        	            str += "<div class='ptfl-one-line'><p class='ptfl-tit'>지원동기</p><pre class='ptfl-cntnt'>" + res.ptflMotive + "</pre></div>";
        	            str += "<div class='ptfl-one-line'><p class='ptfl-tit'>성격 및 장단점</p><pre class='ptfl-cntnt'>" + res.ptflPersonality + "</pre></div>";
        	            str += "<div class='ptfl-one-line'><p class='ptfl-tit'>관련 업무 경험 및 경력</p><pre class='ptfl-cntnt'>" + res.ptflJobExp + "</pre></div>";
        	            str += "<div class='ptfl-one-line'><p class='ptfl-tit'>프로젝트 경험</p><pre class='ptfl-cntnt'>" + res.ptflProjExp + "</pre></div>";
        	            str += "<div class='ptfl-one-line'><p class='ptfl-tit'>입사 후 포부</p><pre class='ptfl-cntnt'>" + res.ptflAspirations + "</pre></div></div></div></div>";

        	        	
        				openModal(str);
        				
     	      },
             error: function(error) {
             	
                 // AJAX 요청이 실패한 경우의 처리
                 console.error("Error fetching data:", error);
             }
        	
        	}); // basic ajax end

        }; // else end
	};	// function end

function formatPhoneNumber(phoneNumberTd) {
    const phoneNumber = phoneNumberTd.textContent;
    const cleaned = ('' + phoneNumber).replace(/\D/g, '');
    const regex = /^(\d{3})(\d{4})(\d{4})$/;
    const result = cleaned.replace(regex, '$1-$2-$3');
    console.log(result);
    phoneNumberTd.textContent = result;
    return result;
}

window.onload = function () {
    const phoneNumberElements = document.getElementsByClassName('phoneNumber');
    Array.from(phoneNumberElements).forEach(phoneNumberTd => {
        formatPhoneNumber(phoneNumberTd);
    });
};

document.addEventListener("DOMContentLoaded", function() {
	
	const detailButtons = document.querySelectorAll('.detailGo');
	
	
	detailButtons.forEach(button =>{
		button.addEventListener("click",function(e){
			console.log("넌 들어 오냐?");
			const memWishJobCateValue = $(this).data("memwishjobcate");
			
			console.log("memWishJobCateValue",memWishJobCateValue);
			
			  console.dir(e.target.parentElement.children);
			  
			  let memId = e.target.parentElement.children[0].value;
			  let memWishJobCate = e.target.parentElement.children[1].value;
			  let memWishJob = e.target.parentElement.children[2].value;
			  let memIntWord = e.target.parentElement.children[3].value;
			  
			  
			  
			  console.log("memId : " +  memId);
			  console.log("memWishJobCate : " +  memWishJobCate);
			  console.log("memWishJob : " +  memWishJob);
			  console.log("memIntWord : " +  memIntWord);
			  
			  let data = {
					  "memId" : memId,
					  "memWishJobCate" : memWishJobCate,
					  "memWishJob" : memWishJob,
					  "memIntWord" : memIntWord,
			 			}

	           $.ajax({
	        	   url: "/admin/selectCounselorAjax",
	                contentType: "application/json;charset=utf-8",
	                data: JSON.stringify(data), // JSON.stringify 오타 수정
	                type: "post",
	                dataType: "json",
	                beforeSend: function(xhr) {
	                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                },
 					success: function(result) {
	                	
	                	console.log(result);
	                	
	                    // 받아온 정보를 이용하여 모달에 동적으로 표시하는 작업
	                    // 예시: 모달 내 특정 요소에 받아온 데이터 추가
	                    const memId = document.getElementById("memId");
	                    
	                    const infomation = document.querySelector(".infomation"); // 해당 div를 가져옵니다.

		                 // result.memId를 해당 div 안에 삽입합니다.
		                 infomation.innerHTML = '<strong>'+ result.memId +'님의 상세정보 </strong>';
	                	
	                	memId.innerHTML = result.memId; // 예시로 받아온 데이터의 일부를 모달에 표시
	                	
	                	const sajin = $("#naesajin"); 
	                	if(result.memAfId != null){
	                	sajin.attr("src", "/resources/upload/"+result.memAfId);
	                	}else{
	                		sajin.attr("src","/resources/images/default_profile.png")
	                	}
	                    
	                    const memName = document.getElementById("memName");
	                    
	                	memName.innerHTML = result.memNm;
	                    
	                	const memAddr = document.getElementById("memAddr");
	                    
	                	memAddr.innerHTML = result.memAddr + result.memAddr2;
	                	
	                	const memTel = document.getElementById("memTel");
	                    
	                	memTel.innerHTML = result.memTel;
	                	
	                	const memRegDt = document.getElementById("memRegDt");
	                    
	                	memRegDt.innerHTML = result.memRegDt;
	                	
	                	const memStateCd = document.getElementById("memStateCd");
	                    
	                	if(result.memStateCd=='MSC01000'){
	                		memStateCd.innerHTML = '탈퇴 회원';
	                	}else if(result.memStateCd == 'MSC01001'){
	                		memStateCd.innerHTML = '정상 회원';
	                	}else{
	                		memStateCd.innerHTML = '블랙리스트 회원';
	                	}
	                	
	                	const memBirth = document.getElementById("memBirth");
	                	
	                	memBirth.innerHTML = result.memBirth;
	                	
	                	const memGen = document.getElementById("memGen");
	                	
	                	if(result.memGen == 1){
	                		memGen.innerHTML = '남성';
	                	}else{
	                		memGen.innerHTML = '여성';
	                	}
	                	
						const memEmail = document.getElementById("memEmail");
	                    
						memEmail.innerHTML = result.memEmail;
						
						const memNcnm = document.getElementById("memNcnm");
	                    
						memNcnm.innerHTML = result.memNcnm;
						
						const memIntrcn = document.getElementById("memIntrcn");
	                    
						memIntrcn.innerHTML = result.memIntrcn;
						
						const memWishJobCate = document.getElementById("memWishJobCate");
	                    
						memWishJobCate.innerHTML = result.comCodeInfoVO.comCdNm;
						
						const memWishJob = document.getElementById("memWishJob");
	                    
						memWishJob.innerHTML = result.comCodeInfoVO.comDetCodeInfoVO2.comDetCdNm;
						
						const memIntWord = document.getElementById("memIntWord");
						
						if(result.memIntWord == 'IKW01001'){
							
							memIntWord.innerHTML = '높은연봉';
						
						}else if(result.memIntWord =='IKW01002'){
							
							memIntWord.innerHTML = '자기계발지원'
						
						}else if(result.memIntWord =='IKW01003'){
							
							memIntWord.innerHTML = '워라벨';

						}else if(result.memIntWord == 'IKW01004'){
							
							memIntWord.innerHTML = '사내문화';
						
						}else if(result.memIntWord == 'IKW01005'){
							
							memIntWord.innerHTML = '좋은동료';
						
						}else if(result.memIntWord == 'IKW01006'){
							
							memIntWord.innerHTML = '30';
						
						}else if(result.memIntWord == 'IKW01007'){
							
							memIntWord.innerHTML = '넉넉한 상여금';
						
						}else if(result.memIntWord == 'IKW01008'){
							
							memIntWord.innerHTML = '주 4.5일 근무';
						
						}else if(result.memIntWord == 'IKW01009'){
							
							memIntWord.innerHTML = '수평적인 문화';
						
						}else if(result.memIntWord == 'IKW01010'){
							
							memIntWord.innerHTML = '탄탄한 회사';
						
						}else if(result.memIntWord == 'IKW01011'){
							
							memIntWord.innerHTML = '자율 출퇴근';
						
						}else{
							
							memIntWord.innerHTML = '관심키워드없음';
						}
						
						const memYn = document.getElementById("memYn");
	                    console.log(result.memYn);
	                    let ynText = '';
	                    let ynColor = '';
	                    
						if(result.memYn =='AYN01001'){
						
							memYn.innerHTML = '승인완료'+'<input type="button" class="Yncondition detailGo list-counting__applicants-btn" value="상태 변경"/>';
							 memYn.style.color = 'green';
						}else if(result.memYn == 'AYN01002'){
							
							memYn.innerHTML = '승인대기'+'<input type="button" class="Yncondition detailGo list-counting__applicants-btn"  value="상태 변경"/>';
							 memYn.style.color = 'black';
						}else{
							
							memYn.innerHTML = '승인취소'+'<input type="button" class="Yncondition detailGo list-counting__applicants-btn"  value="상태 변경"/>';
							 memYn.style.color = 'red';
						}
						const currentText = memYn.textContent.trim(); // 현재 텍스트 내용을 가져옵니다.

						function changeToSelect() {
							const selectElement = document.createElement("select");
						    const options = [
						        { value: "AYN01001", label: "승인완료" },
						        { value: "AYN01002", label: "승인대기" },
						        { value: "AYN01003", label: "승인취소" }
						    ];

						    options.forEach(option => {
						        const optionElement = document.createElement("option");
						        optionElement.value = option.value;
						        optionElement.textContent = option.label;
						        selectElement.appendChild(optionElement);
						    });

						    // 저장 버튼
						    const saveButton = document.createElement('button');
						    saveButton.textContent = '저장';
						    saveButton.classList.add('save-button');
						    console.log(memId);
						    saveButton.addEventListener('click', function() {
						        const selectedValue = selectElement.value;
						        data = {
						        		"memYn" : selectedValue,
						        		"memId" : result.memId
						        }
						        
						           $.ajax({
						        	   url: "/admin/updateCounselorAjax",
						                contentType: "application/json;charset=utf-8",
						                data: JSON.stringify(data), // JSON.stringify 오타 수정
						                type: "post",
						                dataType: "json",
						                beforeSend: function(xhr) {
						                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						                },
					 					success: function(result) {
					 						console.log(result);
					 						alert("성공적으로 저장되었습니다");
					 						const memYn = document.getElementById("memYn");
					 						const value = selectedValue;
					 						
					 						if(value =='AYN01001'){
					 							
												memYn.innerHTML = '승인완료'+'<input type="button" class="Yncondition detailGo list-counting__applicants-btn" value="상태 변경"/>';
												 memYn.style.color = 'green';
											}else if(value == 'AYN01002'){
												
												memYn.innerHTML = '승인대기'+'<input type="button" class="Yncondition detailGo list-counting__applicants-btn"  value="상태 변경"/>';
												 memYn.style.color = 'black';
											}else{
												
												memYn.innerHTML = '승인취소'+'<input type="button" class="Yncondition detailGo list-counting__applicants-btn"  value="상태 변경"/>';
												 memYn.style.color = 'red';
											}
					 						
					 						 // 상태 변경 버튼 재표시
// 									        memYn.insertAdjacentHTML('beforeend', '<input type="button" class="Yncondition detailGo list-counting__applicants-btn" value="상태 변경"/>');
									        
									        // 상태 변경 버튼 클릭 이벤트 다시 연결
									        const changeStatusButton = document.querySelector('.Yncondition');
									        changeStatusButton.addEventListener('click', function() {
									            changeToSelect();
									        });
					 					}
						          });
						    });

						    // 취소 버튼
						    const cancelButton = document.createElement('button');
						    cancelButton.textContent = '취소';
						    cancelButton.classList.add('cancel-button');
						    cancelButton.addEventListener('click', function() {
						        console.log('취소');
						    });

						    memYn.innerHTML = '';
						    memYn.appendChild(selectElement);
						    memYn.appendChild(saveButton);
						    memYn.appendChild(cancelButton);
						}

						// 상태 변경 버튼 클릭 이벤트 처리
						const changeStatusButton = document.querySelector('.Yncondition');
						changeStatusButton.addEventListener('click', function() {
						    changeToSelect();
						});

						// 취소 버튼 처리
						document.addEventListener('click', function(event) {
							  const cancelButton = event.target.closest('.cancel-button');
							    if (cancelButton) {
							        const memYn = document.getElementById("memYn");
							        memYn.innerHTML = currentText;

							        // 상태 변경 버튼 재표시
							        memYn.insertAdjacentHTML('beforeend', '<input type="button" class="Yncondition detailGo list-counting__applicants-btn" value="상태 변경"/>');
							        
							        // 상태 변경 버튼 클릭 이벤트 다시 연결
							        const changeStatusButton = document.querySelector('.Yncondition');
							        changeStatusButton.addEventListener('click', function() {
							            changeToSelect();
							        });
							    }
							});
						}
	           });
	           
	            const modal = document.getElementById("closeModal");
	            modal.style.display = "block";
	            document.body.style.overflow = "hidden";
	            
	            function closeModal() {
	                // 모달을 닫는 코드 작성
	                modal.style.display = "none";
	                document.body.style.overflow = "auto"; // 기존 스크롤 상태로 변경

	                // 페이지 이동
	                window.location.href = "/admin/adminCounselorProposal";
	            }

	            // 모달 닫기 버튼에 이벤트 리스너를 추가합니다.
	            const closeButton = document.getElementById("closeModal"); // 닫기 버튼 ID로 가져와야 합니다.
	            closeButton.addEventListener('click', closeModal);
	        });
	    });
	});
	
$(document).on("click", ".showResume", function() {
    
    /*
       멤버의 아이디는 가져오는데 이력서는 신청테이블에서 가져와야된다.
       
       근데 신청테이블에서 주는 이력서 번호가 없어서 임시로 넣고 함.
    */
    
    let memId = $(this).parent().children('input:eq(0)').val();
    let resumeNo = $(this).data("resumno");

    console.log("resumeNo",resumeNo);
    let data = {
          "memId":memId,
          "resumeNo":resumeNo
    };
    
    
    $.ajax({
        url:'/admin/getResume',
       contentType:"application/json;charset=utf-8",
       data:JSON.stringify(data),
       type:"post",
       dataType:"text",
        beforeSend: function(xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success: function(mapMemberVO) {
           
           let memberVO = JSON.parse(mapMemberVO);
           let resumeVOList = memberVO.resumeVOList;
           let academicCareerVOList = memberVO.academicCareerVOList;//학력
           let careerVOList = memberVO.careerVOList; //경력
           let resultVOList = memberVO.resultVOList; //성과ㅓ
           let languageVOList = memberVO.languageVOList; //어학
           let awardsVOList = memberVO.awardsVOList; //수상
           let comCodeInfoVOList = memberVO.comCodeInfoVOList; //
           let comDetCodeInfoVOList = memberVO.comDetCodeInfoVOList;
           var birthDate = memberVO.memberVO.memBirth; // 이 변수에는 날짜 데이터가 있다고 가정합니다.
           var formattedDate = moment(birthDate).format('YYYY년생');
//            console.log('languageVOList',languageVOList);
//            console.log("resumeVOList[0].resumeSkill : " ,resumeVOList[0].resumeSkill);
           
//            console.log("comCodeInfoVOList 1122zz : " ,comCodeInfoVOList);
//            console.log("comDetCodeInfoVOList 1122zz : " ,comDetCodeInfoVOList);
           
//            console.log("memberVO : ", memberVO.memberVO);
//            console.log("resumeVOList : ", resumeVOList);
//            console.log("academicCareerVOList : ", academicCareerVOList);
//            console.log("careerVOList : ", careerVOList);
//            console.log("resultVOList : ", resultVOList);
//            console.log("languageVOList : ", languageVOList);
//            console.log("awardsVOList : ", awardsVOList);
           
           let strTemp = '<div class="mypage-body-con">';
           strTemp += '<div class="body-sub-con">';
           strTemp += '<div class="rsm_section">';
           strTemp += '<div class="photo_use_row">';
           strTemp += '<div class="input_resume_basic photo_use_basic">';
           strTemp += '<div class="resume-name">' + memberVO.memberVO.memNm;
           strTemp += '</div>';
           strTemp += '<div class="resume-one-line">';
           strTemp += '<div class="with_icon">';
           strTemp += '<i class="fa-regular fa-envelope"></i>';
           strTemp += '<p>' + memberVO.memberVO.memEmail + '</p>';
           strTemp += '<div class="v-div-line ml-15 mr-15"></div>';
           strTemp += '<div class="with_icon">';
           strTemp += '<i class="fa-solid fa-mobile-screen"></i>';
           strTemp += '<p>' + memberVO.memberVO.memTel + '</p>';
           strTemp += '</div> </div> </div> ';
           strTemp += '<div class="resume-one-line">';
           strTemp += '<div class="with_icon">';
           strTemp += '<i class="fa-regular fa-user"></i>';
           if(memberVO.memberVO.memGen == '1'){
              strTemp += '<p>남자</p>';
           }else if(memberVO.memberVO.memGen =='0'){
              strTemp += '<p>여자</p>';
           }
           strTemp += '<div class="v-div-line ml-15 mr-15"></div>';
           strTemp += '<i class="fa-regular fa-calendar"></i>';
           strTemp += '<p>'+formattedDate+"</p>";
           strTemp += '<div class="v-div-line ml-15 mr-15"></div>';
           strTemp += '<p>'+memberVO.memberVO.memAddr +'</p>';
           strTemp += '</div>';
           strTemp += '</div>';
           strTemp += '<div class="resume_addphoto" for="resume_addphoto_id">';
           if(memberVO.memberVO.memAfId !==null && memberVO.memberVO.memAfId !==''){
              strTemp +='<img alt="" src="/resources/upload/' + memberVO.memberVO.memAfId +'">';
           }else{
              strTemp += '<img alt="" src="/resources/images/empty-profile.png">';
           }
           
           strTemp += '</div> </div> </div>';
           strTemp += '<div class="rsm_default_cont">';
           strTemp += '<div class="rsm_cont_bd">';
           strTemp += '<div class="rsm_section">';
           strTemp += '<div class="rsm_hgroup">';
           strTemp += '<div class="rsm-vertical-center">';
           strTemp += '<h3 class="rsm_ttl">';
           strTemp += '<span class="rsm_ttl__valid">*</span>소개글';
           strTemp += '</h3>';
           strTemp += '</div>';
           strTemp += '</div>';
           strTemp += '<div class="rsm_body">';
           strTemp += '<div class="rsm_half_cell">';
           strTemp += '<label class="cssel_ty1">';
           strTemp += '<a class="btn_sel false">'+ memberVO.memberVO.memIntrcn +'</a>';
           strTemp += '</label>';
           strTemp += '</div> </div> </div> </div> </div> </div> </div> </div>';
           
           strTemp += '<div class="mypage-body-con mt-35">';
           strTemp += '<div class="body-sub-con">';
           strTemp += '<div class="mb-20">';
           strTemp += '<p class="bold p-22 mb-40">이력서 제목 <span class="p-15 ml-9">'+resumeVOList[0].resumeTitle+'</span></p></div>';
           strTemp += '<div class="rsm_hgroup">';
           strTemp += '<div class="rsm-vertical-center resume-two-div mb-12">';
           strTemp += '<span class="rsm_ttl">희망 직종</span><span class="rsm_ttl">희망 직업</span></div></div>';
           strTemp += '<div class="resume-two-div">';
           strTemp += '<div>';
           comCodeInfoVOList.forEach(function(elements) {
              if(elements.comCd == resumeVOList[0].resumeOccp){
                 strTemp += '<p class="bold select-comCode">'+elements.comCdNm+'</p></div>';
              }
           })
           strTemp += '<div>';
           comDetCodeInfoVOList.forEach(function(elements) {
              if (elements.comDetCd == resumeVOList[0].resumeJob) {
                 strTemp += '<p class="bold select-comCode">'+elements.comDetCdNm+'</p></div></div>'
              }
           })
           
           strTemp += '<dlv class="mb-40">';
           strTemp += '<p class="bold p-22 mb-12">보유 기술</p>';
           strTemp += '<div class="mb-40 wordContainer">';
           if(resumeVOList[0].resumeSkill !=null){
           let tempSkills = resumeVOList[0].resumeSkill.split(',');
           
           if(tempSkills != null) {
              tempSkills.forEach(function(elements) {
                 strTemp +='<div class="wordButton">' + elements +'</div>';
              })
        	}
           }
           strTemp += '</div>';
           strTemp += '<div class="rsm_hgroup">';
           strTemp += '<div class="rsm-vertical-center">';
           strTemp += '<h3 class="rsm_ttl">경력(인턴 포함)</h3> </div>';
           careerVOList.forEach(function(elements) {
              strTemp +='<div class="career-div-career" id="career-div-career" style="margin-top: 20px; margin-bottom:40px;">';
              strTemp +='<div class="career-div">';
              strTemp +='<div class="career-left-div">';
              strTemp +='<div class="group-date">';
              var comDt = elements.companyEntranceDt;
              var formattedDate2 = moment(comDt).format('YYYY년 MM월');
              strTemp += formattedDate2 +'<span>~</span>';
              if(elements.companyEmpStatus == '0'){
                 var comLeaveDt = elements.companyLeaveDt
                 var formattedDate3 = moment(comLeaveDt).format('YYYY년 MM월');
                 strTemp += formattedDate3;
              }
              strTemp +='</div>';
              strTemp +='<div class="group_check__box">';
              strTemp +='<label class="btn_check">';
              strTemp += '<input name="check_new" disabled class="cscheck" type="checkbox" ' + (elements.companyEmpStatus === '1' ? 'checked' : '') + ' />';
              
              strTemp +='<span class="check_txt">재직중</span>';
              strTemp +='</label></div></div>';
              strTemp +='<div class="career-right-div" id="career-right-divv">';
              strTemp +='<div class="enterprise-name">';
              strTemp +='<p>' + elements.companyNm + '</p>';
              strTemp +='</div>';
              strTemp +='<div class="enterprise-dept-position career-two-div">';
              strTemp +='<div class="enterprise-dept">';
              strTemp +='<p>' + elements.companyDept + '</p>';
              strTemp +='</div>';
              strTemp +='<div class="enterprise-position">';
              strTemp +='<p>' + elements.companyPosition + '</p>';
              strTemp +='</div> </div>';
              strTemp +='<div class="enterprise-job-sal career-two-div">';
              strTemp +='<div>';
              strTemp +='<p>' + elements.companyJob + '</p>';
              strTemp +='</div>';
              strTemp +='<div>';
              strTemp +='<p>' + elements.companySalary + '</p>';
              strTemp +='</div> </div>';
              strTemp +='<div class="flexible_textarea">';
              strTemp +='<div class="medit">';
              strTemp += elements.companyDetCareer + '</div> </div> </div> </div> </div>';
           })
           strTemp += '<div class="rsm_hgroup" style="margin-top: 80px;">';
           strTemp += '<div class="rsm-vertical-center">';
           strTemp += '<h3 class="rsm_ttl">학력</h3>';
           strTemp += '</div></div>';
           
           academicCareerVOList.forEach(function(elements) {
              strTemp +='<div class="acd-career-div">';
              strTemp +='<div class="acd-career-left-div">';
              strTemp +='<div class="group-date">';
              
              var acdmDt = elements.acdmcrEntranceDt;
              var formattedDate4 = moment(acdmDt).format('YYYY년 MM월');
              strTemp += formattedDate4 +'<span>~</span>';
              
              var acdmGrDt = elements.acdmcrGrdtnDt;
              var formattedDate5 = moment(acdmGrDt).format('YYYY년 MM월');
              strTemp += formattedDate5 +'</div></div>';
              
              strTemp +='<div class="acd-career-right-div">';
              strTemp +='<div class="enterprise-name">';
              strTemp +='<p>' + elements.acdmcrNm +'</p></div>';
              strTemp +='<div class="enterprise-dept-position career-three-div">';
              strTemp +='<div class="enterprise-dept">';
              strTemp +='<p>' + elements.acdmcrMajor + '</p></div>';
              strTemp +='<div class="enterprise-position">';
              strTemp +='<p>' + elements.acdmcrDegree + '</p></div>';
              strTemp +='<div><p>' + elements.acdmcrPoint + '</p></div></div></div></div>'
           })
           
           
           strTemp += '<div class="rsm_hgroup" style="margin-top: 80px;">';
           strTemp += '<div class="rsm-vertical-center">';
           strTemp += '<h3 class="rsm_ttl">성과</h3>';
           strTemp += '</div></div>';
           
           resultVOList.forEach(function(elements) {
              strTemp +='<div class="certi-career-div" id="certi-career-div">';
              strTemp +='<div class="certi-career-left-div">';
              strTemp +='<div class="group-date">';
              
              var resultStdt = elements.resultStdt;
              var formattedDate6 = moment(resultStdt).format('YYYY-MM-DD');
              
              strTemp += formattedDate6;
              strTemp += '<span>~</span>';
              
              var resultEddt = elements.resultEddt;
              var formattedDate7 = moment(resultEddt).format('YYYY-MM-DD');
              
              strTemp += formattedDate7 + '</div></div>';
              strTemp +='<div class="certi-career-right-div">';
              strTemp +='<div class="enterprise-name"><p>' + elements.resultTitle +'</p></div>';
              strTemp +='<div class="flexible_textarea">';
              strTemp += elements.resultCntnt + '</div></div></div>';
              
           })
           strTemp += '<div class="rsm_hgroup" style="margin-top: 80px;">';
           strTemp += '<div class="rsm-vertical-center">';
           strTemp += '<h3 class="rsm_ttl">활동 및 수상</h3>';
           strTemp += '</div></div>';
           
           awardsVOList.forEach(function(elements) {
              strTemp +='<div class="awards-career-div" id="awards-career-div">';
              strTemp +='<div class="awards-career-left-div">';
              strTemp +='<div class="group-date">';
              var awdDt = elements.awdDt;
              var formattedDate8 = moment(awdDt).format('YYYY년 MM월 DD일')
              
              strTemp +=formattedDate8 +'</div></div>'
              strTemp +='<div class="awards-career-right-div">';
              strTemp +='<div class="enterprise-name career-two-div">';
              strTemp +='<p>' + elements.awdNm + '</p>';
              strTemp +='<p class="p-15 txt-gray normal">' + elements.awdOrg + '</p>';
              strTemp +='</div>';
              strTemp +='<div class="flexible_textarea">';
              strTemp +='<p>' + elements.awdCntnt + '</p>';
              strTemp +='</div></div></div>';
           })
           strTemp += '<div class="rsm_hgroup" style="margin-top: 80px;">';
           strTemp += '<div class="rsm-vertical-center">';
           strTemp += '<h3 class="rsm_ttl">어학 및 어학 상세정보</h3>';
           strTemp += '</div></div>';
           strTemp += '<div class="lang-div-true">';
           languageVOList.forEach(function(elements,index) {
              
              strTemp += '<div class="lang-div">';
              strTemp += '<div class="lang-div-left">';
              strTemp += '<div class="lang-select-div">';
              let langKind = elements.langKind;
              
              strTemp += '<select class="lang-select" name="languageVOList[${index}].langKind">';
              if(langKind == '한국어'){
                strTemp += '<option value="한국어" selected>한국어</option>';
             } else if(langKind == '영어') {
                strTemp += '<option value="영어" selected>영어</option>';
             } else if(langKind == '일본어') {
                strTemp += '<option value="일본어" selected>일본어</option>';
             } else if(langKind == '중국어') {
                strTemp += '<option value="중국어" selected>중국어</option>';
             } else if(langKind == '프랑스어') {
                strTemp += '<option value="프랑스어" selected>프랑스어</option>';
             } else if(langKind == '스페인어') {
                strTemp += '<option value="스페인어" selected>스페인어</option>';
             } else if(langKind == '아랍어') {
                strTemp += '<option value="아랍어" selected>아랍어</option>';
             } else if(langKind == '러시아어') {
                strTemp += '<option value="러시아어" selected>러시아어</option>';
             } else if(langKind == '기타') {
                strTemp += '<option value="기타" selected>러시아어</기타>';
             }
              strTemp += '</select>';
              let langLevel = elements.langLevel;
              
              strTemp += '<select class="lang-select" name="languageVOList[${index}].langLevel">';
              if(langLevel == '상'){
                strTemp += '<option value="상" selected>상</option>';
             } else if(langLevel == '중') {
                strTemp += '<option value="중" selected>중</option>';
             } else if(langLevel == '하') {
                strTemp += '<option value="하" selected>하</option>';
             }
              strTemp += '</select></div></div>';
              strTemp += '<div class="lang-div-right">';
              
              let languageDTVOList = elements.languageDTVOList;
              
              languageDTVOList.forEach(function(languageDTVOList) {
                 strTemp += '<span></span>';
                 strTemp += '<div class="lang-det-div">';
                 strTemp += '<div class="flex" style="margin-bottom:12px">';
                 strTemp += '<div class="lang-det-div-left">';
                 strTemp += '<div class="lang-date-text">';
                 strTemp += '<p>취득일자</p>';
                 strTemp += '<p>만료일자</p> </div>';
                 strTemp += '<div class="group-date">';
                 
                 var acqDt = languageDTVOList.langDetailAcqDt;
                 var formattedDate9 = moment(acqDt).format('YYYY년 MM월 DD일');
                 
                 strTemp +=formattedDate9 + '<span>~</span>';
                 
                 var expDt =languageDTVOList.langDetailExpDt;
                 var formattedDate10 = moment(expDt).format('YYYY년 MM월 DD일');
                 
                 strTemp +=formattedDate10 +'</div></div>';
                 strTemp +='<div class="lang-det-div-right">';
                 strTemp +='<div>';
                 strTemp +='<input class="bold" type="text" value="'+languageDTVOList.langDetailScore+'"/></div>';
                 strTemp +='<div class="flexible_textarea">';
                 strTemp +='<textarea class="medit">' + languageDTVOList.langDetailName + '</textarea>';
                 strTemp +='</div></div></div></div></div>'
             
              })
          })
           
           openModal(strTemp);
        }
 
        });
        });
	// 모달 열기
	function openModal(content) {
	  document.getElementById('myModal').style.display = 'block';
	  document.getElementById('modalContent').innerHTML = content;
	}
	
	// 모달 닫기
	function closeModal() {
	  document.getElementById('myModal').style.display = 'none';
	}

// 	"모달 닫기" 버튼 또는 모달 외부 클릭 시 모달 닫기
	document.getElementsByClassName('close')[0].addEventListener('click', closeModal);
	window.addEventListener('click', function (event) {
		if (event.target == document.getElementById('myModal')) {
			closeModal();
		}
	});

</script>