document.addEventListener('DOMContentLoaded', function() {
    var rankingListTags = document.querySelectorAll('.RankingList');
    var rankingTypeTags = document.querySelectorAll('.rankingSubType');

	var rankingRecipeLink = document.querySelector('.nav-content a[href="/recipe/rankingRecipe.do"]');
    if (rankingRecipeLink) {
        rankingRecipeLink.addEventListener('click', function() {
            // '레시피 랭킹' 링크를 클릭했을 때 세션 스토리지의 'activeRankingList' 값을 초기화합니다.
            sessionStorage.removeItem('activeRankingList');
        });
    }

    // 페이지 URL을 확인하고, 해당 URL이 메뉴 링크의 href와 일치하면 'active' 클래스를 추가합니다.
    var currentPageUrl = window.location.pathname;
    rankingListTags.forEach(function(li) {
        if (li.querySelector('a').getAttribute('href') === currentPageUrl) {
            li.classList.add('active');
        } else {
            li.classList.remove('active');
        }
    });

    // 세션 스토리지에서 현재 활성화된 메뉴 항목을 가져옵니다.
    var activeRankingList = sessionStorage.getItem('activeRankingList');
    var activeRankingType = sessionStorage.getItem('activeRankingType');

    // 세션 스토리지에 저장된 활성화된 메뉴 항목이 있다면, 해당 항목에 'active' 클래스를 추가합니다.
    if (activeRankingList !== null) {
        rankingListTags.forEach(function(li, index) {
            if (index.toString() === activeRankingList) {
                li.classList.add('active');
            }
        });
    }

    if (activeRankingType) {
        rankingTypeTags[activeRankingType].classList.add('active');
    }

    rankingListTags.forEach(function(li, index) {
        li.addEventListener('click', function(event) {
            // 클릭된 메뉴 항목에만 'active' 클래스를 추가합니다.
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