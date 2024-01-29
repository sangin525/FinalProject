$(document).ready(function(){
  $('.recipeList').slick({
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 3,
    prevArrow: $('.icon_arrow_pre'),
    nextArrow: $('.icon_arrow_next')
  });
});