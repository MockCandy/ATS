<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- <link rel="stylesheet" href="/resources/css/news.css"> -->
<link rel="stylesheet" href="/resources/css/recruit.css">



<form:form modelAttribute="recruitFormVO" action="/recruit/createPost" method="post" enctype="multipart/form-data">
<div class="biz-regist biz-regist--recruit cen" id="RecruitInfo">
<input type="hidden" name="recruitNo">
<input type="hidden" name="recruitStdt">
<!-- <input type="hidden" name="recruitAfId"> -->
         <h2 class="main-h1">모집내용 </h2>
         <fieldset class="biz-regist__area">
            <table class="biz-regist__field bizCdA bizCdC" cellspacing="0" summary="구인공고 등록시 모집내용 입력단입니다">
               
               <tbody>
               <tr>
                  <th scope="row" class="biz-regist__field-item bizCdA1">채용 공고 썸네일 <span class="biz-regist__field-required"></span></th>
                  <td class="biz-regist__field-content">
                     <input class="btn-upload" type="file" name="recruitVO.UploadFile1" id="file" onchange="previewFile()" multiple="multiple" />
                     <div id="file-preview" class="mt-2"></div>
                  </td>
               </tr>
               <br>
               <tr id="trComnmGuide">
                  <th scope="row" class="biz-regist__field-item bizCdA1">공고제목 <span class="biz-regist__field-required">필수</span></th>
                  <td class="biz-regist__field-content">
                     <input type="text" value="" name="recruitVO.recruitTitle" id="title" class="aa" onfocus="setTextField(this, '공고 제목을 입력해 주세요');checkTextNum(this,42,'spantxttitle')" maxlength="49" onkeyup="_commonctrl.chkSpecial({id:'title', msg1:'공고 제목에는 허용된 특수문자( ? - + ( )[ ] % &amp; , . ㈜ ㈔ \' / )\n외에는 입력 불가합니다.'}); checkTextNum(this,42,'spantxttitle'); fnPreviewTitle();_registctrl.isValidityTitle(); getRecomJobKind();" placeholder="공고 제목을 입력해 주세요">
                     <span class="biz-regist__word-count"><strong id="spantxttitle">0</strong>/50자</span>
                     
                  </td>
               </tr>
               
               <tr>
                  <th scope="row" class="biz-regist__field-item bizCdA1">공고내용 <span class="biz-regist__field-required">필수</span></th>
                  <td class="biz-regist__field-content">
                     <textarea  name="recruitVO.recruitCntnt" style="height: 600px; width: 800px;" placeholder="공고 내용을 입력해 주세요"></textarea>
                  </td>
               </tr>
               
               
               
               <tr>
                  <th scope="row" class="biz-regist__field-item bizCdA1">첨부 파일 <span class="biz-regist__field-required"></span></th>
                  <td class="biz-regist__field-content">
                     <input class="btn-uploadz" type="file" name="recruitVO.uploadFile" id="file" onchange="previewFile2()" multiple="multiple" />
                     <div id="file-preview2" class="mt-2"></div>
                  </td>
               </tr>
   
               <tr>
                  <th scope="row" class="biz-regist__field-item bizCdD4">근무지위치 </th>
                  <td class="biz-regist__field-content biz-regist__field-content--pay">
                     <div id="map" style="width:100%;height:350px;" ></div>
                          <input class="btn" type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="margin-left: 10px;">
                     <input class="input01" type="text" name="recruitVO.recruitLocation" id="postcode" placeholder="우편번호">
                     <input class="input01" type="text" name="recruitVO.recruitLocation" id="address" placeholder="주소"><br>
                         <input class="input01" type="text" name="memAddr2" id="detailAddress" placeholder="상세주소">
                     
