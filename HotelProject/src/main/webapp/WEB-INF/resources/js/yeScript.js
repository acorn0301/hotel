$(document).ready(function(){
	$("#signOk").click(function(e){
		e.preventDefault();
		fn_signOk();
	});
});

function fn_singOk(){
	if($("#user_id").val().length<1){
		alert("아이디를 입력해주세요");
	}
		
		
}