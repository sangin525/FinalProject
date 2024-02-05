$(document).ready(function(){
  $("#btnUpdateEmail").click(function(){
    $("#updEmail").toggle();
  });
  $("#btnUpdateNick").click(function(){
    $("#updNick").toggle();
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