<!--                      <div id="map" style="width:100%;height:350px;"> -->
<!--                         <input type="text" name=""> -->
<!--                      </div> -->
   
                  </td>
               </tr>
               
               <tr>
                  <th scope="row" class="biz-regist__field-itemz biz-regist__input-text ">주요 업무 <span class="biz-regist__field-required">필수</span></th>
                  <td class="biz-regist__field-content">
                     <input type="text" class="tag_input" onkeydown="handleEnter3(event)" name="recruitWorks"
                     value="" id="recruitWorks">
                     <input type="hidden" name="recruitVO.recruitWork" id="recruitWork" value="">
					<span class="biz-regist__word-count"><strong id="spantxttitle">한줄씩 입력하고 Enter키를 눌러주세요</span>
                  	<div class="tag_group">
						<div id=wordContainer3></div>
					</div>
                  </td>
               </tr>
               
               <tr>
                  <th scope="row" class="biz-regist__field-itemz biz-regist__input-text ">구인 파트 <span class="biz-regist__field-required">필수</span></th>
                  <td class="biz-regist__field-content">
                     <input type="text" name="recruitVO.recruitPart" class="aa">
                  </td>
               </tr>
               
               <tr>
                  <th scope="row" class="biz-regist__field-item bizCdC1">직군 <span class="biz-regist__field-required">필수</span></th>
                  <td class="biz-regist__field-content biz-regist__field-content--jobkind">
                     <select  name="recruitVO.recruitOtt" id="comCd">
                        <option  value="" selected>직군을 선택해주세요</option>
                           <c:forEach var="comCodeInfoVOList" items="${recruitFormVO.comCodeInfoVOList}" varStatus="stat">
                              <option class="selectjobjob" value="${comCodeInfoVOList.comCd}">${comCodeInfoVOList.comCdNm}</option>
                           </c:forEach>
                     </select>
                  </td>
                  
               </tr>
               <tr>
                  <th scope="row" class="biz-regist__field-item bizCdC1">직업 <span class="biz-regist__field-required">필수</span></th>
                  <td class="biz-regist__field-content biz-regist__field-content--jobkind">
                     <select id="chart1" name="recruitVO.recruitJob" id="comDetCd">
                        <option  value="" selected>직업을 선택해주세요</option>
                           
                     </select>
                  </td>
               </tr>
               <tr id="trHireTypeGuide">
                  <th scope="row" class="biz-regist__field-item bizCdC2">고용형태 <span class="biz-regist__field-required">필수</span></th>
                  <td class="biz-regist__field-content biz-regist__field-content--hiretype">
                     <div class="biz-regist__wrap">
                        <span class="biz-regist__inputbox">
                           <input type="radio" class="biz-regist__input" name="recruitVO.recruitWorkType" id="chkhiretype1" value="IWS01001">
                           <label for="chkhiretype1" class="biz-regist__label" >비정규직</label>
                        </span>
                        <span class="biz-regist__inputbox">
                           <input type="radio" class="biz-regist__input" name="recruitVO.recruitWorkType" id="chkhiretype2" value="IWS01002">
                           <label for="chkhiretype2" class="biz-regist__label">정규직</label>
                        </span>
                        <span class="biz-regist__inputbox">
                           <input type="radio" class="biz-regist__input" name="recruitVO.recruitWorkType" id="chkhiretype3"  value="IWS01003">
                           <label for="chkhiretype3" class="biz-regist__label">프리랜서</label>
                        </span>
                        <span class="biz-regist__inputbox">
                           <input type="radio" class="biz-regist__input" name="recruitVO.recruitWorkType" id="chkhiretype8"  value="IWS01004">
                           <label for="chkhiretype8" class="biz-regist__label">파견직</label>
                        </span>
                        <span class="biz-regist__inputbox">
                           <input type="radio" class="biz-regist__input" name="recruitVO.recruitWorkType" id="chkhiretype4"  value="IWS01005">
                           <label for="chkhiretype4" class="biz-regist__label">교육생/연수생</label>
                        </span>
                        <span class="biz-regist__inputbox">
                           <input type="radio" class="biz-regist__input" name="recruitVO.recruitWorkType" id="chkhiretype6" value="IWS01006">
                           <label for="chkhiretype6" class="biz-regist__label">인턴직</label>
                        </span>
                        
                     </div>
                  </td>
               </tr>
               
               
               <tr>
                  <th scope="row" class="biz-regist__field-item bizCdC3">모집인원 <span class="biz-regist__field-required">필수</span></label></th>
                  <td class="biz-regist__field-content biz-regist__field-content--recruitnum">
                     <div class="biz-regist__wrap">
                        <span class="biz-regist__input-wrapper">
                           <input name="recruitVO.recruitCount" type="number" class="biz-regist__input-writenum" size="5" placeholder="000" name="recnum4_input" id="recnum4_input" maxlength="3" style="ime-mode:disabled">
                           <label for="recnum4_input" class="biz-regist__label-writenum">명</label>
                        </span>
                     </div>
                  </td>
               </tr>
               
               
               
         
            <tr id="trPayGuide">
               <th scope="row" class="biz-regist__field-item bizCdD4">연봉 <span class="biz-regist__field-required">필수</span></th>
               <td class="biz-regist__field-content biz-regist__field-content--pay">
                  <div class="biz-regist__wrap">
                     
                     <input type="number" name="recruitVO.recruitSalary" class="biz-regist__input-text " size="13" name="pay" id="pay" maxlength="9">
                     <span class="biz-regist__space" id="labelWon">원</span>
                  </div>

               </td>
            </tr>

            <tr>
               <th scope="row" class="biz-regist__field-item bizCdD5">혜택 및 복지</th>
               <td class="biz-regist__field-content biz-regist__field-content--welfare">
                  <div id="welfareOptionBox">
                     <div id="LayerWelfare">
                        <div class="select-detail">   
                           <div class="select-detail__title">      
                              <span class="biz-regist__inputbox">         
                                    <label for="welfare-title1" class="biz-regist__label">4대보험</label>      
                              </span>
                           </div>   
                           <div class="select-detail__contents">
                               <form:checkbox path="benCd" label="국민연금" value="BNF01001" />
                               
                               <form:checkbox path="benCd" label="건강보험" value="BNF01002" />
                               
                               <form:checkbox path="benCd" label="고용보험" value="BNF01003" />
                               
                               <form:checkbox path="benCd" label="산재보험" value="BNF01004" />
                            </div>
                         </div>
                      <div class="select-detail">   
                         <div class="select-detail__title">
                            <span class="biz-regist__inputbox">   
                               <label for="welfare-title2" class="biz-regist__label ">휴일제도</label>      
                            </span>   
                         </div>   
                         <div class="select-detail__contents"> 
                            <form:checkbox path="benCd" label="연차" value="BNF01005" />
                            
                            <form:checkbox path="benCd" label="월차" value="BNF01006" />
                            
                            <form:checkbox path="benCd" label="정기휴가" value="BNF01007" />
                            
                            <form:checkbox path="benCd" label="포상휴가" value="BNF01008" />
                         </div>
                      </div>
                      
                      <div class="select-detail">
                         <div class="select-detail__title">
                            <span class="biz-regist__inputbox">
                                  <label for="welfare-title3" class="biz-regist__label">수당제도</label>
                            </span>   
                         </div>   
                         <div class="select-detail__contents">
                                <form:checkbox path="benCd" label="성과급" value="BNF01009" />
                                
                                <form:checkbox path="benCd" label="경조금" value="BNF01010" />
                                
                                <form:checkbox path="benCd" label="정기보너스" value="BNF01011" />
                                
                                <form:checkbox path="benCd" label="퇴직금" value="BNF01012" />
                                
                                <form:checkbox path="benCd" label="주휴수당" value="BNF01013" />
                                
                                <form:checkbox path="benCd" label="초과근로수당" value="BNF01014" />
                                
                                <form:checkbox path="benCd" label="야간근로수당" value="BNF01015" />
                                
                                <form:checkbox path="benCd" label="휴일근로수당" value="BNF01016" />
                                
                                <form:checkbox path="benCd" label="퇴직연금" value="BNF01017" />
                              </div>
                         </div>
                         
                         <div class="select-detail bizazz">   
                               <div class="select-detail__title">      
                                  <span class="biz-regist__inputbox">         
                                        <label for="welfare-title4" class="biz-regist__label">기타<br> 복리후생</label>
                                  </span>   
                               </div>   
                         <div class="select-detail__contents"> 
                                <form:checkbox path="benCd" label="식비(식사) 지원" value="BNF01018" />
                                
                                <form:checkbox path="benCd" label="교통비 지원" value="BNF01019" />
                                
                                <form:checkbox path="benCd" label="건강검진" value="BNF01020" />
                                
                                <form:checkbox path="benCd" label="기숙사" value="BNF01021" />
                                
                                <form:checkbox path="benCd" label="통근버스운행" value="BNF01022" />
                                
                                <form:checkbox path="benCd" label="휴게시간" value="BNF01023" />
                                
                                <form:checkbox path="benCd" label="차량유지비" value="BNF01024" />
                                
                                <form:checkbox path="benCd" label="자녀학자금" value="BNF01025" />
                            </div>
                            </div>
                        </div>
                      </div>
               </td>
            </tr>
            <tr>
               <th scope="row" class="biz-regist__field-item bizCdE3">학력</th>
               <td class="biz-regist__field-content biz-regist__field-content--jobkind">
                  <select name="recruitVO.recruitAcdmCr" id="educonst">
                     <option value="" selected>학력선택을 해주세요</option>
                     <c:forEach var="comCodeAb" items="${recruitFormVO.comCodeAb}">
                        <option value="${comCodeAb.comDetCd}">${comCodeAb.comDetCdNm}</option>
                     </c:forEach>
                  </select>
               </td>
            </tr>
            
            
            
            
            
            <tr>
               <th scope="row" class="biz-regist__field-item bizCdD4">경력 </th>
               <td class="biz-regist__field-content biz-regist__field-content--pay">
                  <div class="biz-regist__wrap">
                     <input type="text" name="recruitVO.recruitCareer">
                     <span class="biz-regist__word-count"> 입력양식 : <strong id="spantxttitle">ex)경력무관,n년차이상</strong></span>
                  </div>

               </td>
            </tr>
            
            <tr id="trPayGuide">
               <th scope="row" class="biz-regist__field-item bizCdD4">필요기술 <span class="biz-regist__field-required">필수</span></th>
               <td class="biz-regist__field-content biz-regist__field-content--pay">
                     <input type="text" name="recruitSkills" class="tag_input" onkeydown = "handleEnter4(event)" value="" id="recruitSkills">
					 <input type="hidden" name="recruitVO.recruitSkill" id="recruitSkill" value="">    
					 <span class="biz-regist__word-count"><strong id="spantxttitle">한줄씩 입력하고 Enter키를 눌러주세요</span>          
                 <div class="tag_group">
                 	<div id =wordContainer4></div>
                 </div>

               </td>
            </tr>
            
               <th scope="row" class="biz-regist__field-item bizCdD4">직급 </th>
               <td class="biz-regist__field-content biz-regist__field-content--pay">
                  <select name="recruitVO.recruitLevel" id="educonst">
                     <option value="" selected>채용원하는 직급을 선택해주세요</option>
                     <c:forEach var="comCodeAd" items="${recruitFormVO.comCodeAd}">
                        <option value="${comCodeAd.comDetCd}">${comCodeAd.comDetCdNm}</option>
                     </c:forEach>
                  </select>
               </td>
               
            </tr>
               
               <tr>
						<th scope="row" class="biz-regist__field-itemz biz-regist__input-text ">우대사항</th>
						<td class="biz-regist__field-content">
							<input type="text" class="tag_input" onkeydown ="handleEnter2(event)" name="recruitPrefers"
							value="" id="recruitPrefers">
							<input type="hidden" name="recruitVO.recruitPrefer" id="recruitPrefer" value="" >
							<span class="biz-regist__word-count"><strong id="spantxttitle">한줄씩 입력하고 Enter키를 눌러주세요</span>
							<div class="tag_group">
								<div id=wordContainer2></div>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row" class="biz-regist__field-item bizCdA1">자격요건</th>
						<td class="biz-regist__field-content">
							<input type="text" class="tag_input" onkeydown="handleEnter(event)"
							name = "recruitQlfs" value="" id="recruitQlfs">
							<input type="hidden" name="recruitVO.recruitQlf" id="recruitQlf" value="">
							<span class="biz-regist__word-count"><strong id="spantxttitle">한줄씩 입력하고 Enter키를 눌러주세요</span>
							<div class="tag_group">
								<div id="wordContainer"></div>
