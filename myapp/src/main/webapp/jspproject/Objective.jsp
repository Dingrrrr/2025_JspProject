<!-- Objective.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘, 내일</title>
<style>
@font-face {
	font-family: 'PFStarDust';
	src: url('fonts/PFStarDust-Bold.ttf') format('truetype');
	font-weight: bold;
	font-style: normal;
}

.pf-font {
	font-family: 'PFStarDust', sans-serif !important;
	color: white;
}


.obj-card-wrapper {
	background-color: rgba(29, 16, 45, 0.35); /* 기존 #1d102d = rgb(29,16,45) */
	padding: 5px;
	border-radius: 15px;
	box-shadow: 0 0 20px rgba(255,255,255,0.4);
	position: absolute;
	top: 100px;
	left: 100px;
	cursor: grab;
}

.obj-todo-card {
	width: 500px;
	height: 540px;
	padding: 20px;
	border-radius: 16px;
	background-color: rgba(29, 16, 45, 0.3); /* 기존 #1d102d = rgb(29,16,45) */
	position: relative;
	color: white;
	text-align: center;
}

.obj-top-dots {
	position: absolute;
	top: 5px;
	left: 50%;
	transform: translateX(-50%);
	font-size: 28px;
	color: white;
	cursor: grab;
	user-select: none;
}

.obj-todo-header {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-top: 60px;
}

.obj-todo-title {
	background: none;
	border: 1px solid white;
	border-radius: 10px;
	color: white;
	font-size: 16px;
	padding: 10px 15px;
	width: 350px;
}

.obj-edit-btn {
	background: none;
	border: 1px solid white;
	border-radius: 10px;
	color: white;
	font-size: 18px;
	padding: 10px 15px;
	cursor: pointer;
}

.obj-completed {
	position: absolute;
	top: 130px;
	left: 50px;
	font-size: 20px;
	color: white;
}

#obj-taskList {
	margin-top: 65px;
	margin-left: 20px;
	padding: 0 10px;
	display: flex;
	flex-direction: column;
	gap: 5px;
	height: 290px; /* ✅ 높이 고정 */
	overflow-y: auto; /* ✅ 스크롤 가능 */
	margin-bottom:20px;
}

#obj-taskList::-webkit-scrollbar {
    width: 10px;
}

#obj-taskList::-webkit-scrollbar-track {
    background: transparent;
}

#obj-taskList::-webkit-scrollbar-thumb {
    background-color: white;
    border-radius: 10px;
    border: 2px solid transparent;
    background-clip: content-box;
}

#obj-taskList::-webkit-scrollbar-button {
    display: none;
}

.obj-task-item {
	width: 419px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	background-color: #3c1e5c;
	color:white;
	border-radius: 10px;
	padding: 10px;
	position: relative;
	box-shadow: 0 0 8px rgba(123, 44, 191, 0.6);
	margin-bottom:5px;
}

.obj-task-left {
	display: flex;
	align-items: center;
	gap: 10px;
	flex: 1;
}

.obj-task-left input[type="text"] {
	background: none;
	border: none;
	color: white;
	font-size: 16px;
}

.obj-task-left input[type="checkbox"] {
	appearance: none;
    width: 20px;
    height: 20px;
    border: 2px solid #ccc;
    border-radius: 4px;
    margin-left: 14px;
    cursor: pointer;
    transition: all 0.2s ease;
    position: relative;
    background-color: white;
}

/* 체크된 상태 */
.obj-task-left input[type="checkbox"]:checked {
	background-color: black;       /* 체크 시 검정색 채우기 */
	border-color: white;
}
	
/* 체크된 상태에 체크 모양 (✓ 표시용) */
.obj-task-left input[type="checkbox"]:checked::after {
	content: '✓';
	color: white;
	font-size: 11px;
	font-weight: bold;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-45%, -55%); /* 👈 수직 위치 살짝 위로 */
}

.obj-created-date {
	display: inline-block;
	font-size: 14px;
	color: white;
}

