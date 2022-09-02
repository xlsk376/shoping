<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Connection conn = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "system";
String pw = "1234";
try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, id, pw);
	
	System.out.println("DB 접속");
} catch(Exception e) {
	e.printStackTrace();
}

	String sql="select custno, custname, phone, address, to_char(joindate,'yyyymmdd') joindate, grade, city from member_tbl_02 where custno=" + request.getParameter("click_custno");

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	String[] view = new String[7];
			
	if(rs.next()){
		view[0] = rs.getString(1);
		view[1] = rs.getString(2);
		view[2] = rs.getString(3);
		view[3] = rs.getString(4);
		view[4] = rs.getString(5);
		view[5] = rs.getString(6);
		view[6] = rs.getString(7);
	}
	conn.close();
	pstmt.close();
	rs.close();
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
	function checkValue() {
		if(!document.u_data.custname.value) {
			alert("회원성명을 입력하세요.");
			document.u_data.custname.focus();
			return false;
		} else if(!document.u_data.phone.value) {
			alert("전화번호를 입력하세요.");
			document.u_data.phone.focus();
			return false;
		} else if (!document.u_data.address.value) {
			alert("주소를 입력하세요.");
			document.u_data.address.focus();
			return false;
		} else if (!document.u_data.joindate.value) {
			alert("가입일자를 입력하세요.");
			document.u_data.joindate.focus();
			return false;
		} else if (!document.u_data.grade.value) {
			alert("고객등급을 입력하세요.");
			document.u_data.grade.focus();
			return false;
		}  else if (!document.u_data.city.value) {
			alert("도시코드를 입력하세요.");
			document.u_data.city.focus();
			return false;
		}
	}
	function checkDel(custno) {
		msg="삭제하시겠습니까?";
		if(confirm(msg)!=0){
			alert("삭제");
			location.href="delete.jsp?d_custno="+custno;
		} else {
			alert("취소");
		}
	}
</script>
<title>쇼핑몰 회원관리</title>
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<div class="section">
		<h3 class="title">홈쇼핑 회원 정보 수정</h3>
		<form name="u_data" action="update_p.jsp" method="post" onsubmit="return checkValue()">
			<table class="table_line">
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="custno" value="<%= view[0] %>" size="10" readonly></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value="<%=view[1] %>" size="10"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" value="<%=view[2] %>" size="15"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" value="<%= view[3]%>" size="25"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value="<%= view[4] %>" size="10"></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name="grade" value="<%= view[5] %>" size="10"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value="<%=view[6]%>" size="10"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" name="submit" value="수정">
						<input type="button" name="search" value="조회" onclick="location.href='member_list.jsp'">
						<input type="button" value="삭제" onclick="checkDel(<%= view[0]%>);">
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>