<%@page import="java.util.ArrayList"%>
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
	
	String sql = "select custno, custname, phone, address, to_char(joindate,'yyyy-mm-dd')joindate , grade , city from member_tbl_02 order by custno asc";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	ArrayList<String[]> viewList = new ArrayList<String[]>();
	
	while(rs.next()) {
		String [] view = new String[7];
		view[0] = rs.getString("custno");
		view[1]= rs.getString("custname") ;
		view[2]= rs.getString("phone") ;
		view[3]= rs.getString("address") ;
		view[4]= rs.getString("joindate") ;
		String grade = rs.getString("grade");
		if(grade.equals("A")){
			grade = "VIP";
		}
		else if(grade.equals("B")){
			grade = "일반";
		}
		else if(grade.equals("C")){
			grade = "직원";
		}
		
		view[5]= grade;
		view[6]= rs.getString("city");
		viewList.add(view);
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
<title>쇼핑몰 회원관리</title>
<script type="text/javascript">
	function checkDel(custno) {
		msg="삭제하시겠습니까?";
		if(confirm(msg)!=0){
			location.href="delete.jsp?d_custno="+custno;
			alert("삭제되었습니다.");
		} else {
			alert("삭제가 취소되었습니다.")
			return;
		}
	}
</script>
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<div id="m_list" class="section">
		<h3 class="title">회원목록조회/수정</h3>
		<div class="scroll">
			<table class="table_line">
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>거주지역</th>
					<th>수정 및 삭제</th>
				</tr>
				<%
					for(int i = 0; i < viewList.size(); i++){
					
				%>
				<tr class="center">
					<td class="link"><a href="update.jsp?click_custno=<%= viewList.get(i)[0]%>"><%= viewList.get(i)[0]%></a></td>
					<td><%= viewList.get(i)[1] %></td>
					<td><%= viewList.get(i)[2]%></td>
					<td><%= viewList.get(i)[3] %></td>
					<td><%= viewList.get(i)[4] %></td>
					<td><%= viewList.get(i)[5] %></td>
					<td><%= viewList.get(i)[6] %></td>
					<td><input type="button" value="수정" onclick="document.location.href='update.jsp?click_custno=<%= viewList.get(i)[0]%>'"> <input type="button" value="삭제" onclick="checkDel(<%= viewList.get(i)[0]%>);"></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>