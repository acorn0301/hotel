$("#idcheck").click(function(){ // idcheck 버튼을 클릭했을 때
	alert("창 확인");
	var user_id = $('#user_id').val();
	
	$.ajax({
		url:'/idcheck.do?user_id='+user_id,
		type:'post',
		dataType:'xml',
		success:function(data){
			console.log("1 = 중복o / 0 = 중복x : "+ data);							
			
			if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").text("사용중인 아이디입니다");
					$("#id_check").css("color", "red");
					$("#joinbtn").attr("disabled", true);
				} else {
					
					if(idJ.test(user_id)){
						// 0 : 아이디 길이 / 문자열 검사
						$("#id_check").text("");
						$("#joinbtn").attr("disabled", false);
			
					} else if(user_id == ""){
						
						$('#id_check').text('아이디를 입력해주세요');
						$('#id_check').css('color', 'red');
						$("#joinbtn").attr("disabled", true);				
						
					} else {
						
						$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다");
						$('#id_check').css('color', 'red');
						$("#joinbtn").attr("disabled", true);
					}
					
				}
			}, error : function() {
					console.log("실패");
			}
			
	});
	
});