.obj-task-buttons {
	display: none;
	gap: 5px;
}

.obj-task-buttons button {
	background: none;
	border: none;
	color: white;
	font-size: 18px;
	cursor: pointer;
}

.obj-task-item:hover .obj-task-buttons {
	display: flex;
}

.obj-task-item:hover .obj-created-date {
	display: none;
}

.obj-add-task-btn {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	bottom: 10px;
	width: 400px;
	height: 60px;
	padding: 10px;
	border-radius: 10px;
	background-color: rgba(255, 255, 255, 0.1);
	border: 1px solid white;
	color: white;
	cursor: pointer;
	font-size: 18px;
	margin-bottom:20px;
	font-family: 'PFStarDust', sans-serif;
}

#calendarModal {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: none;
	z-index: 9999;
}

.calendar-content {
	width: 500px;
	height: 500px;
	padding: 20px;
	border-radius: 16px;
	background-color: rgba(30, 0, 50, 0.95);
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
	position: absolute;
	border: 2px solid white;
	color: white;
	overflow-y: auto;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	transition: all 0.3s ease;
}
</style>
</head>
<body>
	<div class="obj-card-wrapper" id="cardWrapper">
		<div class="obj-todo-card">
			<div class="obj-top-dots" id="dragHandle">:::</div>
			<div class="obj-todo-header" id="listButtonContainer"></div>
			<p class="obj-completed">
				완료된 항목 : <span id="completedNum">0</span>/<span id="totalNum">0</span>
			</p>
			
			<!-- ✅ 과제 리스트 영역을 form으로 감싸기 -->
			<form id="taskForm" onsubmit="return false;">
				<div id="obj-taskList"></div>
				<button type="button" class="obj-add-task-btn">과제 추가하기</button>
			</form>
		</div>
	</div>

	<!-- ✅ 마감일 설정용 달력 폼 -->
	<div id="calendarModal">
		<div class="calendar-content" id="calendarContent">
			<form id="calendarForm" onsubmit="return false;" style="display: flex; flex-direction: column; align-items: center;">
				<p id="calendarTitle" style="font-size: 20px; margin-bottom: 20px;">마감일 설정:</p>
				<input type="date" id="calendarPicker"
					style="padding: 10px; border-radius: 10px; border: none;"><br><br>
				<button id="confirmDateBtn" type="submit"
					style="padding: 10px 20px; font-size: 16px; border-radius: 10px; background-color: rgba(255, 255, 255, 0.1); border: 1px solid white; color: white; cursor: pointer;">날짜 확인</button>
			</form>
		</div>
	</div>

	<!-- 기존 목록 추가용 div -->
	<div id="newListCard" style="display: none;">
		<div class="calendar-content" style="text-align: center;">
			<form id="newListForm" onsubmit="return false;">
				<input type="text" class="pf-font" placeholder="새로운 목록"
					style="width: 80%; padding: 10px; border-radius: 10px; border: none; margin-bottom: 20px; font-family: 'PFStarDust', sans-serif;"><br>
				<button type="submit"
					style="margin-bottom: 10px; width: 80%; padding: 10px; border-radius: 10px; border: 1px solid white; background: none; color: white;">+
					리스트 추가하기</button><br>
				<button type="button"
					style="width: 80%; padding: 10px; border-radius: 10px; border: 1px solid white; background: none; color: white;">목록 확인</button>
			</form>
		</div>
	</div>

	<script>
        const handle = document.getElementById('dragHandle');
        const cardWrapper = document.getElementById('cardWrapper');
        const calendarContent = document.getElementById('calendarContent');
        const taskList = document.getElementById('obj-taskList');
        const addBtn = document.querySelector('.obj-add-task-btn');
        const calendarModal = document.getElementById('calendarModal');
        const calendarTitle = document.getElementById('calendarTitle');
        const calendarPicker = document.getElementById('calendarPicker');
        const confirmDateBtn = document.getElementById('confirmDateBtn');
        let currentTargetTask = null;

        let isDragging = false, offsetX = 0, offsetY = 0;
        handle.addEventListener('mousedown', (e) => {
            isDragging = true;
            offsetX = e.clientX - cardWrapper.offsetLeft;
            offsetY = e.clientY - cardWrapper.offsetTop;
            handle.style.cursor = 'grabbing';
        });
        document.addEventListener('mousemove', (e) => {
            if (isDragging) {
                cardWrapper.style.left = (e.clientX - offsetX) + 'px';
                cardWrapper.style.top = (e.clientY - offsetY) + 'px';
            }
        });
        document.addEventListener('mouseup', () => {
            isDragging = false;
            handle.style.cursor = 'grab';
        });

        function getFormattedDate() {
            const today = new Date();
            const year = today.getFullYear();
            const month = String(today.getMonth() + 1).padStart(2, '0');
            const day = String(today.getDate()).padStart(2, '0');
            return `${year}/${month}/${day}`;
        }

        function updateCompleteCount() {
            const allTasks = document.querySelectorAll('#obj-taskList .obj-task-item');
            const total = allTasks.length;
            let completed = 0;

            allTasks.forEach(task => {
                const checkbox = task.querySelector('input[type="checkbox"]');
                if (checkbox && checkbox.checked) completed++;
            });

            document.getElementById('completedNum').textContent = completed;
            document.getElementById('totalNum').textContent = total;
        }
        //기본 1개의 리스트를 제공
        function createDefaultGroupOnce() {
            fetch("insertObjGroup.jsp", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "objgroup_name=" + encodeURIComponent("기본 리스트")
            })
            .then(res => res.text())
            .then(id => {
                console.log("✅ 기본 리스트 DB에 생성됨:", id);
                localStorage.setItem("currentList", id); // 바로 기본 리스트로 지정
                reloadCategoryButtons(); // UI 리로드
                renderTasksForCurrentList(); // 과제 표시
            })
            .catch(err => {
                console.error("❌ 기본 리스트 생성 실패:", err);
            });
        }

        


        addBtn.addEventListener('click', () => {
            const currentList = localStorage.getItem("currentList");
            if (!currentList) return alert("리스트를 먼저 선택해주세요!");

            const taskData = JSON.parse(localStorage.getItem("taskData") || "{}");
            const today = getFormattedDate(); // ✅ 여기에서만 선언

            const newTask = {
                title: "",
                checked: false,
                date: today
            };

            if (!taskData[currentList]) taskData[currentList] = [];
            taskData[currentList].push(newTask);
            localStorage.setItem("taskData", JSON.stringify(taskData));

            const taskItem = document.createElement('div');
            taskItem.className = 'obj-task-item';

            taskItem.innerHTML = `
                <div class="obj-task-left">
                    <input type="checkbox" class="task-check">
                   <input type="text" class = "pf-font" placeholder="과제 제목 입력" value="${task.obj_title}">
                   <span class="obj-created-date">${today}</span>
                </div>
                <div class="obj-task-buttons">
                    <button class="calendar-btn">📅</button>
                    <button class="delete-task">X</button>
                </div>
            `;

<<<<<<< HEAD
            renderTasksForCurrentList();

=======
            taskList.appendChild(taskItem);
           
            
            //user_id 값 가져오기
          	<%
            String userId = (String) session.getAttribute("user_id");
    		if (userId == null) userId = "";
    		 %>
    	
			const user_id = "<%= userId %>";
		    sessionStorage.setItem("user_id", user_id); 
		  
>>>>>>> branch 'main' of https://github.com/HWAJINJJANG/2025_JspProject.git
            // 제목 input에 포커스 주기
            const titleInput = taskItem.querySelector('input[type="text"]');
            titleInput.focus();
            
         	//서버에 insert 요청 보내기
            const taskObj = {
                user_id: sessionStorage.getItem("user_id") || "user01", // 로그인한 사용자 ID
                obj_title: titleInput.value.trim(),
                obj_check: 0,
                obj_edate: "", // 날짜 선택 전이므로 비워두기
                objgroup_id: parseInt(localStorage.getItem("currentList"))
            };
         	//과제 추가, 업데이트 실시간 타이머
            function debounce(func, delay) {
                let timeout;
                return function(...args) {
                    clearTimeout(timeout);
                    timeout = setTimeout(() => func.apply(this, args), delay);
                };
            }
         	
           /*  function createDefaultGroupOnce() { 기본제공 리스트 수정해야함
                fetch("insertObjGroup.jsp", {
                    method: "POST",
                    headers: { "Content-Type": "application/x-www-form-urlencoded" },
                    body: "objgroup_name=" + encodeURIComponent("기본 리스트")
                })
                .then(res => res.text())
                .then(id => {
                    console.log("✅ 기본 리스트 DB에 생성됨:", id);
                    localStorage.setItem("currentList", id); // 바로 기본 리스트로 지정
                    reloadCategoryButtons(); // UI 리로드
                    renderTasksForCurrentList(); // 과제 표시
                })
                .catch(err => {
                    console.error("❌ 기본 리스트 생성 실패:", err);
                });
            } */


            fetch("objInsertServlet", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(taskObj)
            })
            .then(res => res.json())
            .then(data => {
                const objId = data.obj_id;
                taskItem.dataset.objId = objId;

                titleInput.focus();

                // 실시간 업데이트 (입력마다 서버에 전송)
                titleInput.addEventListener("input", debounce(() => {
                    const updatedTitle = titleInput.value.trim();
                    if (!updatedTitle) return;

                    fetch("objUpdateServlet", {
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify({
                            obj_id: objId,
                            obj_title: updatedTitle
                        })
                    })
                    .then(res => res.json())
                    .then(data => {
                        console.log("📝 제목 실시간 업데이트 성공:", data);
                    })
                    .catch(err => {
                        console.error("❌ 제목 업데이트 실패:", err);
                    });
                }, 500)); // 👈 0.5초 디바운싱
                
                taskItem.querySelector(".delete-task").addEventListener("click", () => {
                    const confirmed = confirm(`"${titleInput.value.trim()}"을(를) 삭제하시겠습니까?`);
                    if (!confirmed) return;

                    taskItem.remove();
                    updateCompleteCount();

                    deleteTaskDebounced(objId); // objId 확보됐기 때문에 이제 가능!
                });
                updateCompleteCount();
            });

            const checkbox = taskItem.querySelector('.task-check');
            checkbox.addEventListener('change', updateCompleteCount);

            taskItem.querySelector('.calendar-btn').addEventListener('click', () => {
                currentTargetTask = taskItem;
                const title = taskItem.querySelector('input[type="text"]').value;
                calendarTitle.textContent = `마감일 설정: ${title}`;
                calendarContent.style.left = cardWrapper.offsetLeft + 'px';
                calendarContent.style.top = cardWrapper.offsetTop + 'px';
                cardWrapper.style.display = 'none';
                calendarModal.style.display = 'block';
            });

            updateCompleteCount();
        });


        confirmDateBtn.addEventListener('click', () => {
            const selectedDate = calendarPicker.value;
            if (selectedDate && currentTargetTask) {
                const dateSpan = currentTargetTask.querySelector('.obj-created-date');
                dateSpan.textContent = selectedDate.replace(/-/g, '/');
                calendarModal.style.display = 'none';
                cardWrapper.style.display = 'block';
            }
        });

        window.addEventListener('click', (e) => {
            if (e.target === calendarModal) {
                calendarModal.style.display = 'none';
                cardWrapper.style.display = 'block';
            }
        });

        document.addEventListener("DOMContentLoaded", () => {
            const listContainer = document.getElementById('listButtonContainer');

            // 🔥 DB에서 리스트 불러오기
            fetch("getObjGroupList.jsp")
                .then(res => res.json())
                .then(data => {
                    if (data.length === 0) {
                        const defaultBtn = document.createElement('button');
                        defaultBtn.className = 'obj-edit-btn';
                        defaultBtn.textContent = '새로운 목록';
                        defaultBtn.style.width = '370px';
                        defaultBtn.style.marginRight = '10px';
                        defaultBtn.style.padding = '10px 15px';
                        defaultBtn.style.fontFamily = 'PFStarDust, sans-serif';
                        listContainer.appendChild(defaultBtn);
                    } else {
                        // 버튼 생성
                        const maxVisible = 3;
                        const visible = data.slice(0, maxVisible);
                        const hidden = data.slice(maxVisible);

                        visible.forEach(group => {
                            const btn = document.createElement('button');
                            btn.className = 'obj-edit-btn';
                            btn.textContent = group.objgroup_name;

                            btn.addEventListener('click', () => {
                                localStorage.setItem("currentList", group.objgroup_id);
                                localStorage.getItem("currentList");
                                localStorage.setItem("currentListName", group.objgroup_name);
                                renderTasksForCurrentList(); // 과제 렌더링
                            });

                            listContainer.appendChild(btn);
                        });
                       /*  수정해야해 기본제공
                        document.addEventListener("DOMContentLoaded", () => {
                            fetch("getObjGroupList.jsp")
                              .then(res => res.json())
                              .then(data => {
                                  if (data.length === 0) {
                                      createDefaultGroupOnce(); // ✅ 리스트가 없을 때만 생성
                                  } else {
                                      renderListButtons(data); // ✅ 기존 리스트 렌더링
                                  }
                              });
                        }); */

                        // ...버튼 및 드롭다운 처리
                        if (hidden.length > 0) {
                            const dropdownBtn = document.createElement('button');
                            dropdownBtn.className = 'obj-edit-btn';
                            dropdownBtn.textContent = '...';

                            const dropdownMenu = document.createElement('div');
                            dropdownMenu.style.position = 'absolute';
                            dropdownMenu.style.top = '-80px';
                            dropdownMenu.style.left = '320px';
                            dropdownMenu.style.backgroundColor = 'rgba(147, 102, 192, 0.2)';
                            dropdownMenu.style.border = '1px solid white';
                            dropdownMenu.style.borderRadius = '10px';
                            dropdownMenu.style.padding = '10px';
                            dropdownMenu.style.display = 'none';
                            dropdownMenu.style.zIndex = '9999';

                            hidden.forEach(group => {
                                const item = document.createElement('div');
                                item.textContent = group.objgroup_name;
                                item.style.padding = '5px 10px';
                                item.style.color = 'white';
                                item.style.cursor = 'pointer';

                                item.addEventListener('click', () => {
                                    localStorage.setItem("currentList", group.objgroup_id);
                                    localStorage.setItem("currentListName", group.objgroup_name);
                                    dropdownMenu.style.display = 'none';
                                    renderTasksForCurrentList(); // 과제 렌더링
                                });

                                dropdownMenu.appendChild(item);
                            });

                            dropdownBtn.addEventListener('click', () => {
                                dropdownMenu.style.display = dropdownMenu.style.display === 'none' ? 'block' : 'none';
                            });

                            listContainer.appendChild(dropdownBtn);
                            listContainer.appendChild(dropdownMenu);
                        }
                    }

                    // ✎ 편집 버튼
                    const editBtn = document.createElement('button');
                    editBtn.className = 'obj-edit-btn';
                    editBtn.textContent = '✎';
                    editBtn.addEventListener('click', () => {
                        const rect = document.getElementById('cardWrapper').getBoundingClientRect();
                        localStorage.setItem("cardLeft", Math.floor(rect.left));
                        localStorage.setItem("cardTop", Math.floor(rect.top));
                        document.getElementById("cardWrapper").style.display = "none";
                        document.getElementById("listCardWrapper").style.display = "block";
                    });
                    listContainer.appendChild(editBtn);
                })
                .catch(err => {
                    console.error("❌ 리스트 불러오기 실패:", err);
                });

            // 💾 위치 복원
            const savedLeft = localStorage.getItem("cardLeft") || "100";
            const savedTop = localStorage.getItem("cardTop") || "100";
            document.getElementById("cardWrapper").style.left = savedLeft + "px";
            document.getElementById("cardWrapper").style.top = savedTop + "px";
            renderTasksForCurrentList(); // ✅ 초기 렌더링
        });
