<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.css">
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.min.js"></script>

<!-- PortOne SDK -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- 결제 API위한 js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>



<div class="mypage-div">
	<div class="mypage-left">
		<div class="mypage-left-tit">프리미엄</div>
		<ul>
			<li><a href="/memberPremium/consultantLog">상담 내역</a></li>
			<li class="active"><a href="/memberPremium/items">상품 목록</a></li>
			<li><a href="/memberPremium/payitems">결제 목록</a></li>
		</ul>
	</div>
	
	<div class="mypage-body-con">
		
	   <div class="sub-title-area">
			<div class="body-sub-title">상담 상품 목록</div>
	   </div>
			
		<div class="body-sub-con">
			<p class="body-sub-con-tit p-14">
				<span class="p-18 mr-3 txt-skyblue bold">상담 상품 광고</span>
				전문적인 상담사와의 상담으로 여러분의 미래를 컨설팅하세요
			</p>
			
			<div class="item-list">
				<c:forEach var="consultVO" items="${consultItemVOList}">
					<div class="item">
						<div class="item-top">
							<p class="bold p-22">${consultVO.itemNm}</p>
							<p class="bold p-22 txt-red ml-auto">
							<fmt:formatNumber value="${consultVO.itemSalePrice}" pattern="#,###" />
							<span class="p-15 txt-black ml-5">원</span></p>
						</div>
						<div class="item-bot">
							<div>
								<p class="p-14 mr-5 mb-7">
									<span class="badge badge-nm bg-skyblue txt-skyblue">혜택</span>
									${consultVO.itemIntrcn} 
								</p>
								<p class="p-14 mr-5">
									<span class="badge badge-nm" style="background-color:#fff;border:1px solid #ddd">가격</span>
										<span class="bold">
											<fmt:formatNumber type="number" maxFractionDigits="0">${consultVO.itemSalePrice / consultVO.itemCount}</fmt:formatNumber>
										</span>원 / 회
								</p>
							</div>
							<div class="ml-auto">
								<button class="btn btn-sm bg-blue color-white item-pay-btn" data-itemSalePrice="${consultVO.itemSalePrice}" data-itemNo="${consultVO.itemNo}"  data-itemcd="${consultVO.itemCd}" data-memid="${consultVO.memId}" data-itemnm="${consultVO.itemNm}" value="1">카드 결제</button>
								<button class="btn btn-sm bg-yellow bold color-kakao item-pay-btnk" data-itemSalePrice="${consultVO.itemSalePrice}" data-itemNo="${consultVO.itemNo}" data-itemcd="${consultVO.itemCd}" data-memid="${consultVO.memId}" data-itemnm="${consultVO.itemNm}" value="2">카카오 결제</button>
								<input type="hidden" class="itemNo" value="${consultVO.itemNo}">
								<input type="hidden" id="itemCd" value="${consultVO.itemCd}">
								<input type="hidden" id="itemClCd" value="${consultVO.itemClCd}">
								<input type="hidden" id="itemCount" value="${consultVO.itemCount}">
								
							</div>
						</div>
					</div>
				</c:forEach>
					<input type="hidden" id="memId" value="${memberVO.memId}">
					<input type="hidden" id="memNm" value="${memberVO.memNm}">
					<input type="hidden" id="memEmail" value="${memberVO.memEmail}">
					<input type="hidden" id="memAddr" value="${memberVO.memAddr}">
					<input type="hidden" id="memPostno" value="${memberVO.memPostno}">
					<input type="hidden" id="memTel" value="${memberVO.memTel}">
					<input type="hidden" id="conMemId" value="${conMemId}">
			</div>
		</div> <!-- end body sub con -->
	</div><!-- end body -->
		

</div>

	
<script>


/* 이니시스 연결하는 것. 삭제 */

function requestPay(merchant,itemNo,itemSalePrice) {
	
	var memId = document.getElementById("memId").value;
    var memEmail = document.getElementById("memEmail").value;
    var memAddr = document.getElementById("memAddr").value;
    var memPostno = document.getElementById("memPostno").value
    var memNm = document.getElementById("memNm").value
    var memTel = document.getElementById("memTel").value
    var itemCd = document.getElementById("itemCd").value
    var itemCount = document.getElementById("itemCount").value
    
 	if(itemNo === 'PDCNO001'){
    	
    	var remndrCnt =3;
    
    }else if(itemNo === 'PDCNO002'){
    	
    	var remndrCnt =5;
    
    }else{
    	
    	var remndrCnt =10;
    
    }
    var conMemId = document.getElementById("conMemId").value
    
    
    
	
	console.log(memId);
	
	IMP.request_pay({
		pg : "html5_inicis",
		pay_method : "card",
		merchant_uid :merchant.merchant_uid, // 상품 고유 아이디로 입력을 하셔야 합니다.
		name : merchant.name,
		amount : merchant.amount,
		buyer_email : memEmail,
		buyer_name : memNm,
		buyer_tel : memTel,
		buyer_addr : memAddr,
		buyer_postcode : memPostno,
	}, function(rsp) {
		//       callback
		//       rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
		console.log("rsp", rsp);
		if (rsp.success) {
			alert("결제가 완료 되었습니다.");
			
			let originalString = merchant.merchant_uid;
			
			let parts = originalString.split('_'); 
			let itemCompanyNo = parts[1]; 
			
			data ={
					"itemCompanyNo" : itemNo,
					"payUserId" : memId,
					"payMethod": "card",
					"payRemndrCnt" : remndrCnt,
					"payConId" : conMemId,
					"payRemndrCnt" : itemCount,
					"payAmount" : itemSalePrice
				}
			console.log("itemCompanyNo",itemCompanyNo);
			$.ajax({
				 url:"/consult/insertPayment",
                 contentType:"application/json;charset=utf-8",
                 data: JSON.stringify(data),
                 type:"post",
                 dataType:"json",
                 beforeSend:function(xhr){
                	 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                 },
                 success: function(result) {
                	 
                 }
			});
			
		}

	});
}


