<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<link rel="stylesheet" href="/resources/css/admin.css">

<!-- Favicons -->
<link href="/resources/assets/img/favicon.png" rel="icon">
<link href="/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<!-- <link href="https://fonts.gstatic.com" rel="preconnect"> -->
<!-- <link -->
<!-- 	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" -->
<!-- 	rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
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

.goodsList {
    position: relative;
    width: 1070px;
    margin: 0 auto 30px 230px;
    margin-top: 5px;
    margin-bottom: 400px;
}

.goodsList h2 {
    margin: 0 0 7px;
    font-weight: bold;
    font-size: 19px;
    line-height: 1.2;
    letter-spacing: -0.1em;
    color: #000;
}
.goodsList p.listCount {
    position: absolute;
    top: 3px;
    left: 120px;
}
.goodsList .selectArea .listType {
    position: absolute;
    left: 0;
    top: 14px;
    display: block;
    width: auto;
    line-height: 14px;
    background: none;
}
.goodsList .selectArea {
    position: relative;
    padding: 7px 0;
    text-align: right;
    border-top: 2px solid #7b7b7b;
}

.goodsList .selectArea .listType a.on {
    padding-left: 15px;
    color: #000;
    background-position: -1366px -963px;
}
.goodsList .selectArea .listType a {
    display: inline-block;
    width: auto;
    height: 14px;
    padding: 0 0 0 12px;
    line-height: 14px;
    color: #959595;
    background: url(//image.alba.kr/e/goods/201505/goodsJob.png) no-repeat -1366px -982px;
}
thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.goodsList table tr th {
    padding: 10px 0;
    line-height: 1;
    color: #666a5b;
    background-color: #f2f2f2;
    border-bottom: 1px solid #b5b5b5;
}
th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
}

.goodsList .selectArea {
    position: relative;
    padding: 7px 0;
    text-align: right;
    border-top: 2px solid #7b7b7b;
}
table {
    border-collapse: separate;
    text-indent: initial;
    border-spacing: 2px;
    width: 1100px;
    margin-top: 50px;
}

.goodsList table tr td.local {
    padding-left: 15px;
    padding-right: 10px;
    line-height: 1.4;
    text-align: left;
    word-break: keep-all;
    width: 330px;
}

.goodsList table tr td {
    padding: 12px 0;
    line-height: 1;
    text-align: center;
    color: #474747;
    border-bottom: 1px solid #e4e4e4;
}

.goodsList table tr td.title {
    width: auto;
    text-align: left;
}

.goodsList table tr td.title a span.company {
    display: block;
    height: auto;
    padding: 2px 0 6px !important;
    font-size: 13px;
    background: none !important;
    color: #0075ab;
}

.goodsList .title a span {
    position: relative;
    overflow: hidden;
    display: inline-block;
    height: 20px;
    padding-right: 1px;
    line-height: 20px;
    vertical-align: top;
    cursor: pointer;
}

.goodsList table tr td.title span.funcBtn {
    position: relative;
    display: inline-block;
}
.goodsList .title a span {
    position: relative;
    overflow: hidden;
    display: inline-block;
    height: 20px;
    padding-right: 1px;
    line-height: 20px;
    vertical-align: top;
    cursor: pointer;
}

#NormalInfo table tr td.title {
	margin-top : 100px;
    width: auto;
}
.goodsList table tr td.title a.applBtn.scrap {
    background-position: -1300px -797px;
}
.goodsList table tr td.title a.applBtn {
    display: inline-block;
    width: auto;
    height: 16px;
    margin: 0;
    padding: 4px 15px 0 20px;
    font-size: 11px;
    letter-spacing: -1px;
    vertical-align: top;
    color: #888;
   }
.goodsList table tr td.title a {
    overflow: hidden;
    display: block;
    margin: 0 0 6px;
}
.goodsList .title a {
    text-decoration: none;
}
.funcBtn{
	height: 30px;
}
#quickView {
    width: 100%;
    margin: 0;
    padding: 0;
}
#quickView .previewInfo {
    overflow: hidden;
    padding: 20px;
}
#quickView .previewInfo .tableInfo {
    float: left;
    width: 57%;
}
#quickView .previewInfo .tableInfo table {
    table-layout: fixed;
    width: 100%;
    border-top: 1px solid #e0e0e0;
    border-left: 1px solid #e0e0e0;
    border-right: 1px solid #e0e0e0;
}
.rightInfo{
	margin-top: 60px;
}

.pagez {
	display: flex;
    justify-content: center;
    margin: 32px 0px;
    margin-left: 18%;
}

.pagez  li.is_active{
  font-weight: bold;
  border-bottom: 3px solid #2ecc71;
}
.pagez .pagination a{
  display: inline-block;
  color: #222;
}
.pagez .pagination ul{
  margin: 0;
  padding: 0;
  list-style-type: none;
  display:flex;
  justify-content: center;
}
.pagez.pagination{
  padding: 30px 0;
}

.pagez .paginate_button {
   margin:0 15px;
}

.pagez  .disabled {
    pointer-events : none;
    cursor:default;
}

