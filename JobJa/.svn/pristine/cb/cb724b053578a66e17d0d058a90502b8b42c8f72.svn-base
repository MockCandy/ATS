
// 다음 우편번호 api
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }


            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}


//이미지 미리보기 시작/////////////////////
$(document).on("change", "#uploadFile",handleImg);
//e : onchange 이벤트 객체
function handleImg(e){
    //files : ala.jpg, bara1.jpg, bars2.jpg
    let files = e.target.files;
    let fileArr = Array.prototype.slice.call(files);
    //fileArr = [ala.jpg, bara1.jpg, bars2.jpg]
    fileArr.forEach(function(f){
        console.log(f);
        if(!f.type.match("image.*")){
            alert("이미지 확장자만 가능합니다.");
            $("#uploadFile").val('');
            return;
        }
        let reader = new FileReader();
        //e : reader가 이미지 객체를 읽는 이벤트
        reader.onload = function(e){
            let img_html = "<img src='"+e.target.result + "' style='width:100%;' />";
            //요소.append : 누적, 요소.html : 새로고침, 요소.innerHTML : J/S에서 새로고침
            console.log(img_html);
            console.log($("#img-preview"));
            $("#img-preview")[0].innerHTML = img_html;
        }
        reader.readAsDataURL(f);
    });
}

const radios = document.querySelectorAll("input[name='gen']");

radios.forEach(radio => {
    radio.addEventListener("change", (e) => {
        console.log(e.currentTarget.value)
    })
})

let tab_gen = document.querySelector("#mem-gen");
let tab_ent = document.querySelector("#mem-ent");
let tab_consult = document.querySelector("#mem-consult");
let sign_up_form = document.querySelector("#sign-up-form");

$(".sign-up-tab-list li").on("click", function(e){
    let tabs = e.target.parentElement.children;

    for(let i = 0 ; i < tabs.length; i++){
        tabs[i].classList.remove("on");
    }
    e.target.classList.add("on");
})


tab_gen.addEventListener("click", function(){

    sign_up_form.action = "/member/createPost?${_csrf.parameterName}=${_csrf.token}";
    
    let str = `
            <div class="login-cont">
                <p class="main-tit">
                    회원가입 
                    <span class="mem-kind">일반회원</span>
                </p>
                <div class="h-div-line"></div>
                <p class="name-label required">아이디</p>
                <input type="text" name="memId" class="input01" placeholder="아이디를 입력해 주세요.">
                <p class="name-label required">비밀번호</p>
                <input type="password" name="memPass" class="input01" placeholder="비밀번호를 입력해 주세요.">
                <p class="name-label required">이름</p>
                <input type="text" name="memNm" class="input01" placeholder="이름 입력해 주세요.">
                
                <p class="name-label required">주소</p>
                <div style="display:flex; ">
                    <input class="input01" type="text" name="memPostno" id="postcode" placeholder="우편번호">
                    <input class="btn" type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="margin-left: 10px;"><br>
                </div>
                <input class="input01" type="text" name="memAddr" id="address" placeholder="주소"><br>
                <input class="input01" type="text" name="memAddr2" id="detailAddress" placeholder="상세주소">
                
                <p class="name-label required">생년월일</p>
                <input type="date" name="memBirth" class="input01" style="width: 200px;">

                <p class="name-label">연락처</p>
                <input type="text" name="memTel" class="input01" placeholder="-(하이픈)을 제외한 번호 입력 ex)01011112222">

                <p class="name-label">이메일</p>
                <input type="text" name="memEmail" class="input01" placeholder="이메일 주소 입력">
                
                <p class="name-label required">성별</p>
                <fieldset>
                    <label>
                        <input type="radio" name="memGen" value="0" checked />
                        <span>남자</span>
                    </label>
                    <label>
                        <input type="radio" name="memGen" value="1" />
                        <span>여자</span>
                    </label>
                </fieldset>

                <div class="name-label">
                    <span class="name-label required">닉네임</span>
                    <span class="p-info">
                        닉네임은 취업 Q&A 게시판에서 사용될 명칭입니다.
                    </span>
                </div>
                <input type="text" name="memNcnm" class="input01" placeholder="닉네임 입력">
                

                <button type="submit" class="btn btn-login">회원가입</button>

            </div>
            <sec:csrfInput/>
        	`;

    sign_up_form.innerHTML = str;

})

