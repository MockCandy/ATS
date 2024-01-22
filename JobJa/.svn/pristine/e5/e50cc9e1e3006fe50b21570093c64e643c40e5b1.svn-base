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
.mypage-aside-con{font-family: 'Noto Sans KR', sans-serif;}
.aside-name{padding-top:34px;}\
.mem-ul{display:flex; align-items:center;}
table .modaltable {
	border-collapse: collapse;
}

.thth ,.tdtd {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

.thth{
	background-color: #f2f2f2;
	
}

.naesajin {
  max-width: 150px;
  max-height: 150px;
  display: block;
  margin: 0 auto; /* 수평 가운데 정렬을 위해 추가 */
}

.modal-content {
	
	
	
}
.modal-footer{
	border-top:none;
	justify-content:center;
	width:100%;
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

.border-primary {
   --bs-border-opacity: 1; 
    border-color: rgba(var(--bs-primary-rgb), var(--bs-border-opacity)) !important;
}

.modaltable {
    margin-top: 20px; /* .modaltable 위쪽 여백 추가 */
}

#closeModal{
	margin-top: 7px;
}
.modal-body{
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

.card-tools{
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
   
  .questions{
  	margin-left: 22%;
  }
  
  .gogogo{
  	margin:auto;
  	padding:0 15px 15px 15px;
  }
  
  .save-buttons{
	    margin-left: 20px;
	    margin-right: 10px;
	    background-color: #329632;
	    color: white;
	    border-radius: 5px;
	    padding: 5px;
	}
  
  .note{
  	margin-left: 15px;
  }
  
  .cancel-buttonz{
  	margin-left: 80px;
	background-color: #EB3232;
    color: white;
    border-radius: 5px;
    padding: 5px;
    width: 70px;
  }
  
  .gogogos{
      margin-left: 60%;
  }
  
  .pagez {
	display: flex;
    justify-content: center;
    margin: 32px 0px;
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
  
  textarea[name="bltNotes"]{
  	width:100%;
  	resize:none;
  }
  
  .save-buttons, .cancel-button {
  	padding:5px 10px;
  }
	</style>

<div class="mypage-body-con">

	<div class="body-sub-con">
		<h1 class="admin-h1">블랙 리스트 관리</h1>
		<form:form modelAttribute="blackListVO" action="/admin/adminBlackListPage" method="post">
			
			<div class="card-tools mb-7" style="display: flex; align-items:flex-end; ">
				<h2>블랙리스트</h2>
				
				<p class="listCount ml-12">
					<strong>(${blackList})</strong>
				</p>
				<div class="serchbox ml-auto">
	               <input class="serch-input" placeholder="ID를 검색해주세요." type="text" name="memId" id="" value="" style="margin-left: auto;">
	               <button type="submit" class="btn btn-sm btn-secondary serch">검색</button>
	           </div>
			</div>
		</form:form>
		<div class="card-body table-responsive p-0">
			<table class="table table-striped table1 table-valign-middle">
				<thead>
					<tr>
						<th style="width: 12%;">블랙리스트번호</th>
						<th style="width: 12%;">블랙리스트ID</th>
						<th style="width: 15%;">등록일시</th>
						<th style="width: 10%;">해제여부</th>
						<th style="width: 15%;">해제날짜</th>
						<th style="width: 20%;">참고사항</th>
						<th style="">비고</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="blackListVO" items="${blackListVOList}" varStatus="stat">
						<tr>
							<td>${blackListVO.bltNo}</td>
							<td>${blackListVO.memId}</td>
							<td><fmt:formatDate pattern="yyyy년 MM월  dd일" value="${blackListVO.bltDt}"/></td>
							<td>${blackListVO.bltClrYn}</td>
							
							<c:choose>
								<c:when test="${blackListVO.bltClrDt== null}">
									<td>미예정</td>
								</c:when>
								<c:when test="${blackListVO.bltClrDt!= null}">
									<td data-date="<fmt:formatDate pattern="yyyy-MM-dd" value="${blackListVO.bltClrDt}"/>"><fmt:formatDate pattern="yyyy년 MM월  dd일" value="${blackListVO.bltClrDt}"/></td>
								</c:when>
							</c:choose>
							
							<td>
							<c:choose>
								<c:when test="${blackListVO.bltNotes == null}">
									<button class="black btn-sm bg-sig bltNoteRead inpBtn detailGo btn btn-success btn-free" data-bs-toggle="modal" data-bs-target=".notemodal">입력하기</button>	
									<input type="hidden" name="bltNo" value="${blackListVO.bltNo}">
								</c:when>
								<c:when test="${blackListVO.bltNotes != null}">
									<a href="#" class="black btn-sm detailbltNotes" data-bs-toggle="modal" data-bs-target=".detailmodal">상세보기</a>		
                					<input type="hidden" name="bltNotes" value="${blackListVO.bltNotes}" >				
								</c:when>
							</c:choose>
							</td>
							<td>
							
							<input type="hidden" class="bltNo" value="${blackListVO.bltNo}" />
							<input type="hidden" class="memberId" value="${blackListVO.memId}" />
							<button type="button" class="detailGo btn btn-sm btn-success btn-free" id="btn-free">해제</button>
							<button type="button" class="deleteGO btn btn-sm btn-danger btn-long" id="btn-long">기간연장</button></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pagez">${info.getPagingArea()}</div>
		</div>
	</div>
	</div>
	
	<div class="card">
	    <div class="modal fade notemodal" id="#disabledAnimation" tabindex="-1" aria-hidden="true" style="display: none;">
	        <div class="modal-dialog ">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title questions">참고사항을 작성해주세요</h5>
	                </div>
	                <div class="modal-footer naemo">
	                	<textarea rows="5" cols="50"  name="bltNotes"></textarea> 
	                </div>
	                <div class="gogogo">
	                	<input type="hidden" name="bltNo" id="hiddenInp" value="" >			
	                	<button type="button" class="save-buttons btn btn-sm">등록</button>
	                	<button type="button" class="cancel-button bg-red txt-white btn btn-sm" onclick="window.location.href='/admin/adminReportBlackListPage'">취소</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="card">
	    <div class="modal fade detailmodal" id="#disabledAnimation" tabindex="-1" aria-hidden="true" style="display: none;">
	        <div class="modal-dialog ">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title questionss">참고사항</h5>
	                </div>
	                <div class="modal-footers">
	                	
	                </div>
	                <div class="gogogos">
	                	<input type="hidden" name="repNo" id="hiddenInp" value="" >			
	                	<button type="button" class="cancel-buttonz bg-red txt-white btn btn-sm" onclick="window.location.href='/admin/adminReportBlackListPage'">나가기</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
		<div class="card">
	    <!-- 모달 시작 -->
	    <div class="modal fade" id="modalDelete" tabindex="-1" aria-hidden="true" style="display: none;">
	        <div class="modal-dialog modal-dialog-scrollable">
	            <div class="modal-content">
	             <div class="modal-header">
                      <h5 class="modal-title"><strong>회원 정보 삭제</strong></h5>
                     
                    </div>
	               <div class="modal-body">
					    <div class="warning-icon">
					        <i class="fa-solid fa-exclamation" style= "color:red;"></i>
					    </div>
					    <span>회원 정보를 삭제하시면 다시 복구할수 없습니다.</span><br>
					    <span>그래도 삭제하시겠습니까?</span>
					</div>
	                <div class="modal-footer">
	                    <button id="confirmDelete" type="button" class="btn btn-danger dd"  data-bs-dismiss="modal">
	                        삭제
	                    </button>
	                    <button id="closeModal" type="button" class="btn btn-secondary aa" data-bs-dismiss="modal">
	                        닫기
	                    </button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<sec:csrfInput />

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
	<script>
	
	$(".btn-long").on("click",function(e){
		
		var memberId = $(this).closest('tr').find('.memberId').val();
		var bltNo = $(this).closest('tr').find('td:nth-child(1)').text();
		var dateElement = $(this).closest('tr').find('td:nth-child(5)').data('date');
		
		Swal.fire({
		 	title: '기간 연장을 하시겠습니까?',
            text:  '기간은 일주일(7일)씩 연장됩니다',
            icon: 'question',
            showCancelButton: true, // cancel버튼 보이기
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#FF4040',
            confirmButtonText: '확인',
            cancelButtonText: '취소',
		 }).then(result => {
		 	
			 if (result.isConfirmed) { 
				 Swal.fire({
					 title: '기간이 연장되었습니다',
                     icon: 'success',
                     confirmButtonColor: '#0ABAB5',
                     confirmButtonText: '확인'
				 }).then(result => {
					 let data = {
	                           "memId" : memberId,
	                           "bltNo" :bltNo,
	                           "bltClrDt" : dateElement,
	                     };
					
					 $.ajax({
						 url:"/admin/updateBltClrDt",
                         contentType:"application/json;charset=utf-8",
                         data: JSON.stringify(data),
                         type:"post",
                         dataType:"json",
                         beforeSend:function(xhr){
                        	 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                         },
                         success: function(result) {
                        	 console.log(result);
                        	 window.location.href = "/admin/adminReportBlackListPage";
                         }
					 });
				 	})
			 }
		 });
		});
	
    $(".btn-free").on("click", function(e){
    	var memberId = e.target.previousElementSibling.value; 
    	var dateElement = $(this).closest('tr').find('td:nth-child(5)').data('date'); // 5번째 <td>의 span 요소를 찾음
    	var bltNo = $(this).closest('tr').find('td:nth-child(1)').text(); // 5번째 <td>의 span 요소를 찾음
    	
    	console.log("memId",memberId);
    	console.log("dateValue",dateElement);
    	console.log("bltNo",bltNo);
        
    	Swal.fire({
            title: '리스트에서 해제하시겠습니까?',
            text:  '',
            icon: 'question',
            showCancelButton: true, // cancel버튼 보이기
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#FF4040',
            confirmButtonText: '확인',
            cancelButtonText: '취소',
        }).then(result => {
           // 확인
            if (result.isConfirmed) { 
            	 Swal.fire({
                     title: '해제가 완료되었습니다',
                     icon: 'success',
                     confirmButtonColor: '#0ABAB5',
                     confirmButtonText: '확인'
                  }).then(result => {
                     let data = {
                           "memId" : memberId,
                           "bltClrDt" : dateElement,
                           "bltNo" :bltNo
                     };
                     console.log("ha",data);
                   		
                     $.ajax({
                         url:"/admin/updateMemState",
                         contentType:"application/json;charset=utf-8",
                         data: JSON.stringify(data),
                         type:"post",
                         dataType:"json",
                         beforeSend:function(xhr){
                        	 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                         },
                         success: function(result) {
                        	 console.log(result);
                        	 window.location.href = "/admin/adminReportBlackListPage";
                         }
           			});
            }); 
            
        }else if (result.isDismissed) {
            $("#createSchModal").modal("hide"); 
        }
      
    });		
    });	
		$(document).on("click", $(".inpBtn"), function(e){
			console.log(e.target.nextElementSibling);
			let bltNo = e.target.nextElementSibling.value;
			console.log(bltNo)
			$("#hiddenInp").val(bltNo);
		});
	
		$(document).ready(function() {
			$(document).on("click", $(".detailbltNotes"), function(e){
				
				let bltNotes = e.target.nextElementSibling.value;
				
				let cnt = '';
				
				cnt += '<p class="note">'+bltNotes+'</p>';
				
				$(".modal-footers").html(cnt);
			});
			
			
			$(".save-buttons").on("click",function(e){
				
				var noteContent = $(this).closest('.modal-content').find('textarea[name="bltNotes"]').val();
				console.log("zz",e.target);
				var bltNo = e.target.previousElementSibling.value;
				
				var data = {
					bltNotes : noteContent,
					bltNo :bltNo
				}
				
				$.ajax({
		        	url: "/admin/updateBlackListNote",
		            contentType: "application/json;charset=utf-8",
		            data: JSON.stringify(data),
		            type: "post",
		            dataType: "json",
		            beforeSend: function(xhr) {
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		            },
		            success: function(result) {
		            	window.location.href = "/admin/adminReportBlackListPage";
		            }
			});
		
		});
		
	});
	
	
</script>