.disabled>.page-link {
	background-color: transparent !important;
	border-color: transparent !important;
}

.page-link {
	border-color: transparent !important;
}
.card-tools{
	width: 100%;
	font-size: 20px;
}
.serchbox {
    display: flex;
    align-items: center;
}
.fontcolor{
	color:black !important;
}
.last{
	text-align: left;
}
.insert{
	margin-left: 85%;
	color: #777e8c !important;
	
}
.buttons{
	border-bottom-color: white !important; 
}
</style>

	<div class="sub-title-area alert alert-success alert-dismissible fade sho alert alert-success alert-dismissible fade show">
		<div class="body-sub-title card-title">게시판 관리 →
			<h3 class="card-title"
					>1:1 문의</h3>
		<hr class="title-hr" /></div>
	</div>
			<div class="card-header border-0">
			
				<div class="card-tools" style="display: flex; justify-content: space-between;">
                    <span></span>
			<div class="serchbox">
                <input class="search-input" placeholder="ID를 검색해주세요." type="text" name="memId" id="entNmInput" value="" style="margin-left: auto;">
				<a id="btnSearch" href="#" class="btn btn-secondary search">검색</a>
            </div>
				</div>
			</div>
	<div id="NormalInfo" class="goodsList goodsJob">
	<h2>1:1 문의</h2>
	<p class="listCount">
		<span></span> 총 <strong>${posibleBoardInquiryTotal}</strong> 건
	<p class="selectArea">
    <span class="listType">
            <a href="#" class="sortLink${info.sort == 'registration' or info.sort == null ? ' fontcolor' : ''}" id="registration" onclick="handleAndAnother('registration')">등록일순</a>
            <a href="#" class="sortLink${info.sort == 'deadline' ? ' fontcolor' : ''}" id="wait" onclick="handleAndAnother('wait')">답변대기</a>
            <a href="#" class="sortLink${info.sort == 'money' ? ' fontcolor' : ''}" id="posible" onclick="handleAndAnother('posible')">답변완료</a>
        </span>	
		<div class="one">
	<table class="" summary="일반 채용정보에 등록한 회사의 근무지, 업무내용, 회사명, 성별, 근무시간, 급여, 등록일 정보입니다.">
		<thead>
			<tr>
					<th style="width: 12%;">게시물ID</th>
					<th style="width: 12%;">게시물 제목</th>
					<th style="width: 12%;">게시물 내용</th>
					<th style="width: 12%;">작성자ID</th>
					<th style="width: 15%;">작성일시</th>
					<th style="width: 15%;">수정일시</th>
					<th style="width: 15%;">답변여부</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="boardInquiryVO" items="${posibleInquiryVOList}" varStatus="stat">

			<tr class="firstLine ">
				<td class="local first " scope="row">
					<div class="L_MyAd_maximumfitness"></div>
					${boardInquiryVO.boardId}
				</td>
				
				<td class="title">
				  ${boardInquiryVO.boardTitle}   
				</td>
				
				<c:choose>
					<c:when test="${boardInquiryVO.boardCntnt != null}">
						<td><a href="/boardInquiry/detail?boardId=${boardInquiryVO.boardId}">내용보기</a></td>
					</c:when>
				</c:choose>
				<td>
					${boardInquiryVO.memId}  
				</td>
				<td class="regDate last"><fmt:formatDate pattern="yyyy년  MM월 dd일"
											value="${boardInquiryVO.wirtDt}" /></td>
				<td class="regDate last"><fmt:formatDate pattern="yyyy년  MM월 dd일"
											value="${boardInquiryVO.boardUpdtDt}" /></td>
				
				<c:choose>
					<c:when test="${boardInquiryVO.boardAdminAnswer != null}">
						<td style="color: green;">답변완료</td>
							<td class="buttons"style="white-space: nowrap;">
								
								<button type="button" class="inpBtn btn btn-success" data-bs-toggle="modal" data-bs-target=".modalrewrite">수정</button>
								<input type="hidden" class="boardIdd" value="${boardInquiryVO.boardId}">
								<button type="button" class="deleteGO btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalDelete">삭제</button></td>
					</c:when>
					
					<c:when test="${boardInquiryVO.boardAdminAnswer == null}">
						<td><a href="#" class="
" style="color: red;" data-bs-toggle="modal" data-bs-target=".modalDialogScrollable">답변작성하기</a>
						<input type="hidden" class="boardIdd" value="${boardInquiryVO.boardId}"></td>
					</c:when>
				</c:choose>
			</tr>

		</c:forEach>
		</tbody>
	</table>
</div>
		<div class="pagez">${info.getPagingArea()}</div>
</div>

