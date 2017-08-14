$(document).ready(function(){	
	$('#l_time').val($('#ampm').val() + " " + $('#hour').val() + " " + $('#minute').val());
	$('#ampm').change(function() {
		$('#l_time').val($('#ampm').val() + " " + $('#hour').val() + " " + $('#minute').val());
	});
	$('#hour').change(function() {
		$('#l_time').val($('#ampm').val() + " " + $('#hour').val() + " " + $('#minute').val());
	});
	$('#minute').change(function() {
		$('#l_time').val($('#ampm').val() + " " + $('#hour').val() + " " + $('#minute').val());
	});
	
	$("#l_insert_form").submit(function(){
		if($('#l_title').val()==''){
			alert('리그이름을 입력해주세요.');
			return false;
		}
		if($('#l_date').val()==''){
			alert('날짜를 선택해주세요.');
			$('#l_date').focus();
			return false;
		}
		if($('#l_place').val()==''){
			alert('경기장을 입력해주세요.');
			$('#l_place').focus();
			return false;
		}
		if (confirm('리그등록 하시겠습니까?')) {
			alert('리그등록 완료');
		} else {
			return false;
		}
	});
	
});