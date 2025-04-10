<!-- Background.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jspproject.TemaMgr" %>
<%@ page import="jspproject.TemaBean" %>
<%@ page import="java.util.Vector" %>

 <style>
    .background-container {
    position: absolute;
    left: 18vw;
    top: 9.5vh;
    display: flex;
    width: 70%;
    height: 74.5vh;
    background-color: rgba(29, 16, 45, 0.7); /* 기존 #1d102d = rgb(29,16,45) */
    color: white;
    border-radius: 15px;
    box-shadow: 0 0 20px rgba(255,255,255,0.4);
	}

	.background-tab {
    display: flex;	
    gap: 10px;
    padding: 5px 10px;
    background-color: transparent;
    margin-bottom: 10px;
	}
	
	.tab-btn {
	    background: none;
	    border: none;
	    color: #fff;
	    padding: 5px 12px;
	    cursor: pointer;
	    margin-bottom: 10px;
	    transition: 0.2s;
	    font-family: 'PFStarDust', sans-serif;
    	font-weight: bold;
   	 	font-size: 1vw;
	}
	
	.tab-btn.active {
	    font-weight: bold;
	    border-bottom: 2px solid white;
	}

    .background-header, .background-list{
        margin-bottom: 15px;
    }

    .background-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #555;
    padding-bottom: 8px;
    font-family: 'PFStarDust', sans-serif;
    font-weight: bold;
   	font-size: 1vw;
	}
	
	.background-search {
    padding: 10px 14px;
    font-size: 15px;
    width: 300px;
    height: 37px; /* 👈 높이를 명시적으로 지정 */
    border: none;
    border-radius: 6px;
    background-color: #000;
    color: white;
    box-shadow: 0 0 8px rgba(123, 44, 191, 0.6);
    outline: none;
    transition: 0.2s ease;
    box-sizing: border-box; /* padding 포함한 크기 계산 */
    margin-top: 2px;
	}

	.background-search::placeholder {
    color: rgba(255, 255, 255, 0.5);
	}

    
    /* 왼쪽 영역 고정 */
	.background-left {
    flex: 8;
    padding: 20px;
    display: flex; /* 이거 꼭 추가 */
    flex-direction: column;
    border-right: 2px solid #311e4f;
    overflow: hidden; /* ← 중요: 전체 스크롤 막기 */
    position: relative;
	}
	
	/* 오른쪽 요소 오른쪽 끝으로 밀기 */
	.header-right {
	    display: flex;
	    align-items: center;
	    gap: 10px;
	    margin-left: auto
	    }
	
	.background-list {
	    display: grid;
	    grid-template-columns: repeat(auto-fill, minmax(150px, 1fr)); /* ← 이미지 크기 맞게 칸 자동 계산 */
	    gap: 1px 2px;               /* 이미지 간 간격 */
	    max-height: none;        /* 🔥 높이 제한 해제 */
	    overflow-y: auto;        /* 스크롤 가능 (필요 시) */
	    padding-right: 10px;     /* 스크롤바 공간 여유 */
	}
	
	/* 하단 버튼 박스 */
	.background-footer {
	    position: absolute;  
	    bottom: 10px;       
	    left: 20px;          
	    width: calc(100% - 40px); 
	    display: flex;
	    justify-content: flex-start;
	}
	
	@font-face {
	    font-family: 'PFStarDust';
	    src: url('fonts/PFStarDust-Bold.ttf') format('truetype');
	    font-weight: bold;
	    font-style: normal;
	}
	
	.background-footer button {
	 	width: 15%;
        margin: 5px;
        padding: 10px;
        border-radius: 8px;
        border: none;
        cursor: pointer;
        font-family: 'PFStarDust', sans-serif;
    	font-weight: bold;
   	 	font-size: 1vw;
    }
	
    .background-list-item {
	    position: relative;
	    text-align: center;
	}
	
	.delete-icon {
	    position: absolute;
	    top: 5px;
	    right: 10px;
	    width: 20px;
	    height: 20px;
	    opacity: 0;
	    transition: opacity 0.2s ease;
	    cursor: pointer;
	    z-index: 2;
	    background-color:transparent;
	}

	/* 마우스 오버 시 아이콘 보이게 */
	.background-list-item:hover .delete-icon {
	    opacity: 1;
	}

    .background-list-item input[type="checkbox"] {
	     position: absolute;
	    top: 5px;
	    left: 5px;
	    z-index: 1;
	}
	
	/* 체크된 상태 */
	.background-list-item input[type="checkbox"]:checked {
	    background-color: black;       /* 체크 시 검정색 채우기 */
	    border-color: white;
	}
	
	/* 체크된 상태에 체크 모양 (✓ 표시용) */
	.background-list-item input[type="checkbox"]:checked::after {
	    content: '✓';
	    color: white;
	    font-size: 11px;
	    font-weight: bold;
	    position: absolute;
	    top: 50%;
   	 	left: 50%;
    	transform: translate(-45%, -55%); /* 👈 수직 위치 살짝 위로 */
	}
	
	.background-list::-webkit-scrollbar {
	    width: 10px; /* 스크롤바 너비 */
	}
	
	.background-list::-webkit-scrollbar-track {
	    background: transparent; /* 트랙은 안 보이게 */
	}
	
	.background-list::-webkit-scrollbar-thumb {
	    background-color: white;  /* 스크롤바 색상 */
	    border-radius: 10px;
	    border: 2px solid transparent;
	    background-clip: content-box; /* 부드러운 느낌 */
	}
	
	.background-list::-webkit-scrollbar-button {
	    display: none; /* 🔥 위아래 화살표 제거 */
	}
	
	.background-image-button {
    border: none;
    background: none;
    padding: 0;
    cursor: pointer;
    border-radius: 8px;
    overflow: hidden;
    display: inline-block;
    transition: transform 0.2s ease;
}