<!-- 							<textarea name="recruitVO.recruitQlf" style="height: 150px; width: 600px;" ></textarea> -->
							</div>
							</td>
					</tr>
            
                  <tr>
                  <td>

                     <input type="hidden" name="recruitVO.entNo" value="${recruitFormVO.entNo}">
                  </td>
                  </tr>
            

               
         
<!-- 기존의 날짜 입력 필드 -->
<tr>
    <th id="thModifyItemF1" class="biz-regist__field-item bizCdF1">모집마감일 </th>
    <td class="biz-regist__field-content biz-regist__field-content--deadline">
       
       <span class="biz-regist__inputbox">
         <input type="radio" class="biz-regist__input" name="recruitVO.recruitEddt" id="permanentRecruitmentButton" value="9999-12-31">
         <label for="chkhiretype6" class="biz-regist__label">상시채용</label>
      </span>
       
        <div class="biz-regist__wrap">
            <span class="biz-regist__inputbox">
                <input type="date" name="recruitVO.recruitEddt" id="select_recruitdaily" class="biz-regist__input" value="" onfocus="$('#recruitstart_guide').show();" onclick="viewApplicationLimit();setApplicationLimitUI();_registctrl.isValidityRecruitdaily();">
                <label for="select_recruitdaily" class="biz-regist__label">마감일선택 </label>
            </span>
        </div>
    </td>
