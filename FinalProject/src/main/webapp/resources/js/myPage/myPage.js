$(document).ready(function(){
  $(".myhome_profile, .myhome_camera, .myhome_infoText").click(function(){
    $(".modal-dialog").addClass('show'); // 모달을 보여줍니다.
  });
  
  $(".btn_bottom_st2.st2").click(function(){
    $(".modal-dialog").removeClass('show'); // 모달을 숨깁니다.
  });
});

// 모달창 이미지 업로드
$(document).ready(function(){
  $(".upload_pic").click(function(){
    $("#file_1").click();
  });

  $("#file_1").change(function(){
    var reader = new FileReader();
    reader.onload = function(e) {
      $('#vProfileImageModalSrc').attr('src', e.target.result);
    }
    reader.readAsDataURL(this.files[0]); 
  });

	$(".delete_pic").click(function(){
    $("#vProfileImageModalSrc").attr('src', 'https://recipe1.ezmember.co.kr/img/df/pf_300_300.png'); // 이미지를 기본 이미지로 변경
    $("#file_1").val(''); // 파일 입력 필드를 초기화
  });
});