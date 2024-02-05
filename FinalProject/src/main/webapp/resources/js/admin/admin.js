$(function () {
    // 왼쪽메뉴 드롭다운
    $(".sub_menu ul.small_menu").hide();
    $(".sub_menu ul.big_menu li").click(function () {
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
                if(existingChild){
                    previewContainer.insertBefore(previewDiv, existingChild);
                }else{
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
                if(existingChild){
                    previewContainer.insertBefore(previewDiv, existingChild);
                }else{
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