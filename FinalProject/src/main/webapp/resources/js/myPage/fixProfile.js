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
window.onload = function() {
	document.addEventListener('DOMContentLoaded', function() {
	  var modal2 = document.getElementById("q_modal");
	  var btn = document.getElementById("q_modal_bt");
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

    var minusBtn = document.querySelectorAll('.minus-btn');
    var plusBtn = document.querySelectorAll('.plus-btn');
    var inputField = document.querySelectorAll('.quantity input');

    minusBtn.forEach(function(btn, index){
        btn.addEventListener('click', function(){
            if(inputField[index].value > 1){
                inputField[index].value--;
            }
        });
    });

	plusBtn.forEach(function(btn, index){
        btn.addEventListener('click', function(){
            inputField[index].value++;
        });
    });
    document.getElementById('checkAll').addEventListener('click', function() {
        let checkboxes = document.getElementsByClassName('itemCheck');
        for(let i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = this.checked;
        }
    });

}
