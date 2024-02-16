document.addEventListener('DOMContentLoaded', function() {
    var rankingListTags = document.querySelectorAll('.RankingList');
    var rankingTypeTags = document.querySelectorAll('.rankingSubType');

    // 세션 스토리지에서 현재 활성화된 메뉴 항목을 가져옵니다.
    var activeRankingList = sessionStorage.getItem('activeRankingList');
    var activeRankingType = sessionStorage.getItem('activeRankingType');

    // 세션 스토리지에 저장된 활성화된 메뉴 항목이 있다면, 해당 항목에 'active' 클래스를 추가합니다.
    if (activeRankingList) {
        rankingListTags[activeRankingList].classList.add('active');
    }
    if (activeRankingType) {
        rankingTypeTags[activeRankingType].classList.add('active');
    }

    rankingListTags.forEach(function(li, index) {
        li.querySelector('a').addEventListener('click', function() {
            rankingListTags.forEach(function(otherLi) {
                otherLi.classList.remove('active');
            });
            li.classList.add('active');
            // 클릭된 메뉴 항목의 인덱스를 세션 스토리지에 저장합니다.
            sessionStorage.setItem('activeRankingList', index);
        });
    });

    rankingTypeTags.forEach(function(li, index) {
        li.querySelector('a').addEventListener('click', function() {
            rankingTypeTags.forEach(function(otherLi) {
                otherLi.classList.remove('active');
            });
            li.classList.add('active');
            // 클릭된 메뉴 항목의 인덱스를 세션 스토리지에 저장합니다.
            sessionStorage.setItem('activeRankingType', index);
        });
    });
});