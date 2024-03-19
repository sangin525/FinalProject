/* document.getElementById('sendButton').addEventListener('click', function() { */
let messageInput = document.getElementById('messageInput');
let chatBox = document.getElementById('chatBox');
let sender = document.getElementById('sender');
const getBody = document.getElementById('bodyId');
const crno = getBody.getAttribute('data-crno');
const mno = getBody.getAttribute('data-mno');
const name = getBody.getAttribute('data-name');
console.log(crno);
console.log(mno);
console.log(name);

let websocket = new WebSocket("ws://localhost:80/echo/" + crno);
websocket.onmessage = onMessage;
websocket.onclose = onClose;

document.getElementById("sendButton").addEventListener("click", function() {
	sendMessage();
	messageInput.value = null;
})

function sendMessage() {
	senderName = sender.value;
	text = messageInput.value;
	if (text.trim() === '') {
		return;
	} else {
	}
	const obj = {
		"cr_no": crno,
		"m_no": mno,
		"cm_message": text,
		"m_name": name
	}
	str = JSON.stringify(obj)
	websocket.send(str);
}

function onMessage(msg) {
	// console.log(msg);
	// '{"cm_no":3,"cr_no":1,"m_no":2,"cm_message":"ㄷㄷㄷ","…end_time":"2024-03-07 10:19:29.0","m_name":"홍길동", "image_name": "이미지.jpg"}'
	var data = JSON.parse(msg.data);

	var date = new Date(data.cm_send_time);
	var month = date.getMonth() + 1;
	var day = date.getDate();
	var hours = date.getHours();
	var minutes = date.getMinutes();

	if (month < 10) month = '0' + month;
	if (day < 10) day = '0' + day;
	if (hours < 10) hours = '0' + hours;
	if (minutes < 10) minutes = '0' + minutes;

	var formattedTime = month + '/' + day + ' ' + hours + ':' + minutes;

	var newMessage = document.createElement('p');
	newMessage.innerHTML = data.cm_message + "<br>";
	newMessage.innerHTML += formattedTime;
	newMessage.classList.add('new-message');

	var profileBox = document.createElement('div');
	profileBox.classList.add('profile-box');

	var clearBox = document.createElement('div');
	clearBox.style.clear = "both";
	
	var newImage = document.createElement('img');
	newImage.src = '/resources/uploads/member/'+data.cm_imageName;
	// newImage.src = '/resources/uploads/레시피등록대표사진.gif';
	newImage.classList.add('new-image');

	var userName = document.createElement('p');
	userName.innerHTML = data.m_name;
	userName.classList.add('user-name');

	var container = document.createElement('div');
	container.classList.add('container');
	if (data.m_name === name) {
		container.style.float = 'right';
		newMessage.style.marginRight = '20px';
		newMessage.style.textAlign = 'right';
		container.style.margin = '10px';
	} else {
		container.style.float = 'left';
		container.style.display = 'flex';
		container.style.flexDirection = 'row-reverse';
		newMessage.style.marginLeft = '20px';
		container.style.margin = '10px';
		newMessage.style.textAlign = 'left';
	}

	container.appendChild(newMessage);
	container.appendChild(profileBox);
	profileBox.appendChild(newImage);
	profileBox.appendChild(userName);

	chatBox.appendChild(container);
	chatBox.appendChild(clearBox);
	chatBox.scrollTop = chatBox.scrollHeight;
}

function onClose(evt) {
	chatBox.append("연결끊김")
}

document.getElementById('messageInput').addEventListener('keypress', function(event) {
	if (event.keyCode == 13) {
		event.preventDefault();
		document.getElementById('sendButton').click();
	}
});








