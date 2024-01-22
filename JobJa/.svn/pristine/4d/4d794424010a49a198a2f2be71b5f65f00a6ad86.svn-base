$(document).ready(function(){
    var fileTarget = $('#uploadFile');
 
     fileTarget.on('change', function(){
         if(window.FileReader){
             // 파일명 추출
             var filename = $(this)[0].files[0].name;
         } 
 
         else {
             // Old IE 파일명 추출
             var filename = $(this).val().split('/').pop().split('\\').pop();
         };
 
         $(this).siblings('.upload-name').val(filename);
     });
 
     $("#uploadFile").on("change",handleImg);
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
 });