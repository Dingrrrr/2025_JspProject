<!-- musicList.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <style>
    .music-container {
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

	.music-tab {
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

    .music-header, .music-list{
        margin-bottom: 15px;
    }

    .music-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #555;
    padding-bottom: 8px;
    font-family: 'PFStarDust', sans-serif;
    font-weight: bold;
   	font-size: 1vw;
	}
    
    .music-header input[type="checkbox"] {
    appearance: none;
    width: 18px;
    height: 18px;
    border: 2px solid #ccc;
    border-radius: 4px;
    margin-left: 14px;
    margin-right: 10px;
    cursor: pointer;
    transition: all 0.2s ease;
    position: relative;
    background-color: white;

    vertical-align: middle;
    margin-top: -1px; /* ✅ 살짝 위로 올림 */
	}
	
	/* 체크된 상태 */
	.music-header input[type="checkbox"]:checked {
	    background-color: black;       /* 체크 시 검정색 채우기 */
	    border-color: white;
	}
	
	/* 체크된 상태에 체크 모양 (✓ 표시용) */
	.music-header input[type="checkbox"]:checked::after {
	    content: '✓';
	    color: white;
	    font-size: 11px;
	    font-weight: bold;
	    position: absolute;
	    top: 50%;
   	 	left: 50%;
    	transform: translate(-45%, -55%); /* 👈 수직 위치 살짝 위로 */
	}
	
	.music-search {
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

	.music-search::placeholder {
    color: rgba(255, 255, 255, 0.5);
	}

    
    /* 왼쪽 영역 고정 */
	.music-left {
    flex: 8;
    padding: 20px;
    display: flex; /* 이거 꼭 추가 */
    flex-direction: column;
    border-right: 2px solid #311e4f;
    overflow: hidden; /* ← 중요: 전체 스크롤 막기 */
	}
	
	/* 오른쪽 요소 오른쪽 끝으로 밀기 */
	.header-right {
	    display: flex;
	    align-items: center;
	    gap: 10px;
	}
	
	.music-list {
	    flex: 1;
	    overflow-y: auto;
	    max-height: 100%; /* ← 최대 높이로 설정 */
	    padding-right: 4px;
	    margin-bottom: 10px;
	}
	
	/* 하단 버튼 박스 */
	.music-footer {
	    display: flex;
	    margin-top: 10px;
	    justify-content: space-between; /* 양쪽 끝으로 배치 */
	}
	
	@font-face {
	    font-family: 'PFStarDust';
	    src: url('fonts/PFStarDust-Bold.ttf') format('truetype');
	    font-weight: bold;
	    font-style: normal;
	}
	
	.music-footer button {
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
	
    .music-list-item {
    	position: relative;
        background-color: #3c1e5c;
        margin-bottom: 12px;
        padding: 10px;
        border-radius: 8px;
        display: flex;
        align-items: center;
        gap: 5px;
    }

    .music-list-item input[type="checkbox"] {
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
	.music-list-item input[type="checkbox"]:checked {
	    background-color: black;       /* 체크 시 검정색 채우기 */
	    border-color: white;
	}
	
	/* 체크된 상태에 체크 모양 (✓ 표시용) */
	.music-list-item input[type="checkbox"]:checked::after {
	    content: '✓';
	    color: white;
	    font-size: 11px;
	    font-weight: bold;
	    position: absolute;
	    top: 50%;
   	 	left: 50%;
    	transform: translate(-45%, -55%); /* 👈 수직 위치 살짝 위로 */
	}
	
	.music-list::-webkit-scrollbar {
	    width: 10px; /* 스크롤바 너비 */
	}
	
	.music-list::-webkit-scrollbar-track {
	    background: transparent; /* 트랙은 안 보이게 */
	}
	
	.music-list::-webkit-scrollbar-thumb {
	    background-color: white;  /* 스크롤바 색상 */
	    border-radius: 10px;
	    border: 2px solid transparent;
	    background-clip: content-box; /* 부드러운 느낌 */
	}
	
	.music-list::-webkit-scrollbar-button {
	    display: none; /* 🔥 위아래 화살표 제거 */
	}
	
	/* 삭제 아이콘 */
	.music-list-item .iconPlusPlay {
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
	
	.header-left {
    display: flex;
    align-items: center; /* 세로 정렬 */
	}
	
	
	/* 마우스 오버 시 나타남 */
	.music-list-item:hover .iconPlusPlay {
	    opacity: 1;
	}
	
	.music-right {
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

	.musicImg {
	    width: 85%;           /* 부모 너비 꽉 채움 */
	    height: 270px;         /* 원하는 고정 높이 지정 */
	    object-fit: cover;     /* 이미지 비율 유지하며 꽉 채우고 넘치는 부분은 잘라냄 */
	    border-radius: 10px;   /* 둥근 테두리 유지 (선택 사항) */
	    box-shadow: 0 0 12px rgba(123, 44, 191, 0.6);
	}

    .music-controls {
        display: flex;
        justify-content: center;
        gap: 20px;
        font-size: 24px;
    }

    .music-description textarea {
    width: 100%;
    height: 100px;
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

    .music-cancel-button {
    display: flex;
    justify-content: center;
    margin-bottom: 12px;
	}
	
	.music-cancel-button button {
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
	.music-right-buttons {
	    display: flex;
	    justify-content: space-between;
	}
	
	.music-right-buttons button {
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
    
    .iconMusic2 {
	    width: 2.5vw;
	    height: 2.5vw;
	    cursor: pointer;
    }
    
    .iconMusicList {
    width: 2vw;
	height: 2vw;
	cursor: pointer;
	}
	
	/* 검색창 크기 조절 */
	.music-search {
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
	
	.music-preview {
    padding-top: 60px; /* 👈 아이콘 높이만큼 위에 여유 공간 줌 */
    text-align: center;
	}
	
	.music-preview h2 {
    margin-top: 20px;     /* 줄이거나 0으로 설정 가능 */
    margin-bottom: -3px;
    font-size: 1.1vw;    /* 사이즈도 적당히 */
	}
	
	#musicPlayListWrapper {
	    display: none;
	}
	
	#musicPlayListAddWrapper {
	    display: none;
	}
	
	#musicPlayListDetailWrapper {
	    display: none;
	}
}
	
</style>
        
</head>

<body>
<div class="music-container">
    <!-- 왼쪽 영역 -->
    <div class="music-left">
    	<!-- 🎵 음악 목록 / 재생 목록 탭 -->
		<div class="music-tab">
	    	<button class="tab-btn active">음악 목록</button>
	    	<button class="tab-btn" onclick="switchToPlayList()">재생 목록</button>
		</div>
    
        <div class="music-header">
		    <!-- 왼쪽: 전체 선택 -->
		    <div class="header-left">
		        <input type="checkbox" id="selectAll">
		        <label for="selectAll">전체 선택</label>
		    </div>
		
		    <!-- 오른쪽: 정렬/검색 -->
		    <div class="header-right">
		        <img class="iconMusicList" src="icon/아이콘_글자순_1.png" alt="글자 순 정렬" >
		        <input class="music-search" type="text" placeholder="음악 제목 검색" />
		        <img class="iconMusicList" src="icon/아이콘_검색_1.png" alt="검색" >
		    </div>
		</div>

        <div class="music-list" id="musicList">
        	<% for (int i = 0; i < 20; i++) { %>
			    <div class="music-list-item">
			        <input type="checkbox" />
			        <span>음악 제목<%= i + 1 %></span>
			        <img class="iconPlusPlay" src="icon/아이콘_플레이리스트추가_1.png" alt="추가">
			    </div>
			<% } %>
        </div>

        <div class="music-footer">
            <button class="btn-purple" onclick="addMusicItem()" >추가</button>
            <button class="btn-red delete-selected">삭제</button>
        </div>
    </div>

    <!-- 오른쪽 영역 -->
    <div class="music-right">
    	<div class="preview-icons">
    		<img class="iconMusicList" src="icon/아이콘_수정_1.png" alt="수정" >
    		<img class="iconMusicList" src="icon/아이콘_삭제_1.png" alt="삭제">
		</div>
		
        <div class="music-preview">
            <img class = "musicImg" src="musicImg/music1.gif" alt="음악 이미지">
            <h2 style="text-align:center;">음악 제목</h2>
        </div>

        <div class="music-controls">
            <span><img class = "iconMusic2" src="icon/아이콘_이전음악_1.png" border="0" alt="음악 재생" ></span>
            <span><img class = "iconMusic2" src="icon/아이콘_재생_1.png" border="0" alt="음악 재생" > </span>
            <span><img class = "iconMusic2" src="icon/아이콘_다음음악_1.png" border="0" alt="다음 음악 재생" > </span>
        </div>

        <div class="music-description">
            <textarea>음악 설명</textarea>
        </div>

        <!-- 가운데 위 버튼 -->
		<div class="music-cancel-button">
		    <button class="btn-purple">음악 취소</button>
		</div>
		
		<!-- 아래 좌우 버튼 -->
		<div class="music-right-buttons">
		    <button class="btn-dark">수정</button>
		    <button class="btn-purple">적용</button>
		</div>

    </div>
</div>

<!-- 재생목록 리스트 영역 (처음엔 숨김) -->
<div id="musicPlayListWrapper">
    <jsp:include page="musicPlayList.jsp" />
</div>

<!-- 재생목록 추가 영역 (처음엔 숨김) -->
<div class = "add-playlist-container" id="musicPlayListAddWrapper"> 
    <jsp:include page="musicListAdd.jsp" />
</div>

<!-- 재생목록 상세 정보 영역 (처음엔 숨김) --> 
<jsp:include page="musicPlayListDetail.jsp" />

</body>
</html>

<script>
	// 음악 리스트 추가하는 간략한 코드 (ChatGpt가 짜줌)
	function addMusicItem() {
	    // 1. 음악 리스트 DOM 가져오기
	    const musicList = document.getElementById('musicList');
	    // 2. 새 항목 만들기
	    const newItem = document.createElement('div');
	    newItem.className = 'music-list-item';
	    newItem.innerHTML =
	        '<input type="checkbox" />' +
	        '<span>음악 제목' + (musicList.children.length + 1) + '</span>';
	    // 3. 리스트에 추가
	    musicList.appendChild(newItem);
	}
	
	// 체크박스 선택 삭제 관련 코드 (ChatGpt가 짜줌)
	document.addEventListener('DOMContentLoaded', function () {
	    const selectAll = document.getElementById('selectAll');
	    const musicList = document.getElementById('musicList');
	    const deleteBtn = document.querySelector('.delete-selected'); // 버튼 하나만 선택!
	
	    // 전체 선택 체크박스
	    selectAll.addEventListener('change', function () {
	        const checkboxes = musicList.querySelectorAll('input[type="checkbox"]');
	        checkboxes.forEach(cb => cb.checked = selectAll.checked);
	    });
	
	    // 개별 체크박스 변경 → 전체 선택 상태 갱신
	    musicList.addEventListener('change', function (e) {
	        if (e.target.type === 'checkbox') {
	            const checkboxes = musicList.querySelectorAll('input[type="checkbox"]');
	            const checkedCount = Array.from(checkboxes).filter(cb => cb.checked).length;
	            selectAll.checked = checkedCount === checkboxes.length;
	        }
	    });
	
	    // ✅ 삭제 버튼 하나에만 기능 적용
	    deleteBtn.addEventListener('click', function () {
	        const items = musicList.querySelectorAll('.music-list-item');
	        items.forEach(item => {
	            const checkbox = item.querySelector('input[type="checkbox"]');
	            if (checkbox && checkbox.checked) {
	                item.remove();
	            }
	        });
	        selectAll.checked = false;
	    });
	});
	
	function switchToPlayList() {
	    const musicListContainer = document.querySelector('.music-container'); // 음악 목록
	    const playListContainer = document.querySelector('#musicPlayListWrapper'); // 재생 목록
	    const detailContainer = document.querySelector('#musicPlayListDetailWrapper'); // 상세 목록

	    // 내부 컨테이너도 명시적으로
	    const innerContainer = playListContainer?.querySelector('.music-container2');

	    if (musicListContainer) musicListContainer.style.display = 'none';
	    if (detailContainer) detailContainer.style.display = 'none';
	    if (playListContainer) playListContainer.style.display = 'flex';
	    if (innerContainer) innerContainer.style.display = 'flex'; // 이거 추가!
	}

	document.addEventListener('DOMContentLoaded', function () {
		  const plusIcons = document.querySelectorAll('.iconPlusPlay');
		  const playlistContainer = document.querySelector('.add-playlist-container');

		  plusIcons.forEach(icon => {
		    icon.addEventListener('click', function (e) {
		      if (!playlistContainer) return;

		      // 위치 계산
		      const iconRect = this.getBoundingClientRect();
		      const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
		      const scrollLeft = window.pageXOffset || document.documentElement.scrollLeft;

		      playlistContainer.style.position = 'absolute';
		      playlistContainer.style.top = (iconRect.bottom + scrollTop + 5) + 'px';
		      playlistContainer.style.left = (iconRect.left + scrollLeft-180) + 'px';
		      playlistContainer.style.display = 'block';
		    });
		  });

		  // 바깥 클릭 시 숨김
		  document.addEventListener('click', function (e) {
		    if (
		      !e.target.classList.contains('iconPlusPlay') &&
		      !e.target.closest('.add-playlist-container')
		    ) {
		      playlistContainer.style.display = 'none';
		    }
		  });
		});
	
</script>
