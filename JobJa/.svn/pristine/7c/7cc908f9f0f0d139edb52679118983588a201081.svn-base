<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/mypage.css"></link>
<!-- <link rel="stylesheet" href="/resources/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>날 JOB아줘</title>
    
	<meta name="_csrf_header" content="${_csrf.headerName}">
	<meta name="_csrf" content="${_csrf.token}">
<!-- 	<link rel="stylesheet" href="/resources/css/myPageaside.css"> -->
</head>
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- fontawesome CDN -->
<script src="https://kit.fontawesome.com/96da2afb16.js" crossorigin="anonymous"></script>
<!-- slick-slider CDN -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<style>
*{
/* 	background-color: white; */
}
.mypage-aside-con {
    position: fixed;
}

.header-top {
	height: 62px;
}

#memtiles{
	margin-left:280px;
}

#scroll-header {
	border-top: 0px solid #e5e6e9 !important;
}
</style>
<body>
 
 
<%-- 	<tiles:insertAttribute name="header" /> --%>
	
	<div>
		<tiles:insertAttribute name="aside"/>
				<div id="memtiles" >
					
					<tiles:insertAttribute name="body" />
				
				</div>
	</div>
	
	
<!-- 	<script type="text/javascript" src="/resources/js/header.js"></script> -->
<!-- 	<script type="text/javascript" src="/resources/js/myPageaside.js"></script> -->
</body>

</html>