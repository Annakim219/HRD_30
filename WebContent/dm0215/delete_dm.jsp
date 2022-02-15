<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/DBconn.jsp" %>

<%
	String dmno = request.getParameter("dmno");
	
	try{
		String sql = "delete from dm0215 where dmno=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dmno);
		pstmt.executeUpdate();
		System.out.println("DM 테이블 삭제 성공");
		%>
		<script>
			alert('삭제가 완료되었습니다!');
			location.href='/HRD_0215/dm0215/select_dm.jsp';
		</script>
		<%	
		
	}catch(SQLException e){
		System.out.println("삭제 실패");
		%>
		<script>
			alert('삭제 실패');
		</script>
		<%
		e.printStackTrace();
	}
%>