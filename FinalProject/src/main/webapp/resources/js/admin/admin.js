let trNo = 0;
let selectAcno=0;
$(function() {
	// 왼쪽메뉴 드롭다운
	$(".sub_menu ul.small_menu").hide();
	$(".sub_menu ul.big_menu li").click(function() {
		$(this).next('.small_menu').slideToggle(300);
	});
});


//판매가격 구하기
document.addEventListener('DOMContentLoaded', function() {
	document.getElementById('productDiscount').addEventListener('input', calculatePrice);
	document.getElementById('costPrice').addEventListener('input', calculatePrice);
});

function calculatePrice() {
	var discount = document.getElementById('productDiscount').value;
	var cost = document.getElementById('costPrice').value;

	if (discount && cost) {
		var sellingPrice = cost * (1 - discount / 100);
		document.getElementById('sellingPrice').textContent = '판매가격 : ' + sellingPrice;
	}
}

//이미지 업로드 js
window.addEventListener('DOMContentLoaded', () => {
	const selectedFiles = {}; // 선택한 파일들을 저장할 객체
	const previewContainer = document.getElementById("productPreviewContainer");

	const handleFiles = (fileInput, index) => {
		const newFiles = [...fileInput.files]; // 새로 추가된 파일들
		selectedFiles[fileInput.id] = newFiles; // 새로 추가된 파일들을 선택한 파일들 객체에 추가

		newFiles.forEach((file, fileIndex) => {
			const fileReader = new FileReader();

			fileReader.readAsDataURL(file);

			fileReader.onload = function() {
				const previewDiv = document.createElement("div");
				previewDiv.className = "product-image-container";
				previewDiv.style.position = "relative";
				previewDiv.style.margin = "10px"; // 간격 추가
				previewDiv.dataset.inputId = fileInput.id;
				previewDiv.dataset.fileIndex = fileIndex;

				const previewImg = document.createElement("img");
				previewImg.src = fileReader.result;
				previewImg.width = 100;
				previewImg.height = 100;

				const removeButton = document.createElement("button");
				removeButton.textContent = "x";
				removeButton.className = "product-remove-button";
				removeButton.style.position = "absolute";
				removeButton.style.top = "0";
				removeButton.style.right = "0";
				removeButton.onclick = function() {
					previewContainer.removeChild(previewDiv);
					const fileIndex = selectedFiles[fileInput.id].indexOf(file);
					if (fileIndex > -1) {
						selectedFiles[fileInput.id].splice(fileIndex, 1);
					}
					fileInput.value = "";
					if (fileInput.files.length === 0 && activeIndex > 0) {
						activeIndex--;
						labels.forEach((label) => {
							label.style.display = 'none';
						});
						labels[activeIndex].style.display = 'inline';
					}
				};

				previewDiv.appendChild(previewImg);
				previewDiv.appendChild(removeButton);

				const existingChild = previewContainer.childNodes[index];
				if (existingChild) {
					previewContainer.insertBefore(previewDiv, existingChild);
				} else {
					previewContainer.appendChild(previewDiv);
				}
			};
		});
	};

	const fileInputs = Array.from(document.querySelectorAll(".product-input"));
	let activeIndex = 0;

	const labels = document.querySelectorAll(".product-upload");
	labels.forEach(label => {
		label.addEventListener("click", (event) => {
			event.preventDefault();
			if (activeIndex < fileInputs.length) {
				fileInputs[activeIndex].click();
			}
		});
	});

	fileInputs.forEach((fileInput, index) => {
		fileInput.addEventListener("change", () => {
			handleFiles(fileInput, index);
			if (fileInput.files.length > 0 && activeIndex < fileInputs.length) {
				activeIndex++;
				if (activeIndex === fileInputs.length) {
					labels.forEach((label) => {
						label.style.display = 'none';
					});
				}
			}
		});
	});
});

