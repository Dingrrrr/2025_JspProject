<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Vector" %>
<%@ page import="jspproject.BgmBean" %>
<%@ page import="jspproject.MplistMgrMgr" %>

<%
try {
    String param = request.getParameter("mplist_id");
    if (param == null) {
        out.print("<div class='music-list-item2' style='color:white;'>잘못된 요청입니다.</div>");
        return;
    }

    int mplist_id = Integer.parseInt(param);
    MplistMgrMgr mgr = new MplistMgrMgr();
    Vector<BgmBean> bgms = mgr.getBgmsInMplist(mplist_id);

    if (bgms != null && !bgms.isEmpty()) {
        for (BgmBean b : bgms) {
%>
    <div class="music-list-item2"
	     data-bgm-id="<%= b.getBgm_id() %>"
	     data-bgm-name="<%= b.getBgm_name() %>"
	     data-bgm-src="<%= b.getBgm_music() %>"
	     data-bgm-img="<%= b.getBgm_image() != null ? b.getBgm_image() : "default.png" %>"
	     data-bgm-cnt="<%= b.getBgm_cnt() != null ? b.getBgm_cnt() : "설명이 없습니다." %>">
	  <input type="checkbox" name="bgm_id" value="<%= b.getBgm_id() %>"/>
	  <span><%= b.getBgm_name() %></span>
	</div>
<%
        }
    } else {
%>
    <div class="music-list-item2" style="color:white;">해당 재생목록에 음악이 없습니다.</div>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
    out.print("<div class='music-list-item2' style='color:red;'>서버 오류 발생</div>");
}
%>
