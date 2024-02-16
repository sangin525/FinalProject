<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/foodFriend/foodFriend.css">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

</head>

<body>
	<%@ include file="../../views/common/header.jsp"%>
<<<<<<< HEAD
	<%@ include file="../../views/common/nav.jsp" %>
=======
		<%@ include file="../../views/common/nav.jsp" %>

>>>>>>> branch 'master' of https://github.com/sangin525/finalProject.git
	<div class="container">

		${firstMember.mno}<br><br> 
		${firstMember.name}<br><br>

		${secondMember.mno}<br><br> 
		${secondMember.name}<br><br>
		
		<input id="sender" value="${user.name}" readonly>

		<div class="chat-container">
			<div class="chat-header">
				<h2>1대1 채팅방</h2>
			</div>
			<div id="chatBox" class="chat-box clearBox"></div>
			<div class="chat-input">
				<input id="messageInput" type="text" placeholder="메시지를 입력하세요." value="">
				<button id="sendButton">전송</button>
			</div>
		</div>
	</div>

	<%@ include file="../../views/common/footer.jsp"%>
</body>

<script type="text/javascript">
	let messageInput = document.getElementById('messageInput');
	let chatBox = document.getElementById('chatBox');
	let sender = document.getElementById('sender');
	

	let websocket = new WebSocket("ws://localhost:80/echo/${chatRoom.cr_no}");
	websocket.onmessage = onMessage;
	websocket.onclose = onClose;

	document.getElementById("sendButton").addEventListener("click", function() {
		sendMessage();
		messageInput.value = null;
	})
	

	function sendMessage() {
		//사용자 이름을 가져옵니다.
		senderName = sender.value;
		console.log(senderName);
		// 사용자가 입력한 텍스트를 가져옵니다.
		text = messageInput.value;
		// 메시지 입력 필드가 비어있으면 함수를 종료하고 메시지를 보내지 않습니다.
		if (text.trim() === '') {
			return;
		} else {

		}
		const obj ={"cr_no":"${chatRoom.cr_no}",
					"m_no": "${user.mno}",
					"cm_message":text,
					"m_name":"${user.name}"
					}
		str=JSON.stringify(obj)
		websocket.send(str);
	}

	function onMessage(msg) {
		// 서버로부터 메시지 받아오고
		var data = JSON.parse(msg.data);

		// 새로운 메시지 요소를 만듭니다.
		var newMessage = document.createElement('p');
		newMessage.innerHTML = data.cm_message + "<br>";
		newMessage.innerHTML += data.cm_send_time;
		newMessage.style.textAlign = 'right';
		newMessage.style.marginRight = '20px';
		newMessage.style.wordWrap = 'break-word';
		newMessage.style.fontFamily = "'Noto Sans KR', sans-serif";
		newMessage.style.fontSize = '15px';
		newMessage.style.fontWeight = '500';
		newMessage.style.color = '#333';
	    newMessage.style.maxWidth = '80%';
		
		var profileBox = document.createElement('div');
		profileBox.style.display="flex";
		profileBox.style.flexDirection = "column";
		
		var clearBox = document.createElement('div');
		clearBox.style.clear = "both";
		


		// 새로운 이미지 요소를 만듭니다.
		var newImage = document.createElement('img');
		newImage.src = '/resources/uploads/레시피등록대표사진.gif';
		newImage.style.width = '50px';
		newImage.style.height = '50px';
		newImage.style.borderRadius = '50%';
		newImage.style.borderColor = '#ddd';
		newImage.style.borderWidth = '2px';
		newImage.style.borderStyle = 'solid';
		
	    // 사용자 이름을 나타내는 요소를 만듭니다.
	    var userName = document.createElement('p');
	    userName.innerHTML = data.m_name;
	    userName.style.textAlign = 'center';
	    
		// 메시지와 이미지를 담을 컨테이너를 만듭니다.
		var container = document.createElement('div');
		if (data.m_name === "${user.name}") {
			container.style.float = 'right';
	   } else{
		   container.style.float = 'left';
		   container.style.display = 'flex';
		   container.style.flexDirection = 'row-reverse';
			
	    }

		container.style.alignItems = 'center';
		container.style.alignItems = 'column';
		container.style.border = '1px solid #ddd';
		container.style.borderRadius = '5px';
		container.style.boxShadow = '0px 0px 10px rgba(0, 0, 0, 0.1)';
		container.style.padding = '10px';
		container.style.marginBottom = '10px';

		container.style.maxWidth = '80%';
		container.appendChild(newMessage);
		container.appendChild(profileBox);
		profileBox.appendChild(newImage);
		profileBox.appendChild(userName);

		// 채팅 박스에 컨테이너를 추가합니다.
		chatBox.appendChild(container);
		chatBox.appendChild(clearBox);
		// 채팅 박스의 스크롤 위치를 맨 아래로 설정합니다.
		chatBox.scrollTop = chatBox.scrollHeight;
	}

	function onClose(evt) {
		chatBox.append("연결끊김")
	}

	document.getElementById('messageInput').addEventListener('keypress', function(event) {
		// 엔터키가 눌렸는지 확인합니다 (엔터키의 keyCode는 13입니다).
		if (event.keyCode == 13) {
			// 기본 이벤트를 취소하여 엔터키를 눌렀을 때의 줄바꿈을 방지합니다.
			event.preventDefault();
			// '전송' 버튼의 클릭 이벤트를 실행합니다.
			document.getElementById('sendButton').click();
			}
		});
</script>

</html>