<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet" href="/resources/css/news.css">

<form id="frm" name="frm" action="/news/createPost" method="post" enctype="multipart/form-data">
<input type="hidden" name="memId" />
<input type="hidden" name="emplNewsAfId" />
<input type="hidden" name="boardId" value="${boardNewsVO.boardId}" />
<div class="cen" style="margin: 50px auto;">
    <p class="main-h1">취업 뉴스 등록</p>
    <div class="board">
        <p class="main-tit">취업 뉴스</p>
        <div class="h-div-line">제목</div>
        <input id="title" name="boardTitle" type="text" class="input01 ph-tit w-100 inp-transparent" placeholder="취업뉴스 제목을 입력해주세요">
        <textarea name="boardCntnt" class="input01 w-100 ph-cont resize-none inp-transparent" style="height: 500px;" placeholder="취업뉴스 내용을 입력해주세요"></textarea>
        <label for="file">
            <div class="btn-upload">첨부파일 업로드</div>
        </label>
        <input type="file" name="uploadFile" id="file" onchange="previewFile()">
        <div id="file-preview" class="mt-2"></div>
        <div class="flex">
            <button type="submit" class="btn btn-write ml-auto">등록하기</button>
        </div>
    </div>
</div>
<sec:csrfInput />
</form>
<script>
    function previewFile() {
        const preview = document.getElementById('file-preview');
        const file = document.querySelector('input[type=file]').files[0];
        const reader = new FileReader();

        reader.onloadend = function () {
            const img = document.createElement('img');
            img.src = reader.result;
            img.style.maxWidth = '300px';
            img.style.maxHeight = '300px';
            img.style.width = 'auto';
            img.style.height = 'auto';
            preview.innerHTML = '';
            preview.appendChild(img);
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.innerHTML = '미리보기 없음';
        }
    }
</script>