.background-image-button:hover {
    transform: scale(1.03); /* 살짝 확대 효과 */
}

.background-image-button img {
    width: 150px;
    height: 150px;
    object-fit: cover;
    border-radius: 8px;
    display: block;
}
	
	
	/* 삭제 아이콘 */
	.background-list-item .iconPlusPlay {
	    position: absolute;
	    top: 8px;
	    left: 96%;
	    width: 25px;
	    height: 25px;
	    opacity: 0;
	    transition: opacity 0.2s ease;
	    cursor: pointer;
	    z-index: 2;
	}
	
	/* 마우스 오버 시 나타남 */
	.background-list-item:hover .iconPlusPlay {
	    opacity: 1;
	}
	
	.background-right {
	 margin-left: auto; /* 🔥 왼쪽 공간을 밀어서 오른쪽으로 이동 */
    justify-content: flex-end;
   	 	position: relative; /* 기준점 잡아줌 */
        flex: 3;
        padding: 10px;
        background-color: rgba(42, 18, 69, 0.5);
        display: flex;
    	border-top-right-radius: 15px;
    	border-bottom-right-radius: 15px;
        flex-direction: column;
        justify-content: space-between;
    }

	.backgroundImg {
	    width: 85%;           /* 부모 너비 꽉 채움 */
	    height: 270px;         /* 원하는 고정 높이 지정 */
	    object-fit: cover;     /* 이미지 비율 유지하며 꽉 채우고 넘치는 부분은 잘라냄 */
	    border-radius: 10px;   /* 둥근 테두리 유지 (선택 사항) */
	    box-shadow: 0 0 12px rgba(123, 44, 191, 0.6);
	}

    .background-controls {
        display: flex;
        justify-content: center;
        gap: 20px;
        font-size: 24px;
    }

    .background-description textarea {
    width: 100%;
    height: 200px;
    resize: none;
    border-radius: 10px;
    border: none;
    align-items: center;         /* 세로 가운데 */
    justify-content: center;     /* 가로 가운데 (텍스트 기준) */
    padding: 0;
    text-align: center;
    line-height: 100px;          /* 높이와 같게 맞춰서 가운데처럼 보이게 함 */

    /* ✅ 다크 스타일 추가 */
    background-color: #2e2e2e;   /* 짙은 회색 */
    color: white;                /* 흰 글자 */
    font-size: 14px;
    font-family: 'PFStarDust', sans-serif;
    box-shadow: 0 0 12px rgba(123, 44, 191, 0.4);  /* 살짝 보라빛 glow */
	}

    .background-cancel-button {
    display: flex;
    justify-content: center;
    margin-bottom: 12px;
	}
	
	.background-cancel-button button {
	    width: 80%;
	    height:40px;
	    padding: 12px;
	    border-radius: 8px;
	    border: none;
	    font-weight: bold;
	    font-size: 0.7vw;
	    cursor: pointer;
	    background-color: #7b2cbf;
	    color: white;
	    box-shadow: 0 0 8px rgba(123, 44, 191, 0.4);
	}
	
	/* 기존 버튼 영역 아래 좌우 배치 */
	.background-right-buttons {
	    display: flex;
	    justify-content: space-between;
	}
	
	.background-right-buttons button {
	    width: 30%;
	    height:40px;
	    padding: 5px;
	    border-radius: 8px;
	    border: 2px solid white;
	    background: none;
	    color: white;
	    font-weight: bold;
	    font-size: 0.9vw;
	    cursor: pointer;
	}

    .btn-purple {
        background-color: #7b2cbf;
        color: white;
    }

    .btn-dark {
        background-color: #444;
        color: white;
    }

    .btn-red {
        background-color: #b00020;
        color: white;
    }
    
    .iconbackground2 {
	    width: 2.5vw;
	    height: 2.5vw;
	    cursor: pointer;
    }
    
    .iconbackgroundList {
    width: 2vw;
	height: 2vw;
	cursor: pointer;
	}
	
	/* 검색창 크기 조절 */
	.background-search {
	    padding: 4px 8px;
	    font-size: 13px;
	    border-radius: 4px;
	    border: none;
	}
	
	/* 오른쪽 상단 고정 */
	.preview-icons {
	    position: absolute;
	    top: 12px;
	    right: 12px;
	    display: flex;
	    gap: 8px;
	}
	
	.background-preview {
    padding-top: 60px; /* 👈 아이콘 높이만큼 위에 여유 공간 줌 */
    text-align: center;
	}
	
	.background-preview h2 {
    margin-top: 5px;     /* 줄이거나 0으로 설정 가능 */
    margin-bottom: -3px;
    font-size: 1.1vw;    /* 사이즈도 적당히 */
	}
	
	#backgroundPlayListWrapper {
	    display: none;
	}
	
	#backgroundPlayListAddWrapper {
	    display: none;
	}
}
	
