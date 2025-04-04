<!-- notice.jsp -->
<%@page import="jspproject.AncBean"%>
<%@page import="java.util.Vector"%>
<%@page import="jspproject.AncMgr"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	AncMgr amgr = new AncMgr();
	Vector<AncBean> vlist = amgr.listAnc();
%>
<html>
<head>
<title>오늘, 내일</title>
<style>
body, html {
  	margin: 0;
    padding: 0;
    height: 100%;
    background-color:#372358;
}
header{
	display: flex;
	justify-content: center;
    align-items: center; 
  	margin-bottom: 20px;
  	padding-right: 370px; 
}
header h3, header h4 {
	color: white;
	margin: 0 12px; /* 좌우 여백만 */
	margin-top: 25px;
}
.image-wrapper {
  position: relative;
  width: auto;
  margin: 0 auto;
}
.main-image {
  width: 100%;
  height: 400px;
  object-fit: cover;
  display: block;
}
.blur-left, .blur-right {
  position: absolute;
  top: 0;
  width: 80px;
  height: 100%;
  z-index: 2;
  pointer-events: none;
}
.blur-left {
  left: 0;
  background: linear-gradient(to right, rgba(55, 35, 88, 1), transparent);
}
.blur-right {
  right: 0;
  background: linear-gradient(to left, rgba(55, 35, 88, 1), transparent);
}
.inner-effect {
  box-shadow: inset 0 0 80px rgba(0, 0, 0, 0.5);
  position: absolute;
  top: 0; left: 0;
  width: 100%;
  height: 100%;
  z-index: 2;
  pointer-events: none;
}
.box{
	width: 600px;
	height: 1000px;
	background-color: #4A3C6E;
	margin: 0 auto;
	top: -140px;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.4);
	position: relative;
	z-index: 10;
	/* padding: 20px; */
}
.ntitle{
	margin-left: 20px;
	color: white;
}
.container {
  display: flex;
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  align-items: stretch;
}
.divider {
  position: absolute;
  top:70px;
  bottom:0px;
  left:400px;
  width: 1px;
  height: calc(100% - 70px);
  background-color: #888;
  margin: 0 16px;
} 
.box2{
 width:415px;
 height:400px;
 background-color: #5C4B85;
 box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
}
.box3{
 width:415px;
 height:200px;
 background-color: #5C4B85;
 box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
}
input[type="checkbox"] {
  appearance: none;         
  width: 15px;
  height: 15px;
  border: 2px solid #ffffff;  
  border-radius: 4px;        
  background-color: white;   
  cursor: pointer;
  position: relative;
}
input[type="checkbox"]:checked {
  background-color: #5C4B85;  
  border: 0.8px solid #ffffff;  
}
input[type="checkbox"]:checked::after {
  content: "✔";
  position: absolute;
  left:3px;
  top:0px;
  font-size: 10px;
  color: white;
}
.dbtn{
	width: 70px;
	height: 30px;
	border-radius: 10px;
	margin-left: 345px;
	margin-top: 10px;
	font-size: 16px;
	border: 0.8px solid #ffffff;
	background-color: #32225B;
	color : white;
}
.new{
	margin-left: auto;
	margin-right: 110px;
	margin-top: 70px;
	color: white;
	font-weight: bold;
}
.container-box {
  	display: flex;
  	position: relative;
}
.left-section, .right-section {
 	width: 50%;
 	box-sizing: border-box;
}
.newtext{
  	margin-left: 125px;
  	margin-top: 5px;
  	color: white;
  	font-size: 10px;
}
</style>
<script>
function allChk() {
}
function chk() {
}
function confirmDelete() {
	const checked = document.querySelectorAll('input[name="ancIds"]:checked');
	if(checked.length===0){
		alert("삭제할 항목을 선택하세요.");
		return false;
	}
	return confirm("정말 삭제하시겠습니까?");
}
</script>
</head> 
<body>
	<header>
	<h3>오늘, 내일</h3>
	<h4>공지사항</h4>
	<h4>글쓰기</h4>
	</header>
<div class="image-wrapper">
  <img src="http://localhost/2025_JspProject/jspproject/images/loginimg.jpg" class="main-image" />
  <div class="blur-left"></div>
  <div class="blur-right"></div>
  <div class="inner-effect"></div>
</div>
<div class="container">
	<div class="box">	
	
	<div class="container-box">
		<!-- 왼쪽 -->
		<div class="left-section">
			<h2 class="ntitle">최신 업데이트 제목</h2>
			<div class="box2" style="color: white;">여기에 가장 첫번째 게시물 불러오기 넘으로 받아오면 될듯</div>
			<h2 class="ntitle">공지사항 목록</h2>
			
			<form action="deleteAncProc.jsp" method="post" onsubmit="return confirmDelete();">
			<div class="box3">
			<table  cellspacing="0" style="color: white;">
				<tr align="center" bgcolor="#32225B" >
					<td><input type="checkbox" name="allCh" onclick="allChk()" ></td>
					<td width="100">번호</td>
					<td width="250">제 목</td>
					<td width="100">작성자</td>
					<td width="150">작성날짜</td>
				</tr>
				<%for(int i=0; i<vlist.size();i++){
					AncBean bean = vlist.get(i);
				%>
				<!-- db에서 받아올 내용 -->
				<tr align="center" style="font-size: 10px;">
					<td><input type="checkbox" name="fch" onclick="chk()" value="<%=bean.getAnc_id()%>"></td>
					<td><%=bean.getAnc_id()%></td>
					<td>
					<a href="ancDetail.jsp?anc_id=<%=bean.getAnc_id()%>" style="color:white;"><%=bean.getAnc_title() %></a>
					</td>
					<td><%=bean.getUser_id() %></td>
					<td><%=bean.getAnc_regdate() %></td>
				</tr>
				<%} %>
				
			</table>
			</div>
			<input class="dbtn" type="submit" id="dbtn" name="btn" value="삭제" ">
			</form>
		</div>
			 <div class="divider"></div>	
			 <div class="right-section">
				<div style="display: flex; flex-direction: column;">
					<div class="ntitle new">주요 공지</div>
					<div class="newtext">1차업데이트</div>
				</div>
			 </div>
		</div>
	</div>
</div>
</body>
</html>