<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.css">
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.min.js"></script>


<link rel="stylesheet" href="/resources/css/mypage.css"></link>

<div class="mypage-div">
	<div class="mypage-left">
		<div class="mypage-left-tit">계정</div>
		<ul>
			<li><a href="/entAccount/entmypage">프로필 설정</a></li>
			<li class="active"><a href="/entAccount/changePw">비밀번호 변경</a></li>
			
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<li><a href="/memberAccount/consultantApply">상담사 신청하기</a></li>
			</sec:authorize>
		</ul>
	</div>
	<div class="mypage-body-con">
		<div class="sub-title-area">
		   <div class="body-sub-title">
		      	비밀번호 변경
		   </div>
		</div>
	      
		<div class="body-sub-con">
			<div class="con-inner-body" >
				<div class="one-line" style="width:300px;">
					<p class="name-label">현재 비밀번호</p>
				             <input type="text" name="memNm" value="" class="pro-input-text" placeholder="비밀번호 입력" required="required">
				</div>
				<div class="one-line" style="width:300px;">
					<p class="name-label">새 비밀번호</p>
			             <input type="text" name="memNm" value="" class="pro-input-text" placeholder="비밀번호(10자리 이상)" required="required">
			             <input type="text" name="memNm" value="" class="pro-input-text" placeholder="비밀번호 확인" required="required">
				</div>
				
				<button class="btn bold" style="width:300px;">비밀번호 변경</button>
			</div>
		</div>
	</div>
</div>