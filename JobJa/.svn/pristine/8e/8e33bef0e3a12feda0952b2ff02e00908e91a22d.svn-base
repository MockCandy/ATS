<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/resources/css/mypage.css"></link>
<style>
body {
	background-color: #fff;
	color: #333;
}

hr {
	border: 1px solid #4CAF50; /* 초록색 선의 스타일 설정 */
	margin: 20px 0; /* 선의 위아래 여백 설정 */
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

.notice-table {
	width: 90%
}

.container {
	/*  	max-width: 80%;  */
	/* 	margin: 20px auto; */
	background-color: #fff;
	padding: 20px;
	margin: 56px auto 80px auto;
	width: 960px;
}

.notice {
	margin-top: 20px;
	padding-top: 20px;
}

.notice-date {
	font-size: 0.9em;
}

.notice-table {
	margin-right: 5%;
	text-align: center;
	padding: 10px;
	border-bottom: 1px solid #8FBC8F;
}


.notice-category {
	display: inline-block;
	margin-right: 5px;
}

.notice-link {
	text-decoration: none;
	color: #333;
	font-weight: 500;
}

.notice-link:hover {
	color: #41A541;
}

.notice-icon {
	color: #41A541;
	margin-left: 5px;
}

.notice-highlight {
	color: #41A541;
	font-weight: bold;
}

.title {
	display: inline-block;
	color: #444;
	font-size: 32px;
	font-weight: normal;
	letter-spacing: -4px;
	line-height: 36px;
	vertical-align: top;
}

.middle-tit {
	margin-bottom: 20px;
	margin-left: 20px;
}

.searchTypeBox {
	display: flex;
    justify-content: flex-end;
}

.
#content {
	margin: 56px auto 80px auto;
	width: 960px;
}

.trNum {
	color: #329632;
}

.notice-tit {
	padding: 14px; 10px;
}

.list-btn {
	font-size: 14px;
	background-color: #0000;
	border-radius: 15px;
	cursor: pointer;
}


.paging-in-ul {
	display: flex;
	justify-content: center;
	margin: 30px;
}

.paging-in-li {
	margin-right: 10px;
}

.not-search{
	display: flex;
	align-items:flex-end;
}

.not-keyword {
    border: 1px solid rgb(212, 212, 212);
    cursor: pointer;
    padding: 5px;
}

.not-search-btn {
    cursor: pointer;
}
.not-keyword:focus {
	 border: 1px solid green;
	 outline: none;
}

.not-search-btn:hover {
	border: 1px solid green;
}

.not-keyword:hover {
	 border: 1px solid green;
 }
 
 .notice-mid-tit {
    display: flex;
    justify-content: space-around;
}

.sub-title {
    display: flex;
}

body {
	background-color:#f0f0f0;
}
</style>
<div class="cen pt-25">
	<div class="mypage-div">
		<div class="mypage-left">
			<div class="mypage-left-tit">고객센터</div>
			<ul>
				<li class="active"><a href="/noticeBoard/list">공지사항</a></li>
				<li><a href="/boardInquiry/list">1:1 문의사항</a></li>
				
			</ul>
		</div>
		<div class="mypage-body-con">
			<div class="sub-title-area">
			   <div class="body-sub-title">
			      	공지사항
			   </div>
			</div>
		      
			<div class="body-sub-con">
				
				<form class="not-search mb-7">
				<sec:authorize access="hasRole('ROLE_ADMIN')">		
					<button type="button" onclick="location.href='/noticeBoard/create'" class="btn btn-sm bg-sig txt-white">공지등록</button>
				</sec:authorize>
					<input class="not-keyword ml-auto" type="text" placeholder="검색어를 입력하세요" name="keyword" value="${keyword}" />
					<button class="not-search-btn btn btn-search" type="submit"></button>
				</form>
					
				
				<table class="table1">
					<colgroup>
						<col width="20%">
						<col width="60%">
						<col width="20%">
					</colgroup>
					<thead>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
					</thead>
					<tbody>
					<c:forEach var="noticeVO" items="${data.content}">
						<tr class="notice-cntnt">
							<td>${noticeVO.rnum}</td>
							<td><a href="/noticeBoard/detail?boardId=${noticeVO.boardId}">${noticeVO.boardTitle}</a></td>
							<td><fmt:formatDate value="${noticeVO.boardWritingDt}" pattern="yyyy.MM.dd" /></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				
				<div class="pagez">${data.getPagingArea4()}</div>
			</div>
		</div>
	</div>
</div>


