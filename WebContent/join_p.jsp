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
	String sql="insert into member_tbl_02 values (?, ?, ?, ?, ?, ?, ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setInt(1, Integer.parseInt(request.getParameter("custno")));
	pstmt.setString(2, request.getParameter("custname"));
	pstmt.setString(3, request.getParameter("phone"));
	pstmt.setString(4, request.getParameter("address"));
	pstmt.setString(5, request.getParameter("joindate"));
	pstmt.setString(6, request.getParameter("grade"));
	pstmt.setString(7, request.getParameter("city"));
	
	pstmt.executeUpdate();
	conn.close();
	pstmt.close();
	response.sendRedirect("join.jsp");
%>