function requestPayk(merchant,itemNo,itemSalePrice) {
	
	var memId = document.getElementById("memId").value;
    var memEmail = document.getElementById("memEmail").value;
    var memAddr = document.getElementById("memAddr").value;
    var memPostno = document.getElementById("memPostno").value
    var memNm = document.getElementById("memNm").value
    var memTel = document.getElementById("memTel").value
    var itemCd = document.getElementById("itemCd").value
    var itemCount = document.getElementById("itemCount").value
    
	
    console.log("itemNo",itemNo);
    
 	if(itemNo === 'PDCNO001'){
    	
    	var remndrCnt =3;
    
    }else if(itemNo === 'PDCNO002'){
    	
    	var remndrCnt =5;
    
    }else{
    	
    	var remndrCnt =10;
    
    }
    var conMemId = document.getElementById("conMemId").value
	
    console.log("conMemId",conMemId);
    console.log("merchant.merchant_uid", merchant.merchant_uid);
	IMP.request_pay({
		pg : "kakaopay.TC0ONETIME",
		pay_method : "card",
		merchant_uid : merchant.merchant_uid, // 상품 고유 아이디로 입력을 하셔야 합니다.
		name : merchant.name,
		amount : merchant.amount,
		buyer_email : memEmail,
		buyer_name : memNm,
		buyer_tel : memTel,
		buyer_addr : memAddr,
		buyer_postcode : memPostno,
	}, function(rsp) {
		//       callback
		//       rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.

		if (rsp.success) {
			alert("결제가 완료 되었습니다.");
			
			let originalString = merchant.merchant_uid;
			
			let parts = originalString.split('_'); 
			let itemCompanyNo = parts[1]; 
			
			data ={
					"itemCompanyNo" : itemNo,
					"payUserId" : memId,
					"payMethod": "KAKAOQR",
					"payRemndrCnt" : remndrCnt,
					"payConId" : conMemId,
					"payRemndrCnt" : itemCount,
					"payAmount" : itemSalePrice
				}
			console.log("itemCompanyNo",itemCompanyNo);
			$.ajax({
				 url:"/consult/insertPayment",
                 contentType:"application/json;charset=utf-8",
                 data: JSON.stringify(data),
                 type:"post",
                 dataType:"json",
                 beforeSend:function(xhr){
                	 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                 },
                 success: function(result) {
                	 
                 }
			});
			
		}

	});
}



$(document).ready(function() {

	$(".item-pay-btn").on("click", function(e) {

		let year = new Date().getFullYear();
		let month = ('0' + (new Date().getMonth() + 1)).slice(-2);
		let day = ('0' + new Date().getDate()).slice(-2);
		let hour = ('0'+new Date().getHours()).slice(-2);
		let minute = ('0'+new Date().getMinutes()).slice(-2);
		
		const dateStr = year +  "" + month + "" + day + "" + hour + "" + minute;
		
		let itemCd = $(this).data("itemcd");
		let memId = $(this).data("memid");
		let itemNm = $(this).data("itemnm");
		let itemNo = $(this).data("itemno");
		let itemSalePrice = $(this).data("itemsaleprice");
		
		alert(itemNm);
		
		if (confirm("상품을 구매 하시겠습니까?")) {

			// 년 + 월 + 일 + 상품고유아디디 + _로그인아이디
			// 20231230_1_heebang
			
			let merchant = {
				merchant_uid : dateStr + "_" + itemCd + "_" + memId, // 상품 고유 아이디로 입력을 하셔야 합니다.
				name : itemNm,
				amount : 1,
			};

			requestPay(merchant,itemNo,itemSalePrice);

		} else {

			alert("구매가 취소되었습니다.");
		}

	});
	
	$(".item-pay-btnk").on("click", function(e) {

		let year = new Date().getFullYear();
		let month = ('0' + (new Date().getMonth() + 1)).slice(-2);
		let day = ('0' + new Date().getDate()).slice(-2);
		let hour = ('0'+new Date().getHours()).slice(-2);
		let minute = ('0'+new Date().getMinutes()).slice(-2);
		
		const dateStr = year +  "" + month + "" + day + "" + hour + "" + minute;
		
		let itemCd = $(this).data("itemcd");
		let memId = $(this).data("memid");
		let itemNm = $(this).data("itemnm");
		let itemNo = $(this).data("itemno");
		let itemSalePrice = $(this).data("itemsaleprice");
		
		alert(itemNm);
		
		if (confirm("상품을 구매 하시겠습니까?")) {

			// 년 + 월 + 일 + 상품고유아디디 + _로그인아이디
			// 20231230_1_heebang
			
			let merchant = {
				merchant_uid : dateStr + "_" + itemCd + "_" + memId, // 상품 고유 아이디로 입력을 하셔야 합니다.
				name : itemNm,
				amount : 1,
			};

			requestPayk(merchant,itemNo,itemSalePrice);

		} else {

			alert("구매가 취소되었습니다.");
		}

	});

});
</script>