// 확대이미지 변경하기
document.addEventListener('DOMContentLoaded', function() {
	document.querySelector('.storeCategory-li > a').classList.add('active');
	
	var storeCategoryATags = document.querySelectorAll('.storeCategory-ul > .storeCategory-li > a');
	storeCategoryATags.forEach(function(a) {
		a.addEventListener('click', function() {
			storeCategoryATags.forEach(function(otherA) {
				otherA.classList.remove('active');
			});
			a.classList.add('active');
		});
	});
});

$(document).ready(function(){
    $(".product-sub-img img").click(function(){
        var imgSrc = $(this).attr("src"); // 클릭된 이미지의 src를 가져옵니다.
        $(".product-main-img img").attr("src", imgSrc); // 메인 이미지의 src를 변경합니다.
    });
});

// 구매수량 구하기
$(document).ready(function(){
    $(".up-product").click(function(){
        var count = parseInt($(".product-count").val()); // 현재 수량을 가져옵니다.
        $(".product-count").val(count + 1); // 수량을 1 증가시킵니다.
    });

    $(".down-product").click(function(){
        var count = parseInt($(".product-count").val()); // 현재 수량을 가져옵니다.
        if (count > 1) { // 수량이 1 이하로 떨어지지 않도록 합니다.
            $(".product-count").val(count - 1); // 수량을 1 감소시킵니다.
        }
    });
});

// 총 결제금액 구하기
$(document).ready(function(){
    $(".up-product, .down-product").click(function(){
        var count = parseInt($(".product-count").val()); // 현재 수량을 가져옵니다.
        var price = parseInt($(".price").text().replace(/[^0-9]/g,"")); // 가격을 가져옵니다.
        var total = count * price; // 총액을 계산합니다.
        $(".price-total span").text(total.toLocaleString('ko-KR') + "원"); // 총액을 업데이트합니다.
    });
});

// 상세정보 더보기
$(document).ready(function(){
    var numImgs = $(".detail-img img").length;  // detail-img 내의 이미지 개수
    var midIndex = Math.floor(numImgs / 2);  // 중간 인덱스 계산

    // detail-img-pull의 a 태그를 찾음
    var aTag = $(".detail-img-pull a");

    // detail-img-pull을 중간 이미지 바로 뒤로 이동
    $(".detail-img img").eq(midIndex).after($(".detail-img-pull"));

    $(".detail-img-pull").click(function(){
        if($(".detail-img").hasClass('expanded')) {
            $(".detail-img").removeClass('expanded');
            aTag.text('상세정보 더보기');  // a 태그의 텍스트 변경
        } else {
            $(".detail-img").addClass('expanded');
            aTag.text('상세정보 접기');  // a 태그의 텍스트 변경
        }

        // detail-img-pull을 다시 중간 이미지 바로 뒤로 이동
        $(".detail-img img").eq(midIndex).after($(this));
    });
});

// 리뷰 보여주기
$(document).ready(function(){
    var itemsPerPage = 5;
    var numItems = $(".review-li").length;
    var numPages = Math.ceil(numItems / itemsPerPage);
    var currentPage = 1;

    $(".review-li").hide();
    $(".review-li").slice(0, itemsPerPage).show();

    $(".moreReviews a").text(currentPage * itemsPerPage + "/" + numItems);

    $(".moreReviews a").click(function(){
        var start = currentPage * itemsPerPage;
        var end = Math.min((currentPage + 1) * itemsPerPage, numItems);

        $(".review-li").slice(start, end).show();

        currentPage++;

        $(".moreReviews a").text(Math.min(currentPage * itemsPerPage, numItems) + "/" + numItems);

        if(currentPage >= numPages) {
            $(this).off('click');
        }
    });
});

// 리뷰작성 모달창
document.addEventListener('DOMContentLoaded', function() {
  var modal = document.getElementById("myModal");
  var btn = document.getElementById("myBtn");
  var span = document.getElementsByClassName("close")[0];

  btn.onclick = function() {
    modal.style.display = "block";
  }

  span.onclick = function() {
    modal.style.display = "none";
  }

  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
});

