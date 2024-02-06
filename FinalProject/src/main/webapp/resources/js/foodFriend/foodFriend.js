document.getElementById('sendButton').addEventListener('click', function() {
	var messageInput = document.getElementById('messageInput');
	var chatBox = document.getElementById('chatBox');

	// 사용자가 입력한 텍스트를 가져옵니다.
	var text = messageInput.value;
	
	if (text.trim() === '') {
		// 메시지 입력 필드가 비어있으면 함수를 종료하고 메시지를 보내지 않습니다.
		return;
	}

	// 새로운 메시지 요소를 만듭니다.
	var newMessage = document.createElement('p');
	newMessage.textContent = text;
	newMessage.style.textAlign = 'center'; 
	newMessage.style.marginBottom = '30px';
	newMessage.style.marginRight = '20px';
	
	// 새로운 이미지 요소를 만듭니다.
	var newImage = document.createElement('img');
	newImage.src = '/resources/uploads/레시피등록대표사진.gif';
	newImage.style.width = '50px';
	newImage.style.height = '50px';
	newImage.style.borderRadius = '50%';

	// 메시지와 이미지를 담을 컨테이너를 만듭니다.
	var container = document.createElement('div');

	// 컨테이너에 메시지와 이미지를 추가합니다.
	container.appendChild(newMessage);
	container.appendChild(newImage);

	// 채팅 박스에 컨테이너를 추가합니다.
	chatBox.appendChild(container);

	// 입력 필드를 비웁니다.
	messageInput.value = '';
	
		// 채팅 박스의 스크롤 위치를 맨 아래로 설정합니다.
	chatBox.scrollTop = chatBox.scrollHeight;
});


document.getElementById('messageInput').addEventListener('keypress', function(event) {
	// 엔터키가 눌렸는지 확인합니다 (엔터키의 keyCode는 13입니다).
	if (event.keyCode == 13) {
		// 기본 이벤트를 취소하여 엔터키를 눌렀을 때의 줄바꿈을 방지합니다.
		event.preventDefault();
		// '전송' 버튼의 클릭 이벤트를 실행합니다.
		document.getElementById('sendButton').click();
	}
});