tab_ent.addEventListener("click", function(){
    
    sign_up_form.action = "/enterprise/createPost?${_csrf.parameterName}=${_csrf.token}";
    sign_up_form.enctype = "multipart/form-data";

    let str = `
    	<div class="login-cont">
        <p class="main-tit">
            회원가입
            <span class="mem-kind">기업회원</span>
        </p>
        <p class=sub-tit">
            회원정보
        </p>
        <div class="h-div-line"></div>
        <p class="name-label required">아이디</p>
        <input type="text" name="memId" class="input01" placeholder="아이디를 입력해 주세요.">
        <p class="name-label required">비밀번호</p>
        <input type="password" name="memPass" class="input01" placeholder="비밀번호를 입력해 주세요.">
        <p class="name-label required">이름</p>
        <input type="text" name="memNm" class="input01" placeholder="이름 입력해 주세요.">
        
        <p class="name-label required">주소</p>
        <div style="display:flex; ">
            <input class="input01" type="text" name="memPostno" id="postcode" placeholder="우편번호">
            <input class="btn" type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="margin-left: 10px;"><br>
        </div>
        <input class="input01" type="text" name="memAddr" id="address" placeholder="주소"><br>
        <input class="input01" type="text" name="memAddr2" id="detailAddress" placeholder="상세주소">
        
        <p class="name-label required">생년월일</p>
        <input type="date" name="memBirth" class="input01" style="width: 200px;">

        <p class="name-label">연락처</p>
        <input type="text" name="memTel" class="input01" placeholder="-(하이픈)을 제외한 번호 입력 ex)01011112222">

        <p class="name-label">이메일</p>
        <input type="text" name="memEmail" class="input01" placeholder="이메일 주소 입력">
        
        <p class="name-label required">성별</p>
        <fieldset>
            <label>
                <input type="radio" name="memGen" value="0" checked />
                <span>남자</span>
            </label>
            <label>
                <input type="radio" name="memGen" value="1" />
                <span>여자</span>
            </label>
        </fieldset>

        <div class="name-label">
            <span class="name-label required">닉네임</span>
            <span class="p-info">
                닉네임은 취업 Q&A 게시판에서 사용될 명칭입니다.
            </span>
        </div>
        <input type="text" name="" class="input01" placeholder="닉네임 입력">
        
        <p class=sub-tit">
            기업정보
        </p>
        <div class="h-div-line"></div>

        <p class="name-label required">사업자등록번호</p>
        <input type="text" name="entNo" class="input01" placeholder="ex) 111-22-33333">

        <p class="name-label required">기업명</p>
        <input type="text" name="entNm" class="input01" placeholder="기업명을 입력해 주세요">

        <p class="name-label required">팩스번호</p>
        <input type="text" name="entFax" class="input01" placeholder="팩스번호를 입력해 주세요">

        <p class="name-label">기업 소개</p>
        <textarea type="text" name="entIntrcn" class="input01 textarea01" placeholder="기업에 대한 간략한 소개글을 입력해 주세요"></textarea>

        <p class="name-label">기업 사이트 주소</p>
        <input type="text" name="entUrl" class="input01" placeholder="ex) www.naver.com">

        <p class="name-label required">기업 매출액</p>
        <input type="text" name="entSales" class="input01" placeholder="">

        <p class="name-label required">기업 산업군</p>
        <input type="text" name="entSector" class="input01" placeholder="">

        <p class="name-label required">기업 직원수</p>
        <input type="text" name="entEmpcnt" class="input01" placeholder="">

        <p class="name-label required">설립일자</p>
        <input type="date" name="entBday" class="input01" placeholder="">

        <p class="name-label required">대표자명</p>
        <input type="text" name="entCeonm" class="input01" placeholder="">

        <p class="name-label">기업로고</p>
        <input type="file" id="uploadFile" name="uploadFile" class="input01" placeholder="">
        <div id="img-preview"></div>

        <button type="submit" class="btn btn-login">회원가입</button>

    </div>
    <sec:csrfInput/>
    `;
    
    sign_up_form.innerHTML = str;

})