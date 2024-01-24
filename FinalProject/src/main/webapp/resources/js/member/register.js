document.addEventListener('DOMContentLoaded', function() {
    var inputs = document.querySelectorAll('.memberInputbox input');

    // 페이지 로딩 시 모든 입력란 검사
    inputs.forEach(function(input) {
        handleLabelPosition(input);

        // 각 입력란에 이벤트 리스너 추가
        input.addEventListener('input', function() { handleLabelPosition(input); });
        input.addEventListener('focus', function() { handleLabelPosition(input); });
        input.addEventListener('blur', function() { handleLabelPosition(input); });
    });
});

function handleLabelPosition(input) {
    var label = input.nextElementSibling;
    // 입력란에 값이 있거나 포커스가 있는 경우
    if (input.value.trim() !== '' || input === document.activeElement) {
        label.style.top = '0px';
        label.style.fontSize = '10pt';
        label.style.color = '#8aa1a1';
    } else {
        // 입력란이 비어있고 포커스가 없는 경우
        label.style.top = '15px';
        label.style.fontSize = '14pt';
        label.style.color = '#aaa';
    }
}

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 주소 변수
            var addr = '';
            // 참고항목 변수
            var extraAddr = '';

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            // 사용자가 도로명 주소를 선택했을 경우 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }

            // 우편번호, 주소, 참고항목 필드를 가져온다.
            var postcodeInput = document.getElementById('postcode');
            var addressInput = document.getElementById("address");
            var extraAddressInput = document.getElementById("extraAddress");
           
			postcodeInput.value = data.zonecode;
            addressInput.value = addr;
            extraAddressInput.value = extraAddr ? extraAddr : ''; // extraAddr이 비어있지 않으면 값을 설정, 그렇지 않으면 빈 문자열

            // 각 입력란에 대해 'input' 이벤트를 강제로 발생시킨다.
            triggerInputEvent(postcodeInput);
            triggerInputEvent(addressInput);
            triggerInputEvent(extraAddressInput);

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}

function triggerInputEvent(input) {
    var event = new Event('input', {
        bubbles: true,
        cancelable: true,
    });
    input.dispatchEvent(event);
}
function moveLabelAbove(input) {
    var label = input.nextElementSibling;
    if (input.value.trim() !== '') {
        label.classList.add('active');
    } else {
        label.classList.remove('active');
    }
}

// 비밀번호 유효성 검사 + 비밀번호 확인하고 같은지
    function validatePassword() {
       const passwordRegex = /^(?=.*[a-zA-Z])(?=.*[@$!%*?&\#])[A-Za-z\d@$!%*?&\#]{8,20}$/;
       const password = document.getElementById("password").value;
       const msg = document.getElementById("PwdMsg");

       if(password == "") {
           msg.innerHTML = "비밀번호를 입력하세요.";
           msg.style.color = "red";
       } else if(passwordRegex.test(password)) {
           msg.innerHTML = "사용 가능한 비밀번호 입니다.";
           msg.style.color = "green";
       } else {
           msg.innerHTML = "패스워드 정책에 맞지 않습니다.";
           msg.style.color = "red";
       }


       const passwordChk = document.getElementById("passwordCheck").value;
       const msg2 = document.getElementById("PwdcheckMsg");
       if(password === passwordChk) {
           msg2.innerHTML = "패스워드가 동일합니다.";
           msg2.style.color = "green";
       } else {
           msg2.innerHTML = "패스워드가 동일하지 않습니다.";
           msg2.style.color = "red";
       }
   }

	// 이메일 유효성 검사
	 function validateEmail() {
      const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
      const email = document.getElementById("email").value;
      const msg = document.getElementById("emailMsg");

      if(email == "") {
           msg.innerHTML = "이메일을 입력하세요.";
           msg.style.color = "red";
       } else if(emailRegex.test(email)) {
           msg.innerHTML = "유효한 이메일 주소입니다.";
           msg.style.color = "green";
       } else {
           msg.innerHTML = "유효하지 않은 이메일 주소입니다.";
           msg.style.color = "red";
       }
    }