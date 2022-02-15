<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/DBconn.jsp" %>

<%
	String custid = request.getParameter("custid");
	String author = request.getParameter("author");
	String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
	String email = request.getParameter("email1")+"@"+request.getParameter("email2");
	String areacode = request.getParameter("areacode");
	String goods[] = request.getParameterValues("goods");
	String chk = "";
	for(int i=0; i<goods.length; i++){
		if((i+1) == goods.length){
			chk = chk + goods[i];
		}else{
			chk = chk + goods[i] + ",";
		}
	}
	System.out.println("goods : "+chk); //체크박스 정상 작동 확인
	
	try{
		String sql = "update customer0215 set author=?, goods=?, phone=?, email=?, areacode=? where custid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, author);
		pstmt.setString(2, chk);
		pstmt.setString(3, phone);
		pstmt.setString(4, email);
		pstmt.setString(5, areacode);
		pstmt.setString(6, custid);
		pstmt.executeUpdate();
		System.out.println("고객 테이블 수정 성공");
		%>
		<script>
			alert('수정이 완료되었습니다!');
			location.href='/HRD_0215/cust0215/select_cust.jsp';
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