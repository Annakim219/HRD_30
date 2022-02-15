<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main page</title>
<style>
*{
	margin: 0;
	padding: 0
}

html,body{
	width: 100%;
	height: 100%;
}

header{
	width: 100%;
	height: 12%;
	background: lightgrey;
	color: black;
	text-align: center;
	line-height: 120px;
	font-size: 1.2em;
}

section{
	width: 100%;
	height: 78%;
}

section h2, h3{
	margin: 20px auto;
	text-align: center;
}

nav{
	width: 100%;
	height: 5%;
	background: black;
	color: white;
	text-align: left;
	line-height: 45px;
}

nav ul{
	display: inline-block;
	list-style-type: none;
}

nav li{
	float: left;
	margin: 0 35px;
}

nav a{
	display: block;
	text-decoration: none;
	color: white;
}

nav a:HOVER{
	color: white;
	font-weight: bold;
	font-size: 1.1em;	
}

footer{
	width: 100%;
	height: 5%;
	background: grey;
	color: white;
	text-align: center;
	line-height: 45px;
	font-size: 0.9em;
}

table{
	margin: 0 auto;
	border-collapse: collapse;
	border: 2px solid grey;	
}

tr,th,td{
	border: 1px solid black;
}

#tr_btn{
	height: 50px;
}

#btn1{
	width: 120px;
	height: 30px;
	background: lightgrey;
	color:black;
	font-weight: bold;
}

#btn2{
	width: 120px;
	height: 30px;
	background: black;
	color: white;
}

.btn_group{
	margin: 15px auto;
}

#sel1{
	margin-left: 2px;
	width:30%;
	height: 25px;
}

#chk1{
	margin-left: 2px;
}

#p1{
	margin-left: 5px;
	text-align: left;
}

</style>
</head>
<body>
<header>
<h1>DM 발송 시스템에 오신 것을 환영합니다.</h1>
</header>
</body>
</html>