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
		String sql = "update dm0215 set custid=?, maildate=?, contents=?, dept=?, grade=?, campain=? where dmno=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custid);
		pstmt.setString(2, maildate);
		pstmt.setString(3, contents);
		pstmt.setString(4, dept);
		pstmt.setString(5, grade);
		pstmt.setString(6, campain);
		pstmt.setString(7, dmno);
		pstmt.executeUpdate();
		System.out.println("DM 테이블 수정 성공");
		%>
		<script>
			alert('수정이 완료되었습니다!');
			location.href='/HRD_0215/dm0215/select_dm.jsp';
		</script>
		<%	
		
	}catch(SQLException e){
		System.out.println("수정 실패");
		%>
		<script>
			alert('수정 실패');
		</script>
		<%
		e.printStackTrace();
	}
%>