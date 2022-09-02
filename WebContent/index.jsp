<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>쇼핑몰 회원관리</title>
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<div class="section">
		<h3 class="title">학사관리 프로그램</h3>
		<p>학생정보와 성적정보 데이터베이스를 구축하고 학사관리 프로그램을 작성하는 프로그램이다.<br>
		프로그램 작성 순서<br>
		1. 학생정보 테이블을 생성한다.<br>
		2. 성적정보 테이블을 생성한다.<br>
		3. 학생정보, 성적정보 테이블에서 제시된 문제지의 참조데이터를 추가 생성한다.<br>
		4. 학생성적 입력 화면프로그램을 작성한다.<br>
		5. 학생성적 조회 프로그램을 작성한다.<br></p>
	</div>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>