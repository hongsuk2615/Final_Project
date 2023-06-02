$("#file").on('change',function(){
    var fileName = $("#file").val();
    $(".upload-name").val(fileName);
});