$("#file").on('change',function(){
    let fileName = $("#file").val();
    $(".upload-name").val(fileName);
});

$(".optionItem").click(function(){
	let catName = $(".optionItem").val();
	$("#categorySNo").val(catName);
});

$(".optionItem").each(function(index, e) {
	$(e).click(function() {
		let catName = $(".optionItem").val();
		$("#categorySNo").val(catName);
	})
});