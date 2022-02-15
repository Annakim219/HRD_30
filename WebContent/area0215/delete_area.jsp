<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/DBconn.jsp" %>

<%
	String areacode = request.getParameter("areacode");
	
	try{
		String sql = "delete from area0215 where areacode=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, areacode);
		pstmt.executeUpdate();
		System.out.println("거주지 테이블 삭제 성공");
		%>
		<script>
			alert('삭제가 완료되었습니다!');
			location.href='/HRD_0215/area0215/select_area.jsp';
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