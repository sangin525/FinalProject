window.onload = function() {
  let stars = Array.from(document.querySelectorAll('.rating span')).reverse();
  stars.forEach(function(star, index) {
    star.addEventListener('click', (function(rank) {
      return function() {
        fillStars(rank);
      }
    })(index));
  });

  function fillStars(rank) {
    for(let i = 0; i < stars.length; i++) {
      if(i <= rank) {
        stars[i].style.color = 'goldenrod';
      } else {
        stars[i].style.color = 'lightgray';
      }
    }
  }
}

function ratingTest(rating) {
	
	// 1. hidden 요소 가져오기
	var starValue = document.getElementById("star");
	starValue.value = rating;
	
	// 2. 가져온 요소의 value 바꾸기
	
}