</style>

<div class="background-container">
    <!-- 왼쪽 영역 -->
    <div class="background-left">
    	<!-- 🎵 음악 목록 / 재생 목록 탭 -->
		<div class="background-tab">
	    	<button class="tab-btn active">배경화면</button>
	    	<button class="tab-btn" onclick="switchToPlayList()">타이머</button>
		</div>
    
        <div class="background-header">
		
		    <!-- 오른쪽: 정렬/검색 -->
		    <div class="header-right">
		        <img class="iconbackgroundList" src="icon/아이콘_글자순_1.png" alt="글자 순 정렬"  />
		        <input class="background-search" type="text" placeholder="배경 제목 검색" />
		        <img id="searchButton" class="iconbackgroundList" src="icon/아이콘_검색_1.png" alt="검색" >
		    </div>
		</div>

	<div class="background-list" id="backgroundList">
		<%
			String user_id = (String) session.getAttribute("user_id");
		    TemaMgr mgr = new TemaMgr();
			Vector<TemaBean> vlist = mgr.listTema(user_id); // 테마 리스트 가져오기
		
		    for (int i = 0; i < vlist.size(); i++) {
		        TemaBean bean = vlist.get(i);
		        int tema_id = bean.getTema_id();
		        String imgName = bean.getTema_img();
		        String title = bean.getTema_title();
		        String description = bean.getTema_cnt();
		%>
		    <div class="background-list-item" data-tema-id="<%= tema_id %>">
		        <button class="background-image-button"
		                onclick="selectBackground(this)"
		                data-img="<%= imgName %>"
		                data-title="<%= title %>"
		                data-description="<%= description %>">
		            <img src="<%= request.getContextPath() %>/jspproject/img/<%= imgName %>"
		                 alt="<%= title %>" />
		        </button>
		
		        <img class="delete-icon"
		             src="<%= request.getContextPath() %>/jspproject/icon/아이콘_삭제_1.png"
		             alt="삭제"
		             onclick="deleteImage(this)" />
		    </div>
		<%}%>
		
		<form id="updateTemaForm" action="updateTema.jsp" method="post" enctype="multipart/form-data" style="display:none;">
		    <input type="hidden" name="tema_id" id="updateTemaId">
		    <input type="hidden" name="tema_cnt" id="updateTemaCnt">
		    <input type="hidden" name="tema_title" id="updateTemaTitle">
		</form>

