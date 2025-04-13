<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="TimerInfo.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>알람 타이머</title>
  <style>
    body {
      margin: 0;
      background: transparent;
      overflow: hidden;
    }

    .timer6-container {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 280px;
      height: 140px;
      border-radius: 20px;
      background: rgba(28, 27, 42, 0.5);
      backdrop-filter: blur(10px);
      user-select: none;
      cursor: default;
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.4);
      overflow: hidden;
    }

    /* 보라색 배경 차오름용 */
    .fill-effect {
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 0%;
      background: rgba(158, 87, 218, 0.3);
      border-radius: 20px;
      z-index: 0;
      pointer-events: none;
      transition: height 1s linear;
    }

    .timer6-body,
    .timer6-header {
      position: relative;
      z-index: 1;
    }

    .timer6-header {
      height: 32px;
      display: flex;
      justify-content: center;
      align-items: center;
      cursor: grab;
    }

    .drag-dots {
      font-size: 18px;
      color: white;
      letter-spacing: 4px;
      user-select: none;
    }

    .timer6-body {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: calc(100% - 32px);
      color: white;
    }

.timer6-time {
  font-size: 32px;
  font-weight: bold;
  margin-bottom: 12px;
  color: #ffffff;
  text-shadow:
    0 0 2px #ffffff,
    0 0 4px #ffffff,
    0 0 6px #ffffff;
}

    .timer6-time strong {
      cursor: pointer;
    }

    input.timer6-input {
      font-size: 28px;
      width: 60px;
      text-align: center;
      background: transparent;
      border: none;
      color: white;
      outline: none;
    }

    .timer6-controls {
      display: flex;
      gap: 20px;
    }

    .timer6-btn {
      background: none;
      border: none;
      cursor: pointer;
      color: white;
      font-size: 22px;
    }

    .timer6-btn img {
      width: 26px;
      height: 26px;
    }

    .timer6-btn.reset img {
      width: 24px;
      height: 24px;
      filter: brightness(0) invert(1);
    }
  </style>
</head>
<body>
<div class="timer6-container" id="timerContainer" style="left:<%= left %>px; top:<%= top %>px; <%= extraStyle %>">
  <div class="fill-effect" id="fillEffect"></div> <!-- 차오르는 효과 -->
  <div class="timer6-header" id="dragHandle">
    <div class="drag-dots">⋮⋮⋮</div>
  </div>
  <div class="timer6-body">
    <div class="timer6-time" id="timeDisplay">
      <strong id="editableTime">00:00</strong>
    </div>
    <div class="timer6-controls">
      <button class="timer6-btn reset" id="btnReset">
        <img src="img/재설정.png" alt="reset" />
      </button>
      <button class="timer6-btn" id="toggleBtn">
        <img id="toggleIcon" src="icon/아이콘_재생_1.png" alt="play" />
      </button>
    </div>
  </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
  const userId = "<%= user_id %>";
  let sessionDuration = <%= sessionTime %>; // DB 세션시간
  let breakDuration = <%= breakTime %>;     // DB 휴식시간
  let timeLeft = breakDuration;
  let isRunning = false;
  let interval = null;

  const editableTime = document.getElementById("editableTime");
  const toggleIcon = document.getElementById("toggleIcon");
  const btnReset = document.getElementById("btnReset");
  const toggleBtn = document.getElementById("toggleBtn");
  const timer = document.getElementById("timerContainer");
  const dragHandle = document.getElementById("dragHandle");
  const fillEffect = document.getElementById("fillEffect");

  const formatTime = (sec) => {
    const m = Math.floor(sec / 60);
    const s = sec % 60;
    return m + ":" + String(s).padStart(2, '0');
  };

  const updateDisplay = () => {
    editableTime.textContent = formatTime(timeLeft);
    const percent = ((breakDuration - timeLeft) / breakDuration) * 100;
    fillEffect.style.height = percent + "%";
  };

  const resetTimer = () => {
    clearInterval(interval);
    isRunning = false;
    timeLeft = breakDuration;
    toggleIcon.src = "icon/아이콘_재생_1.png";
    updateDisplay();
  };

  const updateTimerSettingToDB = () => {
    fetch("UpdateTimerSessionProc.jsp", {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: "user_id=" + userId + "&timer_session=" + sessionDuration + "&timer_break=" + breakDuration
    }).then(res => res.text())
      .then(data => console.log("Timer6 시간 저장 결과 : ", data));
  };

  toggleBtn.addEventListener("click", () => {
    if (isRunning) {
      clearInterval(interval);
      isRunning = false;
      toggleIcon.src = "icon/아이콘_재생_1.png";
    } else {
      interval = setInterval(() => {
        if (timeLeft > 0) {
          timeLeft--;
          updateDisplay();
        } else {
          clearInterval(interval);
          isRunning = false;
          toggleIcon.src = "icon/아이콘_재생_1.png";
        }
      }, 1000);
      isRunning = true;
      toggleIcon.src = "icon/아이콘_일시정지_1.png";
    }
  });

  btnReset.addEventListener("click", resetTimer);

  editableTime.addEventListener("click", () => {
    const input = document.createElement("input");
    input.type = "number";
    input.className = "timer6-input";
    input.value = Math.floor(breakDuration / 60);

    const confirm = () => {
      let val = parseInt(input.value);
      if (isNaN(val) || val < 1) val = 1;
      if (val > 3600) val = 3600;
      breakDuration = val * 60;
      timeLeft = breakDuration;
      updateDisplay();
      updateTimerSettingToDB();
      input.replaceWith(editableTime);
    };

    input.addEventListener("blur", confirm);
    input.addEventListener("keydown", (e) => { if (e.key === "Enter") confirm(); });
    editableTime.replaceWith(input);
    input.focus();
  });

  updateDisplay();

  // 드래그
  let isDragging = false;
  let offsetX = 0;
  let offsetY = 0;

  dragHandle.addEventListener("mousedown", (e) => {
    e.preventDefault();
    const rect = timer.getBoundingClientRect();
    offsetX = e.clientX - rect.left;
    offsetY = e.clientY - rect.top;
    isDragging = true;
    document.body.style.cursor = "grabbing";

    timer.style.left = rect.left + window.scrollX + "px";
    timer.style.top = rect.top + window.scrollY + "px";
    timer.style.transform = "none";
  });

  document.addEventListener("mousemove", (e) => {
    if (!isDragging) return;
    timer.style.left = (e.clientX - offsetX) + "px";
    timer.style.top = (e.clientY - offsetY) + "px";
  });

  document.addEventListener("mouseup", () => {
    if (isDragging) {
      isDragging = false;
      document.body.style.cursor = "default";
      const x = parseInt(timer.style.left);
      const y = parseInt(timer.style.top);

      fetch("UpdateTimerSessionProc.jsp", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: "user_id=" + userId + "&timer_loc=" + x + "," + y
      }).then(res => res.text())
        .then(data => console.log("Timer6 위치 저장 결과 : ", data));
    }
  });
});
</script>

</body>
</html>
