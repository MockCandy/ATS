<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.table-wrap{
	display: flex;
	justify-content: center;
}
.mypage-sub-title{
	font-size: 24px;
	margin-bottom: 24px;
}
.mypage-table {
    border-collapse: collapse;
    width: 100%;
/*     border-radius: 20px; */
    overflow: hidden;
}
.mypage-table th, .mypage-table td {
    padding: 16px;
    border-bottom: 1px solid #ddd;
}
.mypage-table thead {
    background-color: #f7f7f7;
}
.mypage-table thead tr td {
 	text-align: center;
}
.mypage-table tbody tr:nth-child(even) {
    background-color: #fbfbfb;
}
.mypage-table tbody tr:hover {
    background-color: #ddd;
}
.mypage-table td:first-child {
    text-align: center;
    width: 80px; 
}
.mypage-table th:nth-child(2),
.mypage-table td:nth-child(2) {
  	width: 400px;
}
.mypage-table th:nth-child(3),
.mypage-table td:nth-child(3) {
  	width: 24px; 
  	text-align: center;
}
.mypage-table th:nth-child(4),
.mypage-table td:nth-child(4) {
  	width: 24px; 
  	text-align: center;
}
.mypage-table th:nth-child(5),
.mypage-table td:nth-child(5) {
  	width: 160px; 
  	text-align: center;
}
.mypage-table th:nth-child(6),
.mypage-table td:nth-child(6) {
  	width: 160px; 
  	text-align: center;
}
.sub-con-title{
	font-size: 18px;
}
.my-sub-board-btn{
	background-color: #fff;
	border: none;
	cursor: pointer;
	font-size: 16px;
	
}
#QNAList{
	margin-left:16px;
	margin-right: 16px;
}
.fa-regular{
	margin-right: 4px;
}
.replytable th:nth-child(2),
.replytable td:nth-child(2) {
	width: 400px !important;
}
.replytable th:nth-child(3),
.replytable td:nth-child(3) {
	width: 160px !important;
}
.replytable th:nth-child(4),
.replytable td:nth-child(4) {
	width: 160px !important;
}
.reply-inner-list{
	text-align: left !important;
}
.selected {
	color: #6d82f3 !important;
}
</style>


<div class="mypage-div">
	<div class="mypage-left">
		<div class="mypage-left-tit">활동내역</div>
		<ul>
			<li><a href="/memberMyActivity/myBoardInquiry">일대일 문의</a></li>
			<li class="active"><a href="/memberMyActivity/myBoardQNA">취업 Q&A</a></li>
			<li><a href="/memberMyActivity/myEntReview">기업리뷰</a></li>
			<li><a href="/memberMyActivity/consultantReview">상담리뷰</a></li>
			<li><a href="/memberMyActivity/counselOffer">상담사회원 신청 내역</a></li>
			<li><a href="/memberMyActivity/reportOffer">신고 신청 내역</a></li>
		</ul>
	</div>
	
	<div class="mypage-body-con">
		<div class="sub-title-area">
			<div class="body-sub-title">
				취업 Q&A 활동내역
				<span>
					<a id="QNAList" class="my-sub-board-btn">
						<i class="fa-regular fa-circle-check" style="color: #6e7581;"></i>게시글 목록
					</a>
				</span>
				<span>
					<a id="replyList" class="my-sub-board-btn">
						<i class="fa-regular fa-circle-check" style="color: #6e7581;"></i>댓글 목록
					</a>
				</span>
			</div>
		</div>
			
		<div class="body-sub-con">
			<div class="table-wrap">
				<table class="table1">
					<colgroup>
						<col width="15%">
						<col width="auto">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th><i class="fa-regular fa-eye" style="color: #444;"></i></th>
							<th><i class="fa-regular fa-heart" style="color: #444;"></i></th>
							<th>작성자</th>
							<th>작성날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="myBoardQNA" items="${data}" varStatus="stat">
							<tr>
								<td>${stat.count}</td>
								<td class="talign-left"><a href="/boardQNA/detail?boardId=${myBoardQNA.boardId}">${myBoardQNA.boardTitle}</a></td>
								<td>${myBoardQNA.boardCnt}</td>
								<td>${myBoardQNA.boardLike}</td>
								<td>${myBoardQNA.memId}</td>
								<td><fmt:formatDate value="${myBoardQNA.boardWritingDt}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="pagez">
             ${info.getPagingArea()}
            </div>
			
			
		</div>
	</div>
