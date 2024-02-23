let trNo = 0;
let selectEno=0;


// 게시글관리
$(document).ready(function() {
	$(".noticeContent, .freeContent, .eventContent, .answerContent").hide();
	var toggleContent = function(trSelector, contentClass) {
	const eno = document.getElementById('hiddenEno').value; 
	const eContents = document.getElementById('hiddenContents').value;
	const eFile = document.getElementById('hiddenFileName').value;
	
		$(trSelector).click(function() {
		
		trNo= $(this).children('#hiddenEno').val();
		
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
	
	const eno = document.getElementById('hiddenEno').value; 
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
		const eno = document.getElementById('hiddenEno').value;
		let selectEno = trNo;
		
		
		// 모든 체크박스에 대해 반복합니다.
		checkboxes.each(function() {
			// 체크박스가 체크된 경우만 데이터를 가져옵니다.
			if (this.checked) {
				var row = $(this).parent().parent(); // 체크박스의 상위 노드를 통해 현재 행을 가져옵니다.
				var nextRow = row.next(); // 현재 행의 바로 다음 행을 가져옵니다.
				let hiddenTrEno = document.createElement('input');
				hiddenTrEno.type = "hidden";
				hiddenTrEno.name = "eno";
				hiddenTrEno.value = trNo;
				modalForm.appendChild(hiddenTrEno);
				
				
				// 현재 행의 상위 div가 'noticeTable' 클래스를 가지고 있는지 확인합니다.
				if (row.closest('div').hasClass('noticeTable')) {
					// 'noticeTable' 클래스를 가지고 있다면, 모달창의 form에 action을 추가합니다.
					console.log("b");
					modal.find('form').attr('action', '/admin/eventUpdate.do');
				} else if (row.closest('div').hasClass('freeTable')) {
					modal.find('form').attr('action', 'freeUpdate.do');
				} else if (row.closest('div').hasClass('eventTable')) {
					modal.find('form').attr('action', '/admin/eventUpdate.do');
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
		const eno = document.getElementById('hiddenEno').value;
		
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
					window.location.href = "/admin/eventDelete.do?eno=" + trNo;
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

