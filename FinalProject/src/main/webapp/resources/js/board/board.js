$(document).ready(function() {
    $('#file').on('change', function(e) {
        var fileName = e.target.files[0].name;
        console.log(fileName);
        $('#file-name').text(" 선택된 파일: " + fileName);
    });
});
