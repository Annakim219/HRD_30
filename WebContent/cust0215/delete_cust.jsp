<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/DBconn.jsp" %>

<%
	String custid = request.getParameter("custid");
	
	try{
		String sql = "delete customer0215 frome where custid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custid);
		pstmt.executeUpdate();
		System.out.println("고객 테이블 삭제 성공");
		%>
		<script>
			alert('삭제가 완료되었습니다!');
			location.href='/HRD_0215/cust0215/select_cust.jsp';
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