<input type="file" id="backgroundFileInput" accept="image/*" style="display: none;" />
		
</div>

		<!-- ✅ 업로드 폼 모달 or 인라인 -->
		<div id="uploadModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background-color: rgba(0,0,0,0.6); z-index:999; justify-content:center; align-items:center;">
		    <form id="uploadForm" action="uploadTema.jsp" method="post" enctype="multipart/form-data"
		          style="background:#1d102d; padding:20px; border-radius:12px; color:white; display:flex; flex-direction:column; gap:10px; width:300px;">
		        <h3 style="text-align:center;">배경 업로드</h3>
		        <input type="text" name="tema_title" placeholder="제목" required>
		        <input type="text" name="tema_cnt" placeholder="설명" required>
		        <input type="file" name="tema_img" accept="image/*" required>
		        <div style="display:flex; justify-content:space-between;">
		            <input type="submit" value="업로드" style="padding:8px 16px; background-color:#7b2cbf; color:white; border:none; border-radius:8px;">
		            <button type="button" onclick="closeUploadModal()" style="padding:8px 16px; background-color:#444; color:white; border:none; border-radius:8px;">취소</button>
		        </div>
		    </form>
		</div>


        <div class="background-footer">
            <button class="btn-purple" onclick="addbackgroundItem()" >업로드</button>
        </div>
    </div>

    <!-- 오른쪽 영역 -->
    <div class="background-right">
    	<div class="preview-icons">
    		<img class="iconbackgroundList" src="icon/아이콘_수정_1.png" alt="수정" onclick="enableBackgroundEditMode()">
    		<img class="iconbackgroundList" src="icon/아이콘_삭제_1.png" alt="삭제">
		</div>
		
			<div class="background-preview">
			    <img class="backgroundImg" src="backgroundImg/background1.gif" alt="배경 이미지">
			    <input id="backgroundTitleInput" type="text" value="배경 제목" disabled
			        style="text-align:center; font-size:1.1vw; margin-top:5px; background:none; border:none; color:white; font-family:'PFStarDust', sans-serif;">
			</div>

	 	 <div class="background-description">
		    <textarea id="backgroundDescription" readonly>배경 설명</textarea>
		</div>


        <!-- 가운데 위 버튼 -->
		<div class="background-cancel-button">
		    <button class="btn-purple">배경 취소</button>
		</div>
		
		<!-- 아래 좌우 버튼 -->
		<div class="background-right-buttons">
			<button class="btn-dark" id="submitBackgroundEditBtn" onclick="saveBackgroundDescription()" disabled>수정</button>
		    <button class="btn-purple">적용</button>
		</div>

    </div>
