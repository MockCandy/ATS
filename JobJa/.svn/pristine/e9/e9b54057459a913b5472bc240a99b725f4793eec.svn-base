<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/resources/css/boardQNA.css">

<style>
.reply-header{

	display:flex;
	align-items:center;
}
</style>

<div class="cen" style="margin: auto;">
	<div class="board-detail1">
		<div class="board-detail1-header">
			<p class="board-detail1-tit p-14 bold black mb-25 flex align-center">
				<span class="p-20">${boardQNAVO.boardTitle }</span> 
			<c:if test="${getCurrentLoginVO.memId==boardQNAVO.memId}">
					<a
						class="btn btn-sm ml-auto flex align-center btn-update"
						href="/boardQNA/update?boardId=${boardQNAVO.boardId }"> 수정 </a> <a
						class="btn btn-sm ml-7 flex align-center btn-red"
						href="/boardQNA/delete?boardId=${boardQNAVO.boardId }"> 삭제 </a>
				</p>
			</c:if>
			<p class="board-detail1-info flex align-center p-14 mb-25">
				<span class="cont-writer">${boardQNAVO.memId }</span> <span
					class="v-div-line"></span> <span class="cont-writer">${boardQNAVO.passedTime }</span>
				<span class="cont-writer ml-auto"><i
					class="fa-regular fa-eye"
					style="color: rgb(153, 153, 153); font-size: 12px; margin-right: 7px;"></i>조회수
					${boardQNAVO.boardCnt }</span>
			</p>

		</div>
		<c:if test="${not empty boardQNAVO.atchFileDetailVOList }">
			<div class="boardQNA-img-area">
				<img
					src="http://localhost/file/download.do?afId=${boardQNAVO.atchFileDetailVOList[0].afId }&afdSeq=${boardQNAVO.atchFileDetailVOList[0].afdSeq}">
			</div>
		</c:if>
		<p class="board-detail1-cont p-16">
		<pre>${boardQNAVO.boardCntnt }</pre>
		</p>
		<!-- 		<p> -->
		<%-- 			${likesVOList} --%>
		<!-- 		</p> -->
		<%-- 		${getCurrentLoginVO } --%>
		<!-- 		<p> -->
		<%-- 			'${getCurrentLoginVO.memId }' --%>
		<!-- 		</p> -->
		<%-- 		${fn:contains(likesVOList, getCurrentLoginVO.memId)} --%>

		<div class="mt-30 mb-30 t-center">
			<button
				class="btn board-like-btn 
			<c:if test = "${(not empty getCurrentLoginVO.memId) and fn:contains(likesVOList, getCurrentLoginVO.memId)}">
				active
			</c:if>
			">
				<i class="fa-solid fa-heart mr-5"></i> 공감 <span
					class="board-like-count bold">${boardQNAVO.boardLike }</span>
			</button>
		</div>

		<div class="h-div-line"></div>

		<p class="bold black p-16 mb-7">
			답변 <span id="reply-length">${fn:length(replyVOList) }</span>
		</p>

		<div class="reply-textarea mb-15">
			<textarea id="reply-cntnt" name="reply-cntnt" class="input01"></textarea>
			<div class="reply-btnArea flex">
				<button id="btn-reply-complete" class="btn ml-auto mr-15">자동완성</button>
				<button id="btn-reply-write" class="btn">등록</button>
			</div>
		</div>

		<div id="reply-box">
			<c:forEach var="replyVO" items="${replyVOList }">
				<div class="reply-item">
					<p class="reply-header mb-12">
						<span class="p-14">${replyVO.memId }</span> <span
							class="v-div-line"></span> <span class="p-14">${replyVO.passedTime }</span>
							
							<c:if test="${getCurrentLoginVO.memId == replyVO.memId }">
								<button type="button" class="ml-auto btn btn-ssm bg-red txt-white">삭제</button>
							</c:if>
							
					</p>
					<p class="reply-cont">${replyVO.replyCntnt }</p>
				</div>
			</c:forEach>
		</div>

	</div>