</div>

<script>
$(function(){
	
	$('#QNAList').addClass('selected');
	$('#QNAList').find('i').addClass('selected');
	
	// 댓글목록 버튼 누를 시
	$(document).on('click', '#replyList', function(){
		
		$('#QNAList').removeClass('selected');
		$('#QNAList').find('i').removeClass('selected');
		$(this).addClass('selected');
		$(this).find('i').addClass('selected');
		
		$.ajax({
			url: '/memberMyActivity/ajaxmyBoardQNAReply',
			type: 'post',
			dataType: 'json',
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				
				console.log('가져온 댓글목록 : ', rst);
				
				let cont = `
					<div class="table-wrap">
					<table class="table1 replytable">

						<colgroup>
							<col width="15%">
							<col width="auto">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>댓글 내용</th>
								<th>작성자</th>
								<th>작성날짜</th>
							</tr>
						</thead>
						<tbody>
				`;
				
				$.each(rst.content, function(index, replyVO){
					cont += '<tr>';
					cont += '<td>'+(index+1)+'</td>';
					cont += '<td class="reply-inner-list"><a href="/boardQNA/detail?boardId='+replyVO.boardId+'">'+replyVO.replyCntnt+'</a></td>';
					cont += '<td>'+replyVO.memId+'</td>'
					
					// 날짜 포맷 변환
				    let date = new Date(replyVO.replyWritingDt);
				    let formattedDate = date.getFullYear() + '-' + ('0' + (date.getMonth() + 1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2);
					
				    cont += '<td>'+formattedDate+'</td>';
					cont += '</tr>';
				});
				
				cont += `</tbody>
						</table>
					</div>`;
					
				cont += `
					<div class="pagez">
		             ${info.getPagingArea()}
		            </div> 
		         `;
					
				$('.body-sub-con').html(cont);
			},
			error: function(){
				
			}
		});
	});
	
	// 게시글목록 버튼 누를 시
	$(document).on('click', '#QNAList', function(){
		
		$('#replyList').removeClass('selected');
		$('#replyList').find('i').removeClass('selected');
		$(this).addClass('selected');
		$(this).find('i').addClass('selected');
		
		$.ajax({
			url: '/memberMyActivity/ajaxmyBoardQNAList',
			type: 'post',
			dataType: 'json',
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				
				console.log('가져온 글목록 start: ', rst);
				
				let cont = `
					<div class="table-wrap">
					<table class="table1">
						<colgroup>
							<col width="15%">
							<col width="auto">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th><i class="fa-regular fa-eye" style="color: #444;"></i></th>
								<th><i class="fa-regular fa-heart" style="color: #444;"></i></th>
								<th>작성자</th>
								<th>작성날짜</th>
							</tr>
						</thead>
						<tbody>
				`;
				
				$.each(rst.content, function(index, boardQNAVO){
					
					console.log("boardQNAVO" , boardQNAVO);
					
					cont += '<tr>';
					cont += '<td>'+(index+1)+'</td>';
					cont += '<td class="talign-left"><a href="/boardQNA/detail?boardId='+boardQNAVO.boardId+'">'+boardQNAVO.boardTitle+'</a></td>';
					cont += '<td>'+boardQNAVO.boardCnt+'</td>';
					cont += '<td>'+boardQNAVO.boardLike+'</td>';
					cont += '<td>'+boardQNAVO.memId+'</td>';
					
					// 날짜 포맷 변환
				    let date = new Date(boardQNAVO.boardWritingDt);
				    let formattedDate = date.getFullYear() + '-' + ('0' + (date.getMonth() + 1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2);
					
				    cont += '<td>'+formattedDate+'</td>';
				    cont += '</tr>';
				});
				
				cont += `</tbody>
						</table>
					</div>`;
					
				cont += `
					<div class="pagez">
		             ${info.getPagingArea()}
		            </div>
				`;
					
				$('.body-sub-con').html(cont);
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
				
			}
		});
	});

});
</script>