</div>

<input type="file" id="backgroundFileInput" accept="image/*" style="display: none;" />
<script>
//배경 설명 수정
function saveBackgroundDescription() {
    const description = document.querySelector(".background-description textarea").value;
    const title = document.getElementById("backgroundTitleInput").value; // 제목 가져오기
    const fileName = document.querySelector(".backgroundImg").src.split('/').pop();

    const items = document.querySelectorAll(".background-list-item");
    let temaId = null;

    items.forEach(item => {
        const btn = item.querySelector(".background-image-button");
        if (btn.getAttribute("data-img") === fileName) {
            temaId = item.getAttribute("data-tema-id");
        }
    });

    if (!temaId) {
        alert("선택된 항목의 ID를 찾을 수 없습니다.");
        return;
    }

    // 📌 제목도 form에 반영
    const form = document.getElementById("updateTemaForm");
    document.getElementById("updateTemaId").value = temaId;
    document.getElementById("updateTemaCnt").value = description;
    document.getElementById("updateTemaTitle").value = title; // 제목 전달

    const formData = new FormData(form);

    fetch("updateTema.jsp", {
        method: "POST",
        body: formData
    })
    .then(res => res.text())
    .then(result => {
        if (result.trim() === "ok") {
            alert("수정 완료!");
            disableBackgroundEditMode();

            // ✅ 리스트 항목의 description과 title 모두 갱신
            items.forEach(item => {
                const btn = item.querySelector(".background-image-button");
                if (btn.getAttribute("data-img") === fileName) {
                    btn.setAttribute("data-description", description);
                    btn.setAttribute("data-title", title); // 제목도 업데이트
                }
            });

            // ✅ 오른쪽 제목 인풋에도 다시 반영 (혹시 disabled였으면 다시 보이게)
            document.getElementById("backgroundTitleInput").value = title;

        } else {
            alert("수정 실패: " + result);
        }
    })
    .catch(err => {
        console.error("에러:", err);
        alert("에러 발생: " + err);
    });
}

function deleteImage(el) {
    const item = el.closest('.background-list-item');
    const temaId = item.getAttribute('data-tema-id');
    const deletedImgName = item.querySelector("img").getAttribute("src").split("/").pop(); // 삭제될 이미지 파일명

    if (confirm("정말 삭제하시겠습니까?")) {
        fetch("<%=request.getContextPath()%>/jspproject/deleteTema.jsp?tema_id=" + temaId)
            .then(res => res.json())
            .then(data => {
                if (data.status === "ok") {
                    item.remove();
                    alert("삭제되었습니다.");

                    // 현재 선택된 미리보기 이미지가 삭제된 이미지였다면 초기화
                    const previewImg = document.querySelector(".backgroundImg").src;
                    if (previewImg.includes(deletedImgName)) {
                        document.querySelector(".backgroundImg").src = "backgroundImg/background1.gif";
                        document.getElementById("backgroundTitleInput").value = "배경 제목";
                        document.querySelector(".background-description textarea").value = "배경 설명";
                    }
                } else {
                    alert("삭제 실패: " + data.message);
                }
            })
            .catch(err => {
                console.error("에러 발생:", err);
                alert("에러 발생: " + err);
            });
    }
}


function addbackgroundItem() {
    document.getElementById("uploadModal").style.display = "flex";  
}

function closeUploadModal() {
    document.getElementById("uploadModal").style.display = "none";
}

function selectBackground(button) {
    // 수정 모드였으면 자동으로 해제
    if (isEditMode) {
        disableBackgroundEditMode(); //수정모드해제
    }

    const imgName = button.getAttribute("data-img");
    const title = button.getAttribute("data-title");
    const description = button.getAttribute("data-description");

    selectedTemaId = button.closest('.background-list-item').getAttribute("data-tema-id");

    const contextPath = "<%= request.getContextPath() %>";
    const fullPath = contextPath + "/jspproject/img/" + imgName;

    // 🔄 오른쪽 영역 업데이트
    document.querySelector(".backgroundImg").src = fullPath;
    document.getElementById("backgroundTitleInput").value = title;
    document.querySelector(".background-description textarea").value = description;
}

