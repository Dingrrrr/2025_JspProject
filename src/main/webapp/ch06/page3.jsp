<!-- page3.jsp -->
<!-- ������ �ڵ� ���ڵ��� ���� �ڵ� ���ڵ� ���ÿ� ��� -->
<%@page  contentType="text/html; charset=UTF-8"%>
<!-- ������ �ڵ� ���ڵ� ��� -->
<%@page pageEncoding="EUC-KR" 
				 isELIgnored="true"
				 trimDirectiveWhitespaces="false"
%>
<%
		String site = "jspstudy.co.kr";
		request.setAttribute("site", site);
%>

����Ʈ��: ${site}