</div>
<script>
	$("#btn-reply-write").on("click", function() {

		let boardId = "${boardQNAVO.boardId}";
		let memId = "${getCurrentLoginVO.memId}";
		let replyCntnt = $("#reply-cntnt").val();
		let replyLength = $("#reply-length");

		console.log(boardId);
		console.log(memId);
		console.log(replyCntnt);

		if(memId == null || memId == ''){
			alert("댓글기능은 로그인 후 사용 가능합니다.");
			return;
		}
		
		if (replyCntnt == "" || replyCntnt == null) {
			alert("댓글을  입력해 주세요.");
			return;
		}

		let data = {
			"boardId" : boardId,
			"memId" : memId,
			"replyCntnt" : replyCntnt
		}

		$.ajax({

			url : "/boardQNA/ajaxWriteReply",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(res) {
				console.log(res);

				let replyBox = document.querySelector("#reply-box");

				$("#reply-cntnt").val("");

				let str = "";

				str += '<div class="reply-item">';
				str += '       <p class="reply-header mb-12">';
				str += '           <span class="p-14">' + memId + '</span>';
				str += '           <span class="v-div-line"></span>';
				str += '           <span class="p-14">1초전</span>';
				str += '			<button type="button" class="ml-auto btn btn-ssm bg-red txt-white">삭제</button>';
				str += '       </p>';
				str += '       <p class="reply-cont">';
				str += '			' + replyCntnt + '';
				str += '        </p>';
				str += '    </div>';

				console.log(str);

				console.log(res.length);
				replyLength.html(res.length);

				replyBox.insertAdjacentHTML("beforeend", str);

			}

		})

	})

	$(".board-like-btn").on("click", function(e) {
		
		if("${getCurrentLoginVO.memId}" == "" || "getCurrentLoginVO.memId" == null){
			alert("좋아요는 로그인 후 가능합니다.");
			return
		}
		
		console.log("${getCurrentLoginVO.memId}" == "");
		
		$(".board-like-btn")[0].classList.toggle("active");
		let cl = document.querySelector(".board-like-btn").classList;
		console.log(cl.contains("active"));
		let data = {
				boardId : "${boardQNAVO.boardId }",
				memId : "${getCurrentLoginVO.memId }"
		};
		console.log(data);
// 		if(cl.contains("active")){
			$.ajax({
				url:"/boardQNA/ajaxLikeUp",
				contentType : "application/json; charset=UTF-8",
				dataType:"json",
				data : JSON.stringify(data),
				type : "post",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(res) {
					console.log(res);
					console.log(typeof $(".board-like-count")[0].innerHTML);
					if(cl.contains("active")){
						$(".board-like-count").html(parseInt($(".board-like-count")[0].innerHTML) + 1)					
					}else{
	 					$(".board-like-count").html(parseInt($(".board-like-count")[0].innerHTML) - 1)
					}
				}
			})
// 		}else{
// 			$.ajax({
// 				url:"/boardQNA/ajaxLikeCancel",
// 				contentType : "application/json; charset=UTF-8",
// 				dataType:"json",
// 				data : JSON.stringify(data),
// 				type : "post",
// 				beforeSend : function(xhr) {
// 					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
// 				},
// 				success : function(res) {
// 					console.log(res.boardLike);
// 					$(".board-like-count").html(res.boardLike-1)
// 				}
// 			})
// 		}
	})
	
	
	$(document).on("click", "#btn-reply-complete", function() {
		
		
		$('textarea[name=reply-cntnt]').val(`
안녕하세요!

해당 회사의 연봉 수준에 대한 정보는 상당히 다양하게 변할 수 있습니다. 
특정 회사의 연봉 정보는 주로 직무, 경력, 지역, 회사 규모 등 다양한 요소에 따라 다르게 결정됩니다. 
그러므로 정확한 답변을 받기 위해서는 해당 회사에서 근무하시는 분들이나 혹은 관련 정보를 가진 사람들과 직접 대화하는 것이 가장 효과적일 것입니다.

또한, 제공하신 기술 스택과 경험에 대한 정보는 답변자가 연봉 추정에 도움을 줄 수 있는 중요한 자료입니다. 
더 구체적인 정보를 제공한다면, 유사한 경험을 가진 다른 개발자들이나 회사에서 일하는 분들이 도움을 줄 수 있을 것입니다.

여러분들의 경험을 공유해주시면 더욱 정확하고 유익한 답변을 받을 수 있을 것입니다. 감사합니다!
		`);
		
		console.log("ppwueifiwefwef");        reply-cntnt
		
	});
	
</script>
<script src="/resources/js/boardQNADetail.js"></script>