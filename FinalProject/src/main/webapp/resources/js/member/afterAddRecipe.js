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