</tr>
         </tbody>
      </table>
         </fieldset>
      </div>
         <div class="flex">
            <input type="submit" id="zzz" class="btn btn-write ml-auto">등록하기
        </div>
   <sec:csrfInput />
</form:form>
<script src="/resources/js/recruit.js"></script>
<!-- 카카오맵  api주소 삭제 --> 

<script>
   
   
var dateInput = document.getElementById('select_recruitdaily');
var permanentRecruitmentButton = document.getElementById('permanentRecruitmentButton');
var isDisabled = false; // 날짜 입력 필드의 활성/비활성 상태를 저장하는 변수

let storedWords = '';
let storedWords2 = '';
let storedWords3 = '';
let storedWords4 = '';

// "상시 채용" 버튼 클릭 시 토글 기능을 수행하는 함수
permanentRecruitmentButton.addEventListener('click', function() {
    isDisabled = !isDisabled; // 활성/비활성 상태를 토글

    if (isDisabled) {
        dateInput.disabled = true; // 날짜 입력 필드 비활성화
    } else {
        dateInput.disabled = false; // 날짜 입력 필드 활성화
    }
});
   
      var userEnteredDetailAddress = ""; // 사용자가 입력한 상세주소를 저장할 변수
      
   //주소를 받아서 처리하는 함수
   function handleAddress(data) {
       var addr = '';
          if (data.userSelectedType === 'R') {
              addr = data.roadAddress;
          } else {
              addr = data.jibunAddress;
          }
         
       // 우편번호와 주소 정보를 해당 필드에 넣음
       document.getElementById('postcode').value = data.zonecode;
       document.getElementById("address").value = addr;
      
       // 커서를 상세주소 필드로 이동
       document.getElementById("detailAddress").focus();
      
      
       console.log(data.zonecode);
       console.log(addr);
   
   }
   
   //다음 우편번호 API 실행 함수
   function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 주소 선택 후 실행되는 부분
            handleAddress(data);
           
            searchAddress();
        }
    }).open();
   }


    function previewFile() {
        const preview = document.getElementById('file-preview');
        const file = document.querySelector('input[type=file]').files[0];
        const reader = new FileReader();

        reader.onloadend = function () {
            const img = document.createElement('img');
            img.src = reader.result;
            img.style.maxWidth = '350px';
            img.style.maxHeight = '350px';
            img.style.width = 'auto';
            img.style.height = 'auto';
            img.style.marginTop = '20px';
            preview.innerHTML = '';
            preview.appendChild(img);
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.innerHTML = '미리보기 없음';
        }
    }
    function previewFile2() {
        const preview = document.getElementById('file-preview2');
        const file = document.querySelector('input[class=btn-uploadz]').files[0];
        const reader = new FileReader();

        reader.onloadend = function () {
            const img = document.createElement('img');
            img.src = reader.result;
            img.style.maxWidth = '350px';
            img.style.maxHeight = '350px';
            img.style.width = 'auto';
            img.style.height = 'auto';
            img.style.marginTop = '20px';
            preview.innerHTML = '';
            preview.appendChild(img);
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.innerHTML = '미리보기 없음';
        }
    }
   
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

   // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
   var map = new kakao.maps.Map(mapContainer, mapOption);    
   
    
    //----------------------------------------------
   function searchAddress() {
       
       var address = document.getElementById('address').value;
       var detailAddress = document.getElementById('detailAddress').value;
       console.log("zz",detailAddress);
       
       // 입력한 주소와 상세 주소를 합쳐서 전체 주소로 만듭니다.
       var fullAddress = address + " " + detailAddress;

       // 주소-좌표 변환 객체를 생성합니다
       var geocoder = new kakao.maps.services.Geocoder();
       
       // 주소로 좌표를 검색합니다
       geocoder.addressSearch(fullAddress, function(result, status) {
           // 정상적으로 검색이 완료됐으면 
           if (status === kakao.maps.services.Status.OK) {
               var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

               // 결과값으로 받은 위치를 마커로 표시합니다
               var marker = new kakao.maps.Marker({
                   map: map,
                   position: coords
               });

               // 인포윈도우로 장소에 대한 설명을 표시합니다
               var infowindow = new kakao.maps.InfoWindow({
                   content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
               });
               infowindow.open(map, marker);

               // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
               map.setCenter(coords);
           } 
       });
   }
    
   
    $("#comCd").on("change",function(e){
       console.log($("#comCd").val());
       let a = $("#comCd").val();
       let data = {
             "comCd" :a
       };
       
       console.log("a", a);
       
       $.ajax({
          url:"/recruit/createAjax",
          contentType:"application/json;charset=utf-8",
          data:JSON.stringify(data),
          type:"post",
          dataType:"json",
          beforeSend : function(xhr) {
                xhr.setRequestHeader(
                      "${_csrf.headerName}",
                      "${_csrf.token}");
          },
          success:function(rslt){
             console.log("rslt:" ,rslt);
             
               $('#chart1').html("");
             
             $.each(rslt, function(index){
                let palinfo = "";
                
                palinfo +='<option  value='+rslt[index].comDetCd+'>'+rslt[index].comDetCdNm+'</option>';
                
                
                $('#chart1').append(palinfo);
                  
             });
          }
       })
    });
     function handleEnter(event) {
        if (event.key === 'Enter') {
        	
        	event.preventDefault();
        	
            displayAndStoreWord();
        }
    }

    function displayAndStoreWord() {
        const recruitQlfs = document.getElementById('recruitQlfs');
        const wordContainer = document.getElementById('wordContainer');

        const word = recruitQlfs.value.trim();

        if (word !== '') {
            const wordElement = document.createElement('div');
            wordElement.className = 'wordButton';
            wordElement.textContent = word;
            
            const deleteIcon = document.createElement('div');
            deleteIcon.className = 'deleteIcon';
            deleteIcon.textContent = 'x';

            deleteIcon.addEventListener('click', () => {
                wordContainer.removeChild(wordElement);
                updateStoredWords();
            });

            wordElement.appendChild(deleteIcon);

            wordContainer.appendChild(wordElement);
        }

        storedWords += (storedWords.length > 0 ? '|' : '') + word;
        
        document.getElementById("recruitQlfs").value = storedWords;
        document.getElementById("recruitQlf").value = storedWords;

        recruitQlfs.value = '';

        console.log('Stored Words:', storedWords);
    }

    function updateStoredWords() {
    	
        const wordElements = document.querySelectorAll('.wordButton');
        
        storedWords = Array.from(wordElements).map(element => element.textContent.replace('x', '').trim()).join(', ');
        
        document.getElementById("recruitQlfs").value = storedWords;
        document.getElementById("recruitQlf").value = storedWords;
        
        recruitQlfs.value = '';
        
        console.log('Updated Stored Words:', storedWords);
        
    }
    
    function handleEnter2(event) {
        if (event.key === 'Enter') {
        	
        	event.preventDefault();
        	
            displayAndStoreWord2();
        }
    }

    function displayAndStoreWord2() {
        const recruitPrefers = document.getElementById('recruitPrefers');
        const wordContainer = document.getElementById('wordContainer2');

        const word = recruitPrefers.value.trim();

        if (word !== '') {
            const wordElement = document.createElement('div');
            wordElement.className = 'wordButton';
            wordElement.textContent = word;
            
            const deleteIcon = document.createElement('div');
            deleteIcon.className = 'deleteIcon';
            deleteIcon.textContent = 'x';

            deleteIcon.addEventListener('click', () => {
                wordContainer.removeChild(wordElement);
                updateStoredWords();
            });

            wordElement.appendChild(deleteIcon);

            wordContainer.appendChild(wordElement);
        }

        storedWords2 += (storedWords2.length > 0 ? '|' : '') + word;
        
        document.getElementById("recruitPrefers").value = storedWords2;
        document.getElementById("recruitPrefer").value = storedWords2;

        recruitPrefers.value = '';

        console.log('Stored Words:', storedWords2);
    }

    function updateStoredWords2() {
    	
        const wordElements = document.querySelectorAll('.wordButton');
        
        storedWords2 = Array.from(wordElements).map(element => element.textContent.replace('x', '').trim()).join(', ');
        
        document.getElementById("recruitPrefers").value = storedWords2;
        document.getElementById("recruitPrefer").value = storedWords2;
        
        recruitPrefers.value = '';
        
        console.log('Updated Stored Words:', storedWords2);
        
    }
    
    
    function handleEnter3(event) {
        if (event.key === 'Enter') {
        	
        	event.preventDefault();
        	
            displayAndStoreWord3();
        }
    }

    function displayAndStoreWord3() {
        const recruitPrefers = document.getElementById('recruitWorks');
        const wordContainer = document.getElementById('wordContainer3');

        const word = recruitWorks.value.trim();

        if (word !== '') {
            const wordElement = document.createElement('div');
            wordElement.className = 'wordButton';
            wordElement.textContent = word;
            
            const deleteIcon = document.createElement('div');
            deleteIcon.className = 'deleteIcon';
            deleteIcon.textContent = 'x';

            deleteIcon.addEventListener('click', () => {
                wordContainer.removeChild(wordElement);
                updateStoredWords();
            });

            wordElement.appendChild(deleteIcon);

            wordContainer.appendChild(wordElement);
        }

        storedWords3 += (storedWords3.length > 0 ? '|' : '') + word;
        
        document.getElementById("recruitWorks").value = storedWords3;
        document.getElementById("recruitWork").value = storedWords3;

        recruitWorks.value = '';

        console.log('Stored Words:', storedWords3);
    }

    function updateStoredWords3() {
    	
        const wordElements = document.querySelectorAll('.wordButton');
        
        storedWords3 = Array.from(wordElements).map(element => element.textContent.replace('x', '').trim()).join(', ');
        
        document.getElementById("recruitWorks").value = storedWords3;
        document.getElementById("recruitWork").value = storedWords3;
        
        recruitWorks.value = '';
        
        console.log('Updated Stored Words:', storedWords3);
        
    }
    
    
    function handleEnter4(event) {
        if (event.key === 'Enter') {
        	
        	event.preventDefault();
        	
            displayAndStoreWord4();
        }
    }

    function displayAndStoreWord4() {
        const recruitPrefers = document.getElementById('recruitSkills');
        const wordContainer = document.getElementById('wordContainer4');

        const word = recruitSkills.value.trim();

        if (word !== '') {
            const wordElement = document.createElement('div');
            wordElement.className = 'wordButton';
            wordElement.textContent = word;
            
            const deleteIcon = document.createElement('div');
            deleteIcon.className = 'deleteIcon';
            deleteIcon.textContent = 'x';

            deleteIcon.addEventListener('click', () => {
                wordContainer.removeChild(wordElement);
                updateStoredWords();
            });

            wordElement.appendChild(deleteIcon);

            wordContainer.appendChild(wordElement);
        }

        storedWords4 += (storedWords4.length > 0 ? '|' : '') + word;
        
        document.getElementById("recruitSkills").value = storedWords4;
        document.getElementById("recruitSkill").value = storedWords4;

        recruitSkills.value = '';

        console.log('Stored Words:', storedWords3);
    }

    function updateStoredWords4() {
    	
        const wordElements = document.querySelectorAll('.wordButton');
        
        storedWords4 = Array.from(wordElements).map(element => element.textContent.replace('x', '').trim()).join(', ');
        
        document.getElementById("recruitSkills").value = storedWords4;
        document.getElementById("recruitSkill").value = storedWords4;
        
        recruitWorks.value = '';
        
        console.log('Updated Stored Words:', storedWords3);
        
    }
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>