<<<<<<< HEAD

        function renderTasksForCurrentList() {
            const currentList = localStorage.getItem("currentList");
            const taskData = JSON.parse(localStorage.getItem("taskData") || "{}");
            const tasks = taskData[currentList] || [];

            taskList.innerHTML = ""; // 기존 목록 비우기

            tasks.forEach((task, index) => {
                const taskItem = document.createElement('div');
                taskItem.className = 'obj-task-item';

                taskItem.innerHTML = `
                    <div class="obj-task-left">
                        <input type="checkbox" class="task-check" ${task.checked ? 'checked' : ''}>
                        <input type="text" class = "pf-font" placeholder="과제 제목 입력" value="${task.title}">
                        <span class="obj-created-date">${task.date}</span>
                    </div>
                    <div class="obj-task-buttons">
                        <button class="calendar-btn">📅</button>
                        <button class="delete-task">X</button>
                    </div>
                `;

                taskList.appendChild(taskItem);

                const checkbox = taskItem.querySelector('.task-check');
                checkbox.addEventListener('change', () => {

                    if (taskData[currentList] && taskData[currentList][index]) {
                        taskData[currentList][index].checked = checkbox.checked;
                        localStorage.setItem("taskData", JSON.stringify(taskData));
                    }

                    updateCompleteCount();
                });

                // 삭제 버튼 이벤트
                taskItem.querySelector('.delete-task').addEventListener('click', () => {
                    const taskData = JSON.parse(localStorage.getItem("taskData") || "{}");
                    const currentList = localStorage.getItem("currentList");

                    const confirmed = confirm(`"${task.title}"을(를) 정말 삭제하시겠습니까?`);
                    if (confirmed) {
                        taskData[currentList].splice(index, 1);
                        localStorage.setItem("taskData", JSON.stringify(taskData));
                        renderTasksForCurrentList(); // 다시 렌더링
                    }
                });

                // 달력 버튼 이벤트
                taskItem.querySelector('.calendar-btn').addEventListener('click', () => {
                    currentTargetTask = taskItem;
                    calendarTitle.textContent = `마감일 설정: ${task.title}`;
                    calendarContent.style.left = cardWrapper.offsetLeft + 'px';
                    calendarContent.style.top = cardWrapper.offsetTop + 'px';
                    cardWrapper.style.display = 'none';
                    calendarModal.style.display = 'block';
                });
            });
            
            updateCompleteCount();
=======
        
        
        
        function getFormattedDate() {
            const today = new Date();
            const year = today.getFullYear();
            const month = String(today.getMonth() + 1).padStart(2, '0');
            const day = String(today.getDate()).padStart(2, '0');
            return `${year}/${month}/${day}`;
>>>>>>> branch 'main' of https://github.com/HWAJINJJANG/2025_JspProject.git
        }

        function debounce(func, delay) {
            let timer;
            return function (...args) {
                clearTimeout(timer);
                timer = setTimeout(() => func.apply(this, args), delay);
            };
        }
        
        function escapeHtml(str) {
        	  if (!str) return "";
        	  return str
        	    .replace(/&/g, "&amp;")
        	    .replace(/"/g, "&quot;")
        	    .replace(/</g, "&lt;")
        	    .replace(/'/g, "&#39;")
        	    .replace(/>/g, "&gt;");
        	}
      	//여기가 리스트 표시인듯?
      		const pendingDeletes = new Set();
            const deleteTaskDebounced = debounce((objId) => {
                console.log("🧪 삭제 요청 시도:", objId);
                pendingDeletes.delete(objId);

                fetch("objDeleteServlet", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ obj_id: objId })
                })
                .then(res => res.json())
                .then(data => {
                    if (data.status === "success") {
                        console.log("🗑️ 삭제 성공:", objId);
                    } else {
                        console.error("❌ 삭제 실패: 서버 응답 실패");
                    }
                })
                .catch(err => {
                    console.error("❌ 삭제 요청 실패:", err);
                });
            }, 500);
  	
            function attachDeleteListener(taskItem, objId, titleInput) {
                taskItem.querySelector(".delete-task").addEventListener("click", () => {
                    if (!objId) {
                        alert("❌ 아직 서버에 저장되지 않았습니다. 잠시 후 시도하세요.");
                        return;
                    }

                    const confirmed = confirm(`"${titleInput.value.trim()}"을(를) 삭제하시겠습니까?`);
                    if (!confirmed) return;

                    taskItem.remove(); // UI 반영
                    updateCompleteCount();

                    pendingDeletes.add(objId);
                    deleteTaskDebounced(objId); // 서버 요청
                });
            }

      			
     function renderTasksForCurrentList(objgroup_id) {
    const taskList = document.getElementById("obj-taskList");
    taskList.innerHTML = "";

    const selectedId = localStorage.getItem("currentList"); // 또는 직접 값
    console.log("✔️ 선택된 objgroup_id:", selectedId);  // ← 이게 null이면 문제 발생

    fetch("objCurrentGroupSetServlet", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ objgroup_id: parseInt(selectedId) })
    })
    .then(res => res.json())
    .then(data => {
        if (data.status === "success") {
            // 2️⃣ 세션 저장 성공 후 과제 불러오기
            return fetch("objListServlet");
        } else {
            throw new Error("그룹 설정 실패");
        }
    })
    .then(res => res.json())
    .then(tasks => {
        // ✅ 목록 렌더링 그대로 유지
        tasks.forEach(task => {
            const taskItem = document.createElement("div");
            taskItem.className = "obj-task-item";
            taskItem.dataset.objId = task.obj_id;

           	const rawDate = task.obj_edate ? task.obj_edate.trim() : "";
            const displayDate = rawDate !== "" ? rawDate : getFormattedDate();
            
            taskItem.className = "obj-task-item";

            const safeTitle = escapeHtml(task.obj_title || "");
            
            taskItem.innerHTML = `
                <div class="obj-task-left">
                    <input type="checkbox" class="task-check" ${task.obj_check ? "checked" : ""}>
                    <input type="text" class="pf-font" placeholder="과제 제목 입력">
                    <span class="obj-created-date">${displayDate}</span>
                </div>
                <div class="obj-task-buttons">
                    <button class="calendar-btn">📅</button>
                    <button class="delete-task">X</button>
                </div>
            `;
            taskList.appendChild(taskItem); 
			const titleInput = taskItem.querySelector("input[type='text']");
				titleInput.value = task.obj_title || "";
           const computed = window.getComputedStyle(titleInput);
 
            const checkbox = taskItem.querySelector(".task-check");
            checkbox.addEventListener("change", () => {
                const checked = checkbox.checked ? 1 : 0;
                fetch("objCheckUpdateServlet", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({
                        obj_id: task.obj_id,
                        obj_check: checked
                    })
                });
                updateCompleteCount();
            });
           
            titleInput.addEventListener("input", debounce(() => {
                const updatedTitle = titleInput.value.trim();
                if (!updatedTitle) return;
                fetch("objUpdateServlet", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({
                        obj_id: task.obj_id,
                        obj_title: updatedTitle
                    })
                });
            }, 500));
			
            attachDeleteListener(taskItem, task.obj_id, titleInput);
            
            taskItem.querySelector(".calendar-btn").addEventListener("click", () => {
                currentTargetTask = taskItem;
                calendarTitle.textContent = `마감일 설정: ${titleInput.value}`;
                calendarModal.style.display = "block";
                cardWrapper.style.display = "none";
            });
            
        });

        updateCompleteCount();
    })
    .catch(err => {
        console.error("❌ 과제 목록 불러오기 실패:", err);
    });
    
}
    </script>
</body>
</html>