//이미지 업로드 js
window.addEventListener('DOMContentLoaded', () => {
    const selectedFiles = {}; // 선택한 파일들을 저장할 객체
    const previewContainer = document.getElementById("previewContainer");

    const handleFiles = (fileInput, index) => {
        const newFiles = [...fileInput.files]; // 새로 추가된 파일들
        selectedFiles[fileInput.id] = newFiles; // 새로 추가된 파일들을 선택한 파일들 객체에 추가

        newFiles.forEach((file, fileIndex) => {
            const fileReader = new FileReader();

            fileReader.readAsDataURL(file);

            fileReader.onload = function() {
                const previewDiv = document.createElement("div");
                previewDiv.className = "image-container";
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
                removeButton.className = "remove-button";
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
                if(existingChild){
                    previewContainer.insertBefore(previewDiv, existingChild);
                }else{
                    previewContainer.appendChild(previewDiv);
                }
            };
        });
    };

    const fileInputs = Array.from(document.querySelectorAll(".file-upload-input"));
    let activeIndex = 0; 

    const labels = document.querySelectorAll(".custom-file-upload");
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

// 별점 선택
window.addEventListener('DOMContentLoaded', () => {
	const ratingStars = [...document.getElementsByClassName("rating__star")];
	const ratingResult = document.querySelector(".rating__result");

	if (ratingResult !== null) {
		printRatingResult(ratingResult);
		executeRating(ratingStars, ratingResult);
	}
});

function printRatingResult(result, numStars=0) {
    result.textContent = `${numStars}/5`;
    document.querySelector('#ratingValue').value = numStars;
}

function executeRating(stars, result) {
	const starClassActive = "rating__star fas fa-star";
	const starClassUnactive = "rating__star far fa-star";

	stars.forEach((star, index) => {
		star.onclick = () => {
			const numStars = index + 1;
			printRatingResult(result, numStars);
			stars.forEach((star, i) => {
				star.className = i < numStars ? starClassActive : starClassUnactive;
			});
		};
	});

	// 폼 제출 이벤트 리스너
	document.querySelector('form').addEventListener('submit', function(e) {
		if (document.querySelector('#ratingValue').value === '0') {
			e.preventDefault();
			alert('별점을 선택해주세요.');
		}
	});
}

$(document).ready(function(){
  $(".accordion_i_tit").click(function(){
    $(this).next(".openblock_content").slideToggle();
    $(this).toggleClass("active"); // active 클래스 추가/제거
  });
});

$(document).ready(function(){
  $(".accordion_q_tit2, .accordion_q_tit1").click(function(){
    $(this).parent().next(".questionsDetail").slideToggle(); // 가시성 전환
  });
});

$(document).ready(function(){
  $(".accordion_i_tit2").click(function(){
    $(this).next(".productQuestions").slideToggle(); // 가시성 전환
	$(this).toggleClass("active"); // active 클래스 추가/제거
  });
});

$(document).ready(function(){
  $(".product-detail-ul li a").click(function(){
    $(".product-detail-ul li a").removeClass("active"); // 모든 a 태그에서 active 클래스 제거
    $(this).addClass("active"); // 클릭한 a 태그에 active 클래스 추가
  });
});

// 위치이동하기
$(document).ready(function(){
  $('a').on('click', function(event) {
    if (this.hash !== "") {
      event.preventDefault();
      var hash = this.hash;
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function(){
        window.location.hash = hash;
      });
    }
  });
});

//문의하기 모달창
document.addEventListener('DOMContentLoaded', function() {
  var modal2 = document.getElementById("q_modal");
  var btn = document.getElementById("q_modal_btn");
  var span = document.getElementsByClassName("close2")[0];

  btn.onclick = function() {
    modal2.style.display = "block";
  }

  span.onclick = function() {
    modal2.style.display = "none";
  }

  window.onclick = function(event) {
    if (event.target == modal2) {
      modal2.style.display = "none";
    }
  }
});

document.addEventListener('DOMContentLoaded', function() {
    // 첫 번째 그룹 (레시피, 쉐프, 검색어)에 대한 초기 활성화 설정
    document.querySelector('.page-link').classList.add('active');

    // 첫 번째 그룹의 a 태그에 클릭 이벤트 리스너 추가
    var questionsATags = document.querySelectorAll('.page-link');
    questionsATags.forEach(function(a) {
        a.addEventListener('click', function() {
            // 해당 그룹 내의 모든 a 태그의 active 클래스 제거
            questionsATags.forEach(function(otherA) {
                otherA.classList.remove('active');
            });
            // 클릭된 a 태그에만 active 클래스 추가
            a.classList.add('active');
        });
    });
});

// 맨위로 올라가기 버튼
function topScroll() {
	$("html, body").animate({scrollTop:0}, 300);
}
