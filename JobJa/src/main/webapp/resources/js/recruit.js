// HTML 요소 가져오기
const inputField = document.getElementById('title'); // 입력 필드
const characterCount = document.getElementById('spantxttitle'); // 글자 수 표시하는 요소

// 입력 필드에 이벤트 리스너 추가
inputField.addEventListener('input', function() {
  // 입력된 텍스트 길이 가져오기
  const textLength = this.value.length;

  // 글자 수 표시
  characterCount.textContent = textLength;

  // 여기에 추가적으로 처리할 로직을 넣을 수 있습니다.
});



