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


	request.setCharacterEncoding("UTF-8");
	int d_custno = Integer.parseInt(request.getParameter("d_custno"));
	
	String sql="delete from member_tbl_02 WHERE custno="+d_custno;

	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	
 	conn.close();
 	pstmt.close();
	
	response.sendRedirect("member_list.jsp");

%>
