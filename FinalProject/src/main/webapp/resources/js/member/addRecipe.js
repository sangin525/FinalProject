document.getElementById("addIngredientBtn").addEventListener("click", function() {
	var li = document.createElement("li");
	li.className = "ingredient";

	var ingredientInput = document.createElement("input");
	ingredientInput.type = "text"
	ingredientInput.name = "ingredient"
	ingredientInput.className = "form-control";
	ingredientInput.placeholder = "예) 돼지고기";

	var amountInput = document.createElement("input");
	amountInput.type = "text";
	amountInput.className = "form-control";
	amountInput.name = "ingredientWeight"
	amountInput.placeholder = "예) 500g";

	li.appendChild(ingredientInput);
	li.appendChild(amountInput);

	document.getElementById("ingredientList").appendChild(li);
});

document.getElementById("deleteIngredientBtn").addEventListener("click", function() {
	var ingredientList = document.getElementById("ingredientList");
	if (ingredientList.lastElementChild) {
		ingredientList.removeChild(ingredientList.lastElementChild);
	}
});

var stepCount = 1;
var imgCount = 1;
var imgCount2 = 1;
var imgCount3 = 1;
var stepButton = document.getElementById('stepButton');
var initialStepButton = stepButton.cloneNode(true); // 처음 '순서 추가'와 '순서 삭제' 버튼 복사

// 처음 '순서 추가'와 '순서 삭제' 버튼에 이벤트 리스너 추가
initialStepButton.querySelector('#addStepBtn').addEventListener("click", addStep);
initialStepButton.querySelector('#deleteStepBtn').addEventListener("click", deleteStep);

document.getElementById("addStepBtn").addEventListener("click", addStep);
document.getElementById("deleteStepBtn").addEventListener("click", deleteStep);

function addStep() {
	stepCount++;
	imgCount++;
	imgCount2++;
	imgCount3++;

	var step = document.createElement("div");
	step.id = "amountStep_" + stepCount;
	step.className = "step";

	var stepTitle = document.createElement("p");
	stepTitle.id = "stepNum_" + stepCount;
	stepTitle.className = "stepTitle";
	stepTitle.innerText = "Step" + stepCount;
	step.appendChild(stepTitle);

	var stepText = document.createElement("div");
	stepText.id = "stepText_" + stepCount;
	var stepTextarea = document.createElement("textarea");
	stepTextarea.name = "rsSequence";
	stepTextarea.className = "step-control";
	stepTextarea.id = "step_text_" + stepCount;
	stepTextarea.placeholder = "예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요.";
	stepText.appendChild(stepTextarea);
	step.appendChild(stepText);

	var stepPhoto = document.createElement("div");
	stepPhoto.id = "divStepPhoto";
	var newDiv = document.createElement("div");

	var inputFile = document.createElement("input");
	inputFile.type = "file";
	inputFile.id = "recipeSeqeuncePhoto_" + imgCount;
	inputFile.className = "rsPhotouUpload_" + imgCount2;
	inputFile.name = "multiFileList";
	inputFile.style.display = "none";  // inputFile 숨김
	inputFile.onchange = function(e) {
		var reader = new FileReader();
		reader.onload = function(event) {
			img.src = event.target.result;
			img.style.width = "160px";  // 이미지의 너비를 160px로 설정
			img.style.height = "160px";  // 이미지의 높이를 160px로 설정
		};
		reader.readAsDataURL(e.target.files[0]);
	};
	newDiv.appendChild(inputFile);  // 새로운 div에 inputFile 추가

	var img = document.createElement("img");
	img.id = "stepPhoto";
	img.className = "recipeImg_" + imgCount3;
	img.src = "/resources/uploads/사진추가.gif";
	img.style.cursor = "pointer";
	img.onclick = function() { inputFile.click(); };  // 이미지를 클릭하면 inputFile의 클릭 이벤트가 실행되도록 수정
	newDiv.appendChild(img);  // 새로운 div에 img 추가

	stepPhoto.appendChild(newDiv);  // stepPhoto에 새로운 div 추가
	step.appendChild(stepPhoto);

	document.getElementById("cookingStep").appendChild(step);

	// 기존의 '순서 추가'와 '순서 삭제' 버튼 삭제
	stepButton.remove();

	// 새로운 '순서 추가'와 '순서 삭제' 버튼 생성
	stepButton = document.createElement("div");
	stepButton.id = "stepButton";

	var addStepBtn = document.createElement("button");
	addStepBtn.innerText = "순서 추가";
	addStepBtn.type = "button";
	addStepBtn.id = "addStepBtn";
	addStepBtn.className = "addStepBtn";
	addStepBtn.addEventListener("click", addStep);
	stepButton.appendChild(addStepBtn);

	var deleteStepBtn = document.createElement("button");
	deleteStepBtn.innerText = "순서 삭제";
	deleteStepBtn.type = "button";
	deleteStepBtn.id = "deleteStepBtn";
	deleteStepBtn.className = "deleteStepBtn";
	deleteStepBtn.addEventListener("click", deleteStep);
	stepButton.appendChild(deleteStepBtn);

	step.appendChild(stepButton);
}

function deleteStep() {
	if (stepCount > 1) {
		var element = document.getElementById("amountStep_" + stepCount);
		var stepButtonToMove = element.querySelector('#stepButton');
		element.parentNode.removeChild(element);
		stepCount--;

		var lastStep = document.getElementById("amountStep_" + stepCount);
		lastStep.appendChild(stepButtonToMove);
	}

	if (stepCount === 1) {
		stepButton.remove();
		console.log("asd")
		stepButton = initialStepButton.cloneNode(true);
		stepButton.querySelector('#addStepBtn').addEventListener("click", addStep);
		stepButton.querySelector('#deleteStepBtn').addEventListener("click", deleteStep);
		var firstStep = document.getElementById("amountStep_" + stepCount);
		firstStep.appendChild(stepButton);
	}
}




