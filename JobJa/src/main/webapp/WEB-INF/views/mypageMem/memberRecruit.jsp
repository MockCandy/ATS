<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/resume.css">
<link rel="stylesheet" href="/resources/css/mypage.css"></link>
<style>

.recruit-main-box{
    margin: 24px 36px 0px 12px;
	display:grid;
	grid-template-columns: 33.33% 33.33% 33.33%;
	gap : 20px;
}
.recruit-inner-box{
	background-color: white;
    height: 260px;
	padding: 20px 30px;
	border: 1px solid #cccc;
	cursor:pointer;
}
.recruit-inner-box:hover{
	background-color: #fcfcfc;
}
.recruit-inner-header{
	display: flex;
	justify-content: space-between;
}
.recruit-inner-header a{
	display:inline-block;
	width: 170px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    word-break: break-all;
}
.recruit-inner-body{
	margin-top: 24px;
}
.in-header-title{
	font-size: 22px;
	font-weight: 600;
	
}
.recruit-inner-sub{
	font-size: 12px;
	padding-top: 6px;
}
.sub-padding-top{
	padding-top: 16px;
}
.body-sub-con{
	height: 700px;
	overflow-y: scroll; 
}
.recruit-inner-title{
	font-size: 18px;
	font-weight: 600;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    word-break: break-all;
}
.selected{
	color: #859484 !important;
}
</style>
<div class="mypage-div">
	<div class="mypage-left">
		<div class="mypage-left-tit">관심정보</div>
		<ul>
			<li><a href="/memberInterest/myEnterpriseList">관심 기업</a></li>
			<li class="active"><a href="/memberInterest/myRecruit">관심 채용공고</a></li>
		</ul>
	</div>
	
	<div class="mypage-body-con">
		<div class="sub-title-area">
			<div class="body-sub-title">
				스크랩 채용공고
			</div>
		</div>
		<div class="body-sub-con">
			<div class="recruit-main-box">
				<c:forEach var="recruitVO" items="${data}">
					<div class="recruit-inner-box">
						<input type="hidden" value="${recruitVO.recruitNo}" class="recruitNo"/>
						<div class="recruit-inner-header">
							<span class="in-header-title"><a href="/recruit/${recruitVO.recruitNo}/detail">${recruitVO.recruitTitle}</a></span>
							<i class="fa-solid fa-bookmark mark-i" style="color: #6cea8b;"></i>
							<input type="hidden" value="${recruitVO.recruitNo}" class="recruitNo"/>
						</div>
						<div class="recruit-inner-body">
							<p class="recruit-inner-title">${recruitVO.enterpriseVO.entNm}</p>
							<p class="recruit-inner-sub">${recruitVO.recruitWork}</p>
							<p class="recruit-inner-sub">${recruitVO.recruitQlf}</p>
							<p class="recruit-inner-sub">${recruitVO.recruitSkill}</p>
						</div>
						<div class="recruit-inner-footer">
							<p class="recruit-inner-sub sub-padding-top">${recruitVO.recruitCareer}</p>
						    <p class="recruit-inner-sub">
						    <fmt:formatDate value="${recruitVO.recruitStdt}" pattern="yyyy-MM-dd"/> ~
						    <fmt:formatDate value="${recruitVO.recruitEddt}" pattern="yyyy-MM-dd"/>
						    </p>
						</div>
					</div>
				</c:forEach>
			</div>		
			<div class="pagez">
             	${info.getPagingArea()}
            </div>
			
		</div>
	</div>
</div>




<script type="text/javascript">
$(document).ready(function() {
		
	$(document).on('click','.mark-i',function(e){
		
		console.log(e.target);
		console.dir(e.target.nextElementSibling.value);
		
		let recruitNo = e.target.nextElementSibling.value;
		
		let data = {"recruitNo": recruitNo};
		
		if($(this).hasClass('selected')) {
	        $(this).removeClass('selected'); // 이미 선택된 경우 클래스 제거
	        	
	        $.ajax({
	        	url: '/memberInterest/ajaxinsertRecruit',
	        	contentType: "application/json;charset=utf-8",
	        	dataType: 'json',
				type: 'post',
				data : JSON.stringify(data),
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(rst){
					console.log("다시 들어감")
				},
				error:function(xnr,status,error){
					console.log('Error:', xhr, status, error);
				}
	        });
	        
	        
	    } else {
	    	
	        $(this).addClass('selected'); // 선택되지 않은 경우 클래스 추가
	        
	        $.ajax({
				url: '/memberInterest/ajaxdeleteRecruit',
				contentType : "application/json;charset=utf-8",
				dataType: 'json',
				type: 'post',
				data : JSON.stringify(data),
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(rst){
					console.log("삭제 됨");
				},
				error:function(xhr, status, error){
					console.log('Error:', xhr, status, error);
					
				}
				
			});
	        
	    }
		
	});

});

</script>
