
$(function(){
   	
		 $(".jobList").on("click", function() {

			var jobCategoryCd = $(this).data('value');
			
	        $.ajax({
	        	// cateCd로 controller에서 받아?옴
	            url: "/boardClass/listAjax?cateCd=" + jobCategoryCd,
				contentType: "application/json; charset=utf-8",
				type: "GET",
				dataType:'json',
		      	beforeSend : function(xhr) {
	                  xhr.setRequestHeader(
	                        "${_csrf.headerName}",
	                        "${_csrf.token}");
	            },
	            success: function(response) {
	            	/* 
	            	response : ArticlePage<BoardClassVO>
	            	*/
	                console.log("response : "+JSON.stringify(response));
	            	
	            	let str = "";

	            	//response.content : List<BoardClassVO> 
	            	$.each(response.content,function(idx,boardClassVO){
	            		str += "<div class='outer-container'>";
	            		str += `<div class='content-lecture-item' data-boardId="\${boardClassVO.boardId}">`;
	            		str += "<div class='content-lecture-img'>";
	            		if(boardClassVO.atchFileDetailVOList.length>0){//첨부파일이 있을 때만 처리
		            		str += "<a href='"+boardClassVO.classUrl+"' target='_blank'>";
		            		str += "<img src='/resources/upload/"+boardClassVO.atchFileDetailVOList[0].afdSaveNm+"' alt=''></a>";
	            		}
	            		str += "</div>";
	            		str += "<div class='content-lecture-cont'>";
	            		str += "<strong class='content-lecture-tit'>"+boardClassVO.boardTitle+"</strong>";
	            		str += "<p class='content-lecture-nmdt'>";
	            		str += "<span class='content'>"+boardClassVO.boardCntnt+"</span></p></div>";
	            		str += "<div style='display: flex; justify-content: center; margin-top: 20px;' class='update_delete_btn'>";
	            		str += "<button class='update-button' onclick='clickUpdateBtn('${brdclsVO.boardId}')'>수정</button>";
	                    str += `<button class="delete-button" onclick="clickedDeleteBtn('\${boardClassVO.boardId}')">삭제</button>`;
	            		str += "</div></div></div>";
	            		
// 	               		str += `<div class='lecture-page mt-15 mb-15'> \${data.getPagingArea2()} </div>`;
	            		
	            	});
	            	
 	            	$(".content-lecture-box").html(str);
 	            	
 					$(".lecture-page").html(response.pagingArea2);
	    	    },
	            error: function(xhr, status, error) {
	                // 오류 처리
	                console.error("전송실패", status, error);
	            }
	        });
	    });
	});

function clickedDeleteBtn(boardId){
	
	var delconfirm = confirm("삭제 하시겠습니까?");
	
	if(delconfirm) {
		location.href="/boardClass/delete?boardId=" + boardId;
	} else {
		alert("삭제 취소");
	}
}

function clickUpdateBtn(boardId) {
	
	location.href="/boardClass/update?boardId=" + boardId;
}