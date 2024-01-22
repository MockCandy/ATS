<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import='java.util.Random'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Web Message main</title>
<!--WebSocket messenger main-->
<link type="text/css" rel="stylesheet" href="<c:url value='/css/table.css'/>" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>


<script type="text/javascript" id="commonScript" defer="defer">
	const msgUrl = 'ws://' + window.location.host + '${pageContext.request.contextPath}/messageServerEndpoint';
	const userName = '${loginVO.name}';
</script>
<!-- 웹소켓 스크립트 -->
<script src="/resources/js/websocketMessage.js" id="websocketScript" defer="defer"></script>


</head>
<body>
	<form name="usersForm">

		<br />
		<div id="content">Web 알림!!</div>
		<br />

		<!-- List -->
		<table id="users" name="users" cellspacing='0'>
			<tr>
				<th>Web Message Users</th>
			</tr>
			<!-- Table Header -->
			<tr>
				<td>There is no one to chat</td>
			</tr>
		</table>

		<input type="text" id="textMessage" name="textMessage" style="width: 300px" />
		<input type="button" id="sendBtn" name="sendBtn" value="Send" />

	</form>

	<a href="/msg/session.do?username=test" target="_session">로그인처리</a>
</body>
</html>
