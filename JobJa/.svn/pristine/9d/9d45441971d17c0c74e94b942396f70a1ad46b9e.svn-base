<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.css">
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.min.js"></script>
<!-- PortOne SDK -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- 결제 API위한 js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<style>
.modal-title{
   text-align: center;
   font-size: 24px;
   font-weight: 800;
}
#modal-custom{
	max-width: 640px !important;
}
.iziModal-wrap{
	width: 240px;
}
.modal-con{
	padding: 20px;
}
.btn-parent{
	display: flex;
	justify-content: flex-end;
	padding-right: 24px;
	padding-bottom: 24px; 
}
.payment-modal-inner{
	margin-bottom: 24px;
}
</style>

<div class="mypage-body-con">
	<div class="sub-con-area">
		<div class="body-sub-title">기업 상품 목록</div>
		<hr class="title-hr"/>
	</div>
	<div class="body-sub-con">
		<p class="body-sub-con-tit p-14">
			<span class="p-18 mr-3 txt-skyblue bold">배너광고</span>
			메인화면의 배너에 광고가 띄워집니다!
		</p>
		
		<div class="item-list">
			<c:forEach var="bitemVO" items="${banneritemVOList}">
				<div class="item">
					<div class="item-top">
						<p class="bold p-22">${bitemVO.itemNm}</p>
						<p class="bold p-22 txt-red ml-auto">
						<fmt:formatNumber value="${bitemVO.itemSalePrice}" pattern="#,###" />
						<span class="p-15 txt-black ml-5">원</span></p>
					</div>
					<div class="item-bot">
						<div>
							<p class="p-14 mr-5 mb-7">
								<span class="badge badge-nm bg-skyblue txt-skyblue">혜택</span>
								${bitemVO.itemIntrcn}
							</p>
							<p class="p-14 mr-5">
								<span class="badge badge-nm" style="background-color:#fff;border:1px solid #ddd">가격</span>
									<span class="bold">28,571</span>원 / 일
							</p>
						</div>
						<div class="ml-auto">
							<button class="btn btn-sm bg-blue color-white item-pay-btn" 
							data-itemcd="${bitemVO.itemCd}" data-memid="${getCurrentLoginVO.memId}" 
							data-itemnm="${bitemVO.itemNm}" data-mememail="${getCurrentLoginVO.memEmail}" data-itemno="${bitemVO.itemNo}"
							data-price="${bitemVO.itemSalePrice}"
							>상품 결제</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<p class="body-sub-con-tit p-14 mt-30">
			<span class="p-18 mr-3 txt-skyblue bold">채용공고 상위노출</span>
			채용공고 목록에서 해당 기업의 공고가 상위 노출됩니다!
		</p>
		
			<div class="item-list">
				<c:forEach var="ritemsVO" items="${recruitItemVOList}">
					<div class="item">
						<div class="item-top">
							<p class="bold p-22">${ritemsVO.itemNm}</p>
							<p class="bold p-22 txt-red ml-auto">
							<fmt:formatNumber value="${ritemsVO.itemSalePrice}" pattern="#,###" />
							<span class="p-15 txt-black ml-5">원</span></p>
						</div>
						<div class="item-bot">
							<div>
								<p class="p-14 mr-5 mb-7">
									<span class="badge badge-nm bg-skyblue txt-skyblue">혜택</span>
									${ritemsVO.itemIntrcn}
								</p>
								<p class="p-14 mr-5">
									<span class="badge badge-nm" style="background-color:#fff;border:1px solid #ddd">가격</span>
										<span class="bold">17,142</span>원 / 일
								</p>
							</div>
							<div class="ml-auto">
								<button class="btn btn-sm bg-blue color-white item-pay-btn" 
								data-itemcd="${ritemsVO.itemCd}" data-memid="${getCurrentLoginVO.memId}" 
								data-itemnm="${ritemsVO.itemNm}"data-mememail="${getCurrentLoginVO.memEmail}" data-itemno="${ritemsVO.itemNo}"
								data-price="${ritemsVO.itemSalePrice}"
								>상품 결제</button>
							</div>
						</div>
					</div>
				</c:forEach>
				
			</div><!-- end item list -->
			
			<!-- 기업회원Id -->
			<input type="hidden" value="${memberVO.memId}" name="memId">
			<!-- 전화번호 -->
		 	<input type="hidden" value="${memberVO.memTel}" name="memTel">
			<!-- 기업회사 이름 -->
		 	<input type="hidden" value="${memberVO.entNm}" name="entNm">
		 	<!-- 기업회원 사업자 번호 -->
		 	<input type="hidden" value="${memberVO.entNo}" name="entNo">
		 	<!-- 기업 주소1 -->
		 	<input type="hidden" value="${memberVO.entAddr} ${memberVO.entAddr2}" name="entAddr">
		 	<!-- 기업 우편번호 -->
		 	<input type="hidden" value="${memberVO.entPostNo}" name="entPostNo">
		 	<!-- 기업회사 사장이름 -->
		 	<input type="hidden" value="${memberVO.entCeoNm}" name="entCeoNm">
		 	
		 	
		 	
		</div> <!-- end body sub con -->
		
		
		<div id="modal-custom">
	        <button data-izimodal-close="" class="icon-close"></button>
	        <p class="modal-title">광고에 사용할 배너 이미지를 등록해주세요.</p>
	          <div class="modal-con">
	          	
	          	<div class="payment-modal-inner">
	          		<div>규격 : 가로 1060px x 세로 200px</div>
	          	</div>
	          	<div id="tab1-2">
					<input type="file" id="uploadFile" name="uploadFile" multiple/>
				</div>
	          	
	          </div><!-- end modal-con -->
	      
	        <div class="btn-parent">
	           <button  class="btn-sm btn-write btn" id="modal-submit-btn">확인</button>
	        </div>
		</div>
		
		
		</div>
		
		