<div class="card">
	    <!-- 모달 시작 -->
	    <div class="modal fade modalDialogScrollable" id="modal" tabindex="-1" aria-hidden="true" style="display: none;">
	        <div class="modal-dialog modal-dialog-scrollable">
	            <div class="modal-content">
	             <div class="modal-header">
                      <h5 class="modal-title"><strong>답변을 작성해주세요</strong></h5>
                     
                    </div>
	               <div class="modal-body">
					    <div class="warning-icon">
					        <textarea class="textareaa" rows="20" cols="60"></textarea>
					    </div>
					    
					</div>
	                <div class="modal-footer">
	                	<input type="hidden" name="boardId" class="hiddenInp" value="" >
	                    <button id="confirmDelete" type="button" class="btn btn-success dd"  data-bs-dismiss="modal">
	                        등록
	                    </button>
	                    <button id="closeModal" type="button" class="btn btn-secondary aa" data-bs-dismiss="modal">
	                        닫기
	                    </button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="card">
	    <!-- 모달 시작 -->
	    <div class="modal fade modalrewrite" id="modal" tabindex="-1" aria-hidden="true" style="display: none;">
	        <div class="modal-dialog modal-dialog-scrollable">
	            <div class="modal-content">
	             <div class="modal-header">
                      <h5 class="modal-title"><strong>수정할 답변을 작성해주세요</strong></h5>
                     
                    </div>
	               <div class="modal-body">
					    <div class="warning-icon">
					        <textarea class="textareaaa" rows="20" cols="60"></textarea>
					    </div>
					    
					</div>
	                <div class="modal-footer">
	                	<input type="hidden" name="boardId" class="hiddenInp" value="" >
	                    <button id="confirmDelete" type="button" class="btn btn-success ddd"  data-bs-dismiss="modal">
	                        등록
	                    </button>
	                    <button id="closeModal" type="button" class="btn btn-secondary aa" data-bs-dismiss="modal">
	                        닫기
	                    </button>
	                </div>
	            </div>
	        </div>
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
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- Template Main JS File -->
	<script src="/resources/js/main.js"></script>

	<script src="/resources/js/admin.js"></script>
<script type="text/javascript">


function handleAndAnother(sortType){
	 handleSort(sortType);
}



function handleSort(sortType) {
	console.log(sortType);

	
    if (sortType === 'wait') {
        window.location.href = '/admin/waitList?sort=wait';
    } else if (sortType === 'posible') {
    	window.location.href = '/admin/posibleList?sort=posible';
    }else{
    	console.log(encodeURIComponent(sortType));
    	 window.location.href = '/admin/adminBoardInquiry';
    }
}

document.addEventListener('DOMContentLoaded', function() {
  
	$(".deleteGO").on('click',function(e){
		let boardId = e.target.previousElementSibling.value; 
		console.log("삭제",boardId);
		
		data={
			"boardId":boardId
		}
		 $.ajax({
			 url: "/admin/deleteBoardInquiry",
             contentType: "application/json;charset=utf-8",
             data: JSON.stringify(data),
             type: "post",
             dataType: "json",
             beforeSend: function(xhr) {
                 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
             },
             success: function(result) {
            	 
             }
		 });
	});
    
    $('#btnSearch').on('click', function(){
    	let keyword = $('.search-input').val();
    	
    	window.location.href = '/admin/adminBoardInquiry?keyword='+keyword;
    });
    
    $('.dd').on("click",function(e){
    	let boardAnswer = $('.textareaa').val();
    	let boardId = e.target.previousElementSibling.value;
    	
    	console.log("boardAnswer",boardAnswer);
    	console.log("boardId",boardId);
    	
    	data ={
    		"boardId":boardId,
    		"boardAdminAnswer":boardAnswer
    	}
    	
    	  $.ajax({
    		  url: "/admin/updateBoardInquiry",
              contentType: "application/json;charset=utf-8",
              data: JSON.stringify(data),
              type: "post",
              dataType: "json",
              beforeSend: function(xhr) {
                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
              },
              success: function(result) {
            	  window.location.href="/admin/adminBoardInquiry";
              }
    	  });
    });
    
    $('.ddd').on("click",function(e){
    	let boardAnswer = $('.textareaaa').val();
    	let boardId = e.target.previousElementSibling.value;
    	
    	console.log("boardAnswer",boardAnswer);
    	console.log("boardId",boardId);
    	
    	data ={
    		"boardId":boardId,
    		"boardAdminAnswer":boardAnswer
    	}
    	
    	$.ajax({
    	    url: "/admin/updateBoardInquiry",
    	    contentType: "application/json;charset=utf-8",
    	    data: JSON.stringify(data),
    	    type: "post",
    	    dataType: "json",
    	    beforeSend: function(xhr) {
    	        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    	    },
    	    success: function(result) {
    	        Swal.fire({
    	            title: '성공적으로 변경했습니다',
    	            text:  '',
    	            icon: 'success',
    	            showCancelButton: false, 
    	            confirmButtonColor: '#0ABAB5',
    	            cancelButtonColor: '#FF4040',
    	            confirmButtonText: '확인',
    	            cancelButtonText: '취소',
    	        });
    	    }
    			}).then((result) => {
	    	    	if (result.isConfirmed) {
	    	        	window.location.href="/admin/adminBoardInquiry";
	    	    }
    			});
    	  });
    });


$(document).on("click", $(".inpBtn"), function(e){
	console.log(e.target);
	let boardId =e.target.nextElementSibling.value;
	
	console.log("boardIdzzz",boardId);
	
	$(".hiddenInp").val(boardId);
	
});
</script>