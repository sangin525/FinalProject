document.addEventListener('DOMContentLoaded', function() {
    // 첫 번째 그룹 (레시피, 쉐프, 검색어)에 대한 초기 활성화 설정
    document.querySelector('.RankingList > a').classList.add('active');

    // 두 번째 그룹 (일간, 주간, 월간)에 대한 초기 활성화 설정
    document.querySelector('.rankingSubType > a').classList.add('active');

    // 첫 번째 그룹의 a 태그에 클릭 이벤트 리스너 추가
    var rankingListATags = document.querySelectorAll('.rankingMenu > .RankingList > a');
    rankingListATags.forEach(function(a) {
        a.addEventListener('click', function() {
            // 해당 그룹 내의 모든 a 태그의 active 클래스 제거
            rankingListATags.forEach(function(otherA) {
                otherA.classList.remove('active');
            });
            // 클릭된 a 태그에만 active 클래스 추가
            a.classList.add('active');
        });
    });

    // 두 번째 그룹의 a 태그에 클릭 이벤트 리스너 추가
    var rankingTypeATags = document.querySelectorAll('.rankingMenu .RankingType .rankingSubType > a');
    rankingTypeATags.forEach(function(a) {
        a.addEventListener('click', function() {
            // 해당 그룹 내의 모든 a 태그의 active 클래스 제거
            rankingTypeATags.forEach(function(otherA) {
                otherA.classList.remove('active');
            });
            // 클릭된 a 태그에만 active 클래스 추가
            a.classList.add('active');
        });
    });
});