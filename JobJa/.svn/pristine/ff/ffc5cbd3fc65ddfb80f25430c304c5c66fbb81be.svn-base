<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/aside.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>날 JOB아줘</title>
    
	<meta name="_csrf_header" content="${_csrf.headerName}">
	<meta name="_csrf" content="${_csrf.token}">
</head>
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- fontawesome CDN -->
<script src="https://kit.fontawesome.com/96da2afb16.js" crossorigin="anonymous"></script>
<!-- slick-slider CDN -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<body>
 
 <div class="wrapper" style="height:100vh; ">
	<tiles:insertAttribute name="header"/>
	<div class="section" style="position:relative; height:calc(100% - 112px); disply:flex; justify-content: center; align-self: center;" >
		<tiles:insertAttribute name="aside" />
		<div class="content" style="position:absolute; top:0; right:0;  width: calc(100% - 200px); height:100%; background-color: white; ">
		<tiles:insertAttribute name="body" />
		</div>
	</div>
	<tiles:insertAttribute name="footer" />	
</div>
	
	<script type="text/javascript" src="/resources/js/header.js"></script>
</body>

</html>