document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.querySelector(".background-search");
    const searchButton = document.getElementById("searchButton");

    searchInput.addEventListener("input", function () {
        const keyword = this.value.toLowerCase();
        const items = document.querySelectorAll(".background-list-item");
        items.forEach(item => {
            const img = item.querySelector("img");
            const title = img.getAttribute("alt").toLowerCase();
            item.style.display = title.includes(keyword) ? "block" : "none";
        });
    });

    searchButton.addEventListener("click", function () {
        const keyword = searchInput.value.trim().toLowerCase();
        const items = document.querySelectorAll(".background-list-item");

        items.forEach(item => {
            const img = item.querySelector("img");
            const title = img.getAttribute("alt").toLowerCase();

            if (title === keyword || title === `${keyword}.gif`) {
                item.style.display = "block";
            } else {
                item.style.display = "none";
            }
        });
    });

    const uploadForm = document.getElementById("uploadForm");
    if (uploadForm) {
        uploadForm.addEventListener("submit", function (e) {
            e.preventDefault();

            const formData = new FormData(uploadForm);

            fetch("uploadTema.jsp", {
                method: "POST",
                body: formData
            })
            .then(res => res.json())
            .then(data => {
                if (data.status === "ok") {
                    alert("업로드 완료!");
                    closeUploadModal();

                    const button = appendNewBackgroundItem(data.tema_img, data.tema_title, data.tema_cnt);
                    selectBackground(button); // 새로 추가된 버튼을 선택
                } else {
                    alert("업로드 실패: " + data.message);
                }
            })
            .catch(err => {
                alert("에러 발생: " + err);
            });
        });
    }
});

function appendNewBackgroundItem(imgName, title, description) {
    const list = document.getElementById("backgroundList");

    const item = document.createElement("div");
    item.className = "background-list-item";
    item.setAttribute("data-tema-id", ""); // 필요시 서버에서 새 tema_id 응답 시 여기에 설정

    const button = document.createElement("button");
    button.className = "background-image-button";
    button.setAttribute("onclick", "selectBackground(this)");
    button.setAttribute("data-img", imgName);
    button.setAttribute("data-title", title);
    button.setAttribute("data-description", description);

    const img = document.createElement("img");
    img.src = "jspproject/img/" + imgName;
    img.alt = title;

    const deleteIcon = document.createElement("img");
    deleteIcon.className = "delete-icon";
    deleteIcon.src = "jspproject/icon/아이콘_삭제_1.png";
    deleteIcon.alt = "삭제";
    deleteIcon.setAttribute("onclick", "deleteImage(this)");

    button.appendChild(img);
    item.appendChild(button);
    item.appendChild(deleteIcon);
    list.appendChild(item);

    return button;
}

let isEditMode = false;

function enableBackgroundEditMode() {
    const descriptionArea = document.querySelector(".background-description textarea");
    //설명 수정가능하게
    descriptionArea.removeAttribute("readonly");
    descriptionArea.style.border = "1px solid white";
    descriptionArea.style.backgroundColor = "#2e2e2e"; 
    descriptionArea.style.color = "white"; 
    descriptionArea.focus();
    
    document.getElementById("submitBackgroundEditBtn").disabled = false;
    
    isEditMode = true;
}


function disableBackgroundEditMode() {
    const descriptionArea = document.querySelector(".background-description textarea");

    descriptionArea.setAttribute("readonly", true);
    descriptionArea.style.border = "none";
    descriptionArea.style.backgroundColor = "#2e2e2e";

    document.getElementById("submitBackgroundEditBtn").disabled = true;
    
    isEditMode = false;
}


</script>
