$(function() {
	//이미지 미리보기
	$("#uploadFile").on("change", handleImg);
	//e : onchange 이벤트 객체
	function handleImg(e) {
		let files = e.target.files;
		//이미지 오브젝트 배열
		let fileArr = Array.prototype.slice.call(files);

		//f : 각각의 이미지 파일
		fileArr.forEach(function(f) {
			//이미지가 아니면
			if (!f.type.match("image.*")) {
				alert("이미지 확장자만 가능합니다.");
				return;
			}

			let reader = new FileReader();
			//e : 파일을 읽어주는 리더객체가 이미지를 읽을 때 그 이벤트
			reader.onload = function(e) {
				//background-position:center;background-size:cover
				$(".bg-register-image").css({
					"background-image" : "url(" + e.target.result + ")",
					"background-position" : "center",
					"background-size" : "cover"
				});
				console.log(e.target.result);
			}
			//다음 이미지 파일(f)을 위해 리더를 초기화
			reader.readAsDataURL(f);
		});
	}
	//이미지 미리보기 끝 

});