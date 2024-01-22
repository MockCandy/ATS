<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- lecture CSS 파일 링크 -->
<link rel="stylesheet" type="text/css" href="/resources/css/lecture.css">

<style>

.selectJob {
	margin-bottom: 10px;
	margin-top: 10px;
}

#uploadFile {
	margin-bottom: 10px;
	margin-top: 10px;
}

</style>

<div class="lectureCen">
	<div class="lectureBoard">
		<h1 class="lecture-main-tit">강의 클래스 수정</h1>
		<div class="lec-h-div-line"></div>
		<form id="frm" class="pd-20" name="frm" action="/boardClass/updatePost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
			<p> <input type="hidden" name="boardId" value="${brdClassVO.boardId}" /> </p>
			<p class="cls-tit"> 클래스 제목</p>
			<p> <input type="text" id="boardTitle" name="boardTitle" value="${brdClassVO.boardTitle}" /> </p>
			<p class="cls-tit"> 회사명 | 날짜 </p>
			<p> <input type="text" id="boardCntnt" name="boardCntnt" value="${brdClassVO.boardCntnt}" /> </p>
			<p class="cls-tit"> 연결 링크 입력 </p>
			<p> <input type="text" id="classUrl" name="classUrl" value="${brdClassVO.classUrl}" /> </p>
			
			<p class="cls-tit"> 직군선택 </p>
			<p> <select name="jobCategoryCd" class="selectJob">
					<c:forEach var="comInfoVOList" items="${comCodeInfoVOList}">
						<option value="${comInfoVOList.comCd}" <c:if test ="${comInfoVOList.comCd eq brdClassVO.jobCategoryCd}">selected="selected"</c:if> 
						>${comInfoVOList.comCdNm}</option>
					</c:forEach>
				</select>
			</p>
			<div style="flex-wrap: wrap;" class="mb-15">
					<p class="cls-tit"> 첨부파일 선택 </p>
					<input type="file" id="uploadFile" name="uploadFile" multiple />
					<br />
						<c:forEach var="fileVO" items="${brdClassVO.atchFileVO.atchFileDetailVOList}">
							<img src="/resources/upload/${fileVO.afdSaveNm}" alt="" width="70%" style="margin-top: 20px; ">
						</c:forEach>
			</div>
			
			<p>
				<button type="submit" class="list-btn btn btn-sm">등록</button>
				<button type="reset" class="list-btn btn btn-sm">초기화</button>
				<button onclick="location.href='/boardClass/list'" class="list-btn btn btn-sm">목록 </button>
			</p>
			
			<sec:csrfInput />
		</form>
	</div>
</div>

<script src="/resources/js/boardClassCreate.js"></script>
