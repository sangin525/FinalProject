function toggleCategory() {
    var categoryToggle = document.querySelector(".categoryToggle");
    var categoryTable = document.querySelector(".categotyTable");

   
        if (categoryTable.style.display === "none") {
            categoryTable.style.display = "block";
            categoryToggle.innerText = "카테고리 닫기";
        } else {
            categoryTable.style.display = "none";
            categoryToggle.innerText = "카테고리 열기";
        }
};
  
document.addEventListener('DOMContentLoaded', function() {
    // 첫 번째 그룹에 대한 초기 활성화 설정
    document.querySelector('.categoryList1 > a').classList.add('active');

    // 두 번째 그룹에 대한 초기 활성화 설정
    document.querySelector('.categoryList2 > a').classList.add('active');

    // 세 번째 그룹에 대한 초기 활성화 설정
    document.querySelector('.categoryList3 > a').classList.add('active');

    // 네 번째 그룹에 대한 초기 활성화 설정
    document.querySelector('.categoryList4 > a').classList.add('active');
    
	// 첫 번째 그룹의 a 태그에 클릭 이벤트 리스너 추가
    var categoryList1ATags = document.querySelectorAll('.categoryContain > .categoryList1 > a');
    categoryList1ATags.forEach(function(a) {
        a.addEventListener('click', function() {
            // 해당 그룹 내의 모든 a 태그의 active 클래스 제거
            categoryList1ATags.forEach(function(otherA) {
                otherA.classList.remove('active');
            });
            // 클릭된 a 태그에만 active 클래스 추가
            a.classList.add('active');
        });
    });

	// 두 번째 그룹의 a 태그에 클릭 이벤트 리스너 추가
    var categoryList2ATags = document.querySelectorAll('.categoryContain > .categoryList2 > a');
    categoryList2ATags.forEach(function(a) {
        a.addEventListener('click', function() {
            // 해당 그룹 내의 모든 a 태그의 active 클래스 제거
            categoryList2ATags.forEach(function(otherA) {
                otherA.classList.remove('active');
            });
            // 클릭된 a 태그에만 active 클래스 추가
            a.classList.add('active');
        });
    });

// 첫 번째 그룹의 a 태그에 클릭 이벤트 리스너 추가
    var categoryList3ATags = document.querySelectorAll('.categoryContain > .categoryList3 > a');
    categoryList3ATags.forEach(function(a) {
        a.addEventListener('click', function() {
            // 해당 그룹 내의 모든 a 태그의 active 클래스 제거
            categoryList3ATags.forEach(function(otherA) {
                otherA.classList.remove('active');
            });
            // 클릭된 a 태그에만 active 클래스 추가
            a.classList.add('active');
        });
    });

// 첫 번째 그룹의 a 태그에 클릭 이벤트 리스너 추가
    var categoryList4ATags = document.querySelectorAll('.categoryContain > .categoryList4 > a');
    categoryList4ATags.forEach(function(a) {
        a.addEventListener('click', function() {
            // 해당 그룹 내의 모든 a 태그의 active 클래스 제거
            categoryList4ATags.forEach(function(otherA) {
                otherA.classList.remove('active');
            });
            // 클릭된 a 태그에만 active 클래스 추가
            a.classList.add('active');
        });
    });


});