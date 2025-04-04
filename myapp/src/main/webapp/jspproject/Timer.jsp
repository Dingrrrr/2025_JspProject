<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>타이머 팝업</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/jspproject/css/Timer.css" />
</head>
<body>
  <div class="popup" id="timerPopup">
    <div class="content-wrapper">
      <div class="left-panel">
        <div class="top-tabs" id="dragHandle">
          <div>배경화면</div>
          <div>타이머</div>
        </div>

        <div class="search-bar">
          <button><img src="icon/아이콘_오래된순_최신순_1.png" alt="오래된순" /></button>
          <button><img src="icon/아이콘_글자순_1.png" alt="글자순" /></button>
          <input type="text" placeholder="타이머 검색" />
          <button><img src="icon/아이콘_검색_1.png" alt="검색" /></button>
        </div>

        <div class="grid" id="timerGrid"></div>
      </div>

      <div class="right-panel">
        <div class="panel-icons">
          <img src="img/setting.png" alt="설정" class="icon-btn" />
          <img src="img/delete.png" alt="삭제" class="icon-btn" />
        </div>
        <div class="preview-box" id="timerPreviewBox"></div>
        <div class="timer-title">타이머 설정</div>
        <textarea class="desc-box" placeholder="타이머 설명"></textarea>
        <button class="cancel-btn">타이머 취소</button>
        <div class="apply-wrap">
          <button class="apply-btn" onclick="applyTimer()">적용</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    let selectedTimer = null;

    const timerData = [
      "15:00", "10:00 ▶", "⏱ 25분", "🔋 진행률",
      "00:30", "퍼센트 바", "03:00", "⭕ 5분",
      "12:00", "⏳ 시작", "25", "▶ 00:45",
      "🕒 01:15", "게이지바", "15분", "▶ 5분",
      "00:10", "타임업", "휴식 10분", "⏱ 01:00"
    ];

    const styles = {
      1: "<div style='width:100px;height:100px;border:6px solid #683FE2;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:20px;color:white;'>15:00</div>",
      2: "<div style='width:140px;height:50px;background:#F0F0F0;border-radius:10px;display:flex;justify-content:space-around;align-items:center;font-size:16px;color:black;'><span>10:00</span> ▶</div>",
      3: "<div style='font-size:22px;color:white;padding:10px;'>⏱ 25분 집중</div>",
      4: "<div style='width:20px;height:100px;background:#ddd;position:relative;border-radius:10px;'><div style='width:100%;height:60%;background:#683FE2;position:absolute;bottom:0;border-radius:10px 10px 0 0;'></div></div>",
      5: "<div style='font-size: 24px; color: white;'>00:30</div>",
      6: "<div style='width: 120px; height: 12px; background-color: #eee;'><div style='width: 40%; height: 100%; background-color: #683FE2;'></div></div>",
      7: "<div style='background: #f5f5f5; padding: 20px; border-radius: 8px;'>03:00</div>",
      8: "<div style='width: 100px; height: 100px; border: 2px dashed #683FE2; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 18px; color: white;'>5분</div>",
      9: "<div style='background: white; padding: 12px 16px; border-radius: 8px; color: #000;'>12:00</div>",
      10: "<div style='font-size: 20px; color: white;'>⏳ 지중 시작</div>",
      11: "<div style='width: 60px; height: 60px; background: #683FE2; color: white; display: flex; align-items: center; justify-content: center; border-radius: 4px;'>25</div>",
      12: "<div style='background: #ddd; padding: 16px 20px; border-radius: 8px;'>▶ 00:45</div>",
      13: "<div style='display: flex; gap: 8px; color: white;'>🕒 <span>01:15</span></div>",
      14: "<div style='width: 100px; height: 8px; background: #ccc;'><div style='width: 70%; height: 100%; background: #683FE2;'></div></div>",
      15: "<div style='color: white;'>15분</div>",
      16: "<div style='color: white;'>▶ 5분</div>",
      17: "<div style='color: white;'>00:10</div>",
      18: "<div style='color: #683FE2;'>타임업</div>",
      19: "<div style='color: white;'>휴식 10분</div>",
      20: "<div style='color: white;'>⏱ 01:00</div>"
    };

    const grid = document.getElementById("timerGrid");
    timerData.forEach((label, index) => {
      const div = document.createElement("div");
      div.textContent = label;
      div.onclick = () => selectTimer(index + 1);
      grid.appendChild(div);
    });

    function selectTimer(num) {
      selectedTimer = num;
      const previewBox = document.getElementById("timerPreviewBox");
      previewBox.innerHTML = styles[num] || `<div style='color:white;'>${timerData[num - 1]}</div>`;
    }

    function applyTimer() {
      if (selectedTimer === null) {
        alert("먼저 타이머를 선택해주세요!");
        return;
      }
      alert(`타이머 ${selectedTimer}번이 적용되었습니다!`);
    }

    function makeDraggable(popup, handle) {
      let offsetX = 0, offsetY = 0, isDragging = false;
      handle.onmousedown = function (e) {
        isDragging = true;
        offsetX = e.clientX - popup.offsetLeft;
        offsetY = e.clientY - popup.offsetTop;
        document.onmousemove = function (e) {
          if (!isDragging) return;
          popup.style.left = e.clientX - offsetX + 'px';
          popup.style.top = e.clientY - offsetY + 'px';
        };
        document.onmouseup = function () {
          isDragging = false;
          document.onmousemove = null;
          document.onmouseup = null;
        };
      };
    }

    window.onload = function () {
      const popup = document.getElementById('timerPopup');
      const handle = document.getElementById('dragHandle');
      makeDraggable(popup, handle);
    };
  </script>
</body>
</html>