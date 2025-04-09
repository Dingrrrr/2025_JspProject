<!-- musicListAdd.jsp -->
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="jspproject.UserBean" %>
<%@ page import="jspproject.BgmBean" %>
<%@ page import="jspproject.MplistBean" %>
<%@ page import="jspproject.MplistMgrBean" %>
<jsp:useBean id="lmgr" class="jspproject.LoginMgr"/>
<jsp:useBean id="bmgr" class="jspproject.BgmMgr"/>
<jsp:useBean id="pmgr" class="jspproject.MplistMgr"/>
<%
String user_id = (String) session.getAttribute("user_id");
if (user_id == null) {
    response.sendRedirect("login.jsp");
    return;
}


Vector<BgmBean> bgm = bmgr.getBgmList(user_id);
Vector<MplistBean> mplist = pmgr.getMplist(user_id);
%>
<style>
@font-face {
	font-family: 'PFStarDust';
	src: url('fonts/PFStarDust-Bold.ttf') format('truetype');
	font-weight: bold;
	font-style: normal;
}


.add-playlist-container {
  position: absolute !important; /* ✅ 요게 꼭 필요! */
  top: 0; /* 기본값은 없어도 되고 JS에서 제어 */
  left: 0;
  z-index: 9999;
  width: 200px;
  background-color: rgba(29, 16, 45, 0.85); /* 기존 #1d102d = rgb(29,16,45) */
  border-radius: 8px;
  padding: 10px;
  font-family: 'sans-serif';
  color: white;
  box-shadow: 0 0 10px rgba(255,255,255,0.4);
}

.add-playlist-title {
  font-weight: bold;
  font-size: 14px;
  padding-bottom: 6px;
  border-bottom: 1px solid #aaa;
  margin-bottom: 10px;
  font-family: 'PFStarDust', sans-serif;
  font-weight: bold;
}

.add-playlist-list {
  max-height: 160px;
  overflow-y: auto;
  margin-bottom: 10px;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.playlist-item {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 14px;
  background-color: rgba(255, 255, 255, 0.05);
  padding: 6px 8px;
  border-radius: 5px;
}

.playlist-item input[type="checkbox"] {
  	appearance: none;              /* 기본 브라우저 스타일 제거 */
    width: 18px;
    height: 18px;
    border: 2px solid #ccc;
    border-radius: 4px;            /* 둥근 모서리 */
    margin-right: 10px;
    cursor: pointer;
    transition: all 0.2s ease;
    position: relative;
    background-color: white;       /* 기본 배경 */
}

/* 체크된 상태 */
.playlist-item input[type="checkbox"]:checked {
	background-color: black;       /* 체크 시 검정색 채우기 */
	border-color: white;
}
	
/* 체크된 상태에 체크 모양 (✓ 표시용) */
.playlist-item input[type="checkbox"]:checked::after {
	content: '✓';
	color: white;
	font-size: 11px;
	font-weight: bold;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-45%, -55%); /* 👈 수직 위치 살짝 위로 */
}

.add-playlist-list::-webkit-scrollbar {
	width: 10px; /* 스크롤바 너비 */
}
	
.add-playlist-list::-webkit-scrollbar-track {
	background: transparent; /* 트랙은 안 보이게 */
}
	
.add-playlist-list::-webkit-scrollbar-thumb {
	background-color: white;  /* 스크롤바 색상 */
	border-radius: 10px;
	border: 2px solid transparent;
	background-clip: content-box; /* 부드러운 느낌 */
}
	
.add-playlist-list::-webkit-scrollbar-button {
	display: none; /* 🔥 위아래 화살표 제거 */
}

.add-playlist-btn {
  width: 100%;
  padding: 8px 0;
  background-color: #1e0035;
  color: white;
  font-weight: bold;
  border: 2px solid white;
  border-radius: 20px;
  cursor: pointer;
  font-size: 14px;
  font-family: 'PFStarDust', sans-serif;
  font-weight: bold;
}


</style>

<form id="playlistAssignForm" method="POST" action="<%= request.getContextPath() %>/jspproject/bgmAssignPlaylist">
  <!-- bgm_id: 오른쪽 화면 곡 선택 시 세팅 -->
  <input type="hidden" name="bgm_id" id="addPlaylistBgmId" value="">
  
  
  <div class="add-playlist-container">
    <div class="add-playlist-title">재생 목록에 추가</div>
    <div class="add-playlist-list">
      <% for (MplistBean m : mplist) { %>
        <label class="playlist-item">
          <input type="checkbox" name="mplist_id" value="<%=m.getMplist_id()%>"/>
          <span><%=m.getMplist_name()%></span>
        </label>
      <% } %>
    </div>
    <!-- 버튼 type을 명시하여 기본 폼 제출을 방지 -->
    <button type="button" class="add-playlist-btn">추가</button>
  </div>
</form>

<script>
	document.querySelector('.add-playlist-btn').addEventListener('click', function(e){
		  e.preventDefault();
	
		  const bgmId = document.getElementById('addPlaylistBgmId').value;
		  const checkedMplistElems = document.querySelectorAll('input[name="mplist_id"]:checked');
		  const mplistIds = Array.from(checkedMplistElems).map(e => parseInt(e.value));
	
		  if (!bgmId || bgmId.trim() === "" || mplistIds.length === 0) {
		    alert("음악과 재생목록을 선택해주세요.");
		    return;
		  }
	
		  fetch("<%= request.getContextPath() %>/jspproject/bgmAssignPlaylist", {
		    method: "POST",
		    headers: {
		      "Content-Type": "application/json"
		    },
		    body: JSON.stringify({
		      bgm_id: Number(bgmId),
		      mplist_ids: mplistIds
		    })
		  })
		  .then(res => res.json())
		  .then(data => {
		    if(data.success) {
		      alert("재생 목록 업데이트 성공!");
		    } else {
		      alert("업데이트 실패");
		    }
		  })
		  .catch(err => console.error(err));
		});

</script>