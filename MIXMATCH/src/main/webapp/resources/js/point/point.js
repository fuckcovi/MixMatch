$(document).ready(function(){
	//검색 유효성 체크
	$('#search_form').submit(function(){
		if($('#keyword').val()==''){
			alert('검색어를 입력하세요!');
			$('#keyword').focus();
			return false;
		}
	});
	
	$("#purchase").click(function(){
		var id = $("#id").val();
		var p_name = $("#p_name").val();
		var p_price = $("#p_price").val();
		var p_grade = $("#p_grade").val();
		var amount = $("#amount option:selected").val();

		var dataStr = {
			
			p_name:p_name,
			p_price:p_price,
			p_grade:p_grade,
			amount:amount
		};
		
		$.ajax({
			url:'purchase.do',
			data:dataStr,
			type:'post',
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.grade != null){
					alert('본인의 등급보다 높은 아이템입니다.');
				}else if(data.point != null){
					alert('포인트가 부족합니다.');
				}else{
					alert('구매 성공');
					location.href='pointShopCart.do';
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});
	
	
});