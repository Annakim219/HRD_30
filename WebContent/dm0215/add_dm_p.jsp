<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/DBconn.jsp" %>

<%
	String dmno = request.getParameter("dmno");
	String custid = request.getParameter("custid");
	String maildate = request.getParameter("maildate");
	String contents = request.getParameter("contents");
	String dept = request.getParameter("dept");
	String grade = request.getParameter("grade");
	String campain = request.getParameter("campain");
	
	try{
		String sql = "insert into dm0215 values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dmno);
		pstmt.setString(2, custid);
		pstmt.setString(3, maildate);
		pstmt.setString(4, contents);
		pstmt.setString(5, dept);
		pstmt.setString(6, grade);
		pstmt.setString(7, campain);
		pstmt.executeUpdate();
		System.out.println("DM 테이블 등록 성공");
		%>
		<script>
			alert('등록이 완료되었습니다!');
			location.href='/HRD_0215/dm0215/select_dm.jsp';
		</script>
		<%	
		
	}catch(SQLException e){
		System.out.println("등록 실패");
		%>
		<script>
			alert('등록 실패');
		</script>
		<%
		e.printStackTrace();
	}
%>