//상품 상세정보 업로드 js
window.addEventListener('DOMContentLoaded', () => {
	const selectedFiles = {}; // 선택한 파일들을 저장할 객체
	const previewContainer = document.getElementById("infoPreviewContainer");

	const handleFiles = (fileInput, index) => {
		const newFiles = [...fileInput.files]; // 새로 추가된 파일들
		selectedFiles[fileInput.id] = newFiles; // 새로 추가된 파일들을 선택한 파일들 객체에 추가

		newFiles.forEach((file, fileIndex) => {
			const fileReader = new FileReader();

			fileReader.readAsDataURL(file);

			fileReader.onload = function() {
				const previewDiv = document.createElement("div");
				previewDiv.className = "info-image-container";
				previewDiv.style.position = "relative";
				previewDiv.style.margin = "10px"; // 간격 추가
				previewDiv.dataset.inputId = fileInput.id;
				previewDiv.dataset.fileIndex = fileIndex;

				const previewImg = document.createElement("img");
				previewImg.src = fileReader.result;
				previewImg.width = 100;
				previewImg.height = 100;

				const removeButton = document.createElement("button");
				removeButton.textContent = "x";
				removeButton.className = "info-remove-button";
				removeButton.style.position = "absolute";
				removeButton.style.top = "0";
				removeButton.style.right = "0";
				removeButton.onclick = function() {
					previewContainer.removeChild(previewDiv);
					const fileIndex = selectedFiles[fileInput.id].indexOf(file);
					if (fileIndex > -1) {
						selectedFiles[fileInput.id].splice(fileIndex, 1);
					}
					fileInput.value = "";
					if (fileInput.files.length === 0 && activeIndex > 0) {
						activeIndex--;
						labels.forEach((label) => {
							label.style.display = 'none';
						});
						labels[activeIndex].style.display = 'inline';
					}
				};

				previewDiv.appendChild(previewImg);
				previewDiv.appendChild(removeButton);

				const existingChild = previewContainer.childNodes[index];
				if (existingChild) {
					previewContainer.insertBefore(previewDiv, existingChild);
				} else {
					previewContainer.appendChild(previewDiv);
				}
			};
		});
	};

	const fileInputs = Array.from(document.querySelectorAll(".info-input"));
	let activeIndex = 0;

	const labels = document.querySelectorAll(".info-upload");
	labels.forEach(label => {
		label.addEventListener("click", (event) => {
			event.preventDefault();
			if (activeIndex < fileInputs.length) {
				fileInputs[activeIndex].click();
			}
		});
	});

	fileInputs.forEach((fileInput, index) => {
		fileInput.addEventListener("change", () => {
			handleFiles(fileInput, index);
			if (fileInput.files.length > 0 && activeIndex < fileInputs.length) {
				activeIndex++;
				if (activeIndex === fileInputs.length) {
					labels.forEach((label) => {
						label.style.display = 'none';
					});
				}
			}
		});
	});
});
// 배송관리 체크박스 선택하면 배송정보 보여주기
$(document).ready(function() {
	$('.deliveryTable tbody tr input[type="checkbox"]').each(function(index) {
		$(this).on('change', function() {
			if ($(this).is(':checked')) {
				$('.orderDetail ul').removeClass('active');
				$('.orderDetail ul').eq(index).addClass('active');
			} else {
				$('.orderDetail ul').eq(index).removeClass('active');
			}
		});
	});
});
// 배송관리 체크박스 하나만되게 하는 js
$(document).ready(function() {
	$('input[type="checkbox"].deliveryDetail').on('change', function() {
		$('input[type="checkbox"].deliveryDetail').not(this).prop('checked', false);
	});
});



// 게시글관리
$(document).ready(function() {
	$(".noticeContent, .freeContent, .eventContent, .answerContent").hide();
	var toggleContent = function(trSelector, contentClass) {
	const acno = document.getElementById('hiddenAcno').value; 
	const acContents = document.getElementById('hiddenContents').value;
	const asFile = document.getElementById('hiddenFileName').value;
	
		$(trSelector).click(function() {
		
		trNo= $(this).children('#hiddenAcno').val();
		
			// 이전에 추가된 내용을 삭제합니다.
			$(trSelector + '.added').remove();

			// 클릭한 tr 요소의 인덱스를 찾습니다.
			var index = $(trSelector).index(this);

			// 클릭한 요소 안의 input 태그의 선택 상태를 확인합니다.
			var isChecked = $(this).find('input[type="checkbox"]').is(':checked');

			// 만약 체크박스가 선택되어 있다면 내용을 보여줍니다.
			if (isChecked) {				
				$(this).after('<tr class="added"><td colspan="6">' + $(this).children('#hiddenContents').val() +  '</td></tr>');							
			}
		});
	};

	// 각 클래스에 대해 함수를 호출합니다.
	toggleContent(".noticeTable tbody tr", ".noticeContent");
	toggleContent(".freeTable tbody tr", ".freeContent");
	toggleContent(".eventTable tbody tr", ".eventContent");
});

// 게시글 체크박스 하나만되게 하는 js
$(document).ready(function() {
	$('input[type="checkbox"].Detail').on('change', function() {
		$('input[type="checkbox"].Detail').not(this).prop('checked', false);
	});
});

// 게시글 수정 모달창
$(document).ready(function() {
	var modal = $("#board_Modal");
	var span = $(".close")[0];
	
	const acno = document.getElementById('hiddenAcno').value; 
	const title = document.getElementById('hiddenTitle').value;
	const contents = document.getElementById('hiddenContents').value;
	const fileName = document.getElementById('hiddenFileName').value;
	
	var answerContent = ""; // 답변 내용을 저장할 변수를 선언합니다.

	// 체크박스 클릭 이벤트를 처리합니다.
	$('input.Detail[type="checkbox"]').on("click", function() {
		var row = $(this).parent().parent();
		if (this.checked) {
			answerContent = row.next().find('.answerContent').text(); // 체크박스가 체크된 행의 '.answerContent'의 텍스트를 변수에 저장합니다.
		} else {
			answerContent = ""; // 체크박스가 해제되면 변수를 초기화합니다.
		}
	});

	$(".board_update_btn").click(function() {
		var checkboxes = $("input.Detail[type='checkbox']"); // 'Detail' 클래스를 가진 모든 체크박스를 선택합니다.
		let modalForm = document.getElementById('modalForm');
		const acno = document.getElementById('hiddenAcno').value;
		let selectAcno = trNo;
		
		
		// 모든 체크박스에 대해 반복합니다.
		checkboxes.each(function() {
			// 체크박스가 체크된 경우만 데이터를 가져옵니다.
			if (this.checked) {
				var row = $(this).parent().parent(); // 체크박스의 상위 노드를 통해 현재 행을 가져옵니다.
				var nextRow = row.next(); // 현재 행의 바로 다음 행을 가져옵니다.
				let hiddenTrAcno = document.createElement('input');
				hiddenTrAcno.type = "hidden";
				hiddenTrAcno.name = "acno";
				hiddenTrAcno.value = trNo;
				modalForm.appendChild(hiddenTrAcno);
				
				
				// 현재 행의 상위 div가 'noticeTable' 클래스를 가지고 있는지 확인합니다.
				if (row.closest('div').hasClass('noticeTable')) {
					// 'noticeTable' 클래스를 가지고 있다면, 모달창의 form에 action을 추가합니다.
					console.log("b");
					modal.find('form').attr('action', '/admin/noticeUpdate.do');
				} else if (row.closest('div').hasClass('freeTable')) {
					modal.find('form').attr('action', 'freeUpdate.do');
				} else if (row.closest('div').hasClass('eventTable')) {
					modal.find('form').attr('action', 'eventUpdate.do');
				}

				$("#boardTitle").val(row.find(".boardTit").text());
				$("#boardNum").val(row.find(".boardNum").text());
				$("#boardWriter").val(row.find(".boardwriter").text());
				$("#boardContent").val(nextRow.text()); // 다음 행의 내용을 가져옵니다.

				modal.css("display", "block");
			}
		});
	});

$(".board_answer_btn").click(function() {
	var checkboxes = $("input.Detail[type='checkbox']");
	var answerContents = $(".answerTable .answerContent"); // .answerContent를 모두 가져옵니다.

	checkboxes.each(function(index) { // 체크박스를 순회하면서 인덱스도 함께 가져옵니다.
		if (this.checked) {
			var row = $(this).parent().parent();

			if (row.closest('div').hasClass('answerTable')) {
				modal.find('form').attr('action', 'productAnswer.do');
			}

			$("#boardTitle").val(row.find(".boardTit").text());
			$("#boardNum").val(row.find(".boardNum").text());
			$("#boardWriter").val(row.find(".boardwriter").text());

			// 체크된 체크박스와 같은 인덱스의 .answerContent의 내용을 가져옵니다.
			var answerContent = $(answerContents[index]).text();

			// 저장된 답변 내용을 모달창의 'boardContent'에 넣습니다.
			$("#boardContent").val(answerContent);

			modal.css("display", "block");
		}
	});
});

	
	// 삭제 버튼에 대한 이벤트 핸들러를 추가합니다.
	$(".board_delete_btn").click(function() {
		var checkboxes = $("input.Detail[type='checkbox']");
		const acno = document.getElementById('hiddenAcno').value;
		
		checkboxes.each(function() {
			if (this.checked) {
				var row = $(this).parent().parent();
				
				if (row.closest('div').hasClass('noticeTable')) {
					var boardNum = row.find(".boardNum").text();
					window.location.href = "/admin/noticeDelete.do?acno="+ trNo;
				} else if (row.closest('div').hasClass('freeTable')) {
					var boardNum = row.find(".boardNum").text();
					window.location.href = "/free/delete.do?boardIdx=" + boardNum;
				} else if (row.closest('div').hasClass('eventTable')) {
					var boardNum = row.find(".boardNum").text();
					window.location.href = "/event/delete.do?boardIdx=" + boardNum;
				}
			}
		});
	});

	span.onclick = function() {
		modal.css("display", "none");
	}

	window.onclick = function(event) {
		if (event.target == modal[0]) {
			modal.css("display", "none");
		}
	}
});

