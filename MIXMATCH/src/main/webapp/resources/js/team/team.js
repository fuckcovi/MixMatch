$(document).ready(function(){
	
	// 팀랭킹화면
	$("#member").click(function(){
		$(".teamList").hide();
		$(".memList").show();
		
	});
	$("#team").click(function(){
		$(".teamList").show();
		$(".memList").hide();
		
	});
	
	/*// 팀홈화면
	$("#typeAll").click(function(){
		$("#야구").show();
		$("#농구").show();
		$("#축구").show();
	});
	$("#typeFoot").click(function(){
		$("#야구").hide();
		$("#농구").hide();
		$("#축구").show();
	}); 
	$("#typeBase").click(function(){
		$("#야구").show();
		$("#농구").hide();
		$("#축구").hide();
	}); 
	$("#typeBasket").click(function(){
		$("#야구").hide();
		$("#농구").show();
		$("#축구").hide();
	}); */
	
	$(".scheduleListX").click(function(){
		$(".scheduleListX div").show();
		$(".scheduleListC div").hide();
		$(".scheduleListF div").hide();
	});
	$(".scheduleListC").click(function(){
		$(".scheduleListX div").hide();
		$(".scheduleListC div").show();
		$(".scheduleListF div").hide();
	});
	$(".scheduleListF").click(function(){
		$(".scheduleListX div").hide();
		$(".scheduleListC div").hide();
		$(".scheduleListF div").show();
	});
	
	$(".scheduleList tr").show();
	$(".tablenull").hide();
	if(!$(".xplan tr").hasClass("plan")){
		$(".xplan .tablenull").show();
	}if(!$(".cplan tr").hasClass("plan")){
		$(".cplan .tablenull").show();
	}if(!$(".fplan tr").hasClass("plan")){
		$(".fplan .tablenull").show();
	}
	
	// 홈 어웨이 선택에 따른 매치개인기록 보여주기
	$("#matchDetailRecord li").click(function(){
			$(".detailRecord_home").hide();
			$(".detailRecord_away").hide();
			if($(this).attr("value")=="homeRecord"){
				$(".detailRecord_home").show();
			}else{
				$(".detailRecord_away").show();
			}
			
	});
	
	
	// 팀 선택에 따라 일정결과 목록 보여주기
	$("#teamScheduleList li").click(function(){
		if($(this).attr("value")=="allList"){
			$(".scheduleList tr").show();
			$(".tablenull").hide();
			if(!$(".xplan tr").hasClass("plan")){
				$(".xplan .tablenull").show();
			}if(!$(".cplan tr").hasClass("plan")){
				$(".cplan .tablenull").show();
			}if(!$(".fplan tr").hasClass("plan")){
				$(".fplan .tablenull").show();
			}
		}else{
			$(".scheduleList tr").hide();
			$(".tablehead").show();
			$("."+$(this).attr("value")).show();
			if(!$(".xplan tr").hasClass($(this).attr("value"))){
				$(".xplan .tablenull").show();
			}if(!$(".cplan tr").hasClass($(this).attr("value"))){
				$(".cplan .tablenull").show();
			}if(!$(".fplan tr").hasClass($(this).attr("value"))){
				$(".fplan .tablenull").show();
			}
		}
	});
	
	// 개인기록 수정
	$(".footRecordModify").click(function(){
		var tname= $(this).attr("list-tname");
		var id = $(this).attr("list-id");
		var mseq = $(this).attr("list_mseq");
		var output = "";
			output+= "<form id='modifyform' action='footMemModify.do'>";
			output+="<input type='hidden' id='m_seq' name='m_seq' value='"+mseq+"'>";
			output+= "	<input type='text' id='t_name' name='t_name' value='"+tname+"' readonly='true'>";
			output+= "	<input type='text' id='id' name='id' value='"+id+"' readonly='true'>";
			output+= "	<input type='text' id='f_shoot' name='f_shoot' value='"+$(this).attr("list-fshoot")+"'>";
			output+= "	<input type='text' id='f_assist' name='f_assist' value='"+$(this).attr("list-fassist")+"'>";
			output+= "	<input type='text' id='f_goal' name='f_goal' value='"+$(this).attr("list-fgoal")+"'>";
			output+= "	<input type='text' id='f_attack' name='f_attack' value='"+$(this).attr("list-fattack")+"'>";
			output+= "	<input type='submit' value='기록수정'></td>";
			output+= "</form>";
		$(this).parent().parent().text("").append(output);
	});
	$(".basketRecordModify").click(function(){
		var tname= $(this).attr("list-tname");
		var id = $(this).attr("list-id");
		var mseq = $(this).attr("list_mseq");
		var output = "";
			output+= "<form action='basketMemModify.do'>";
			output+= "	<input type='hidden' id='m_seq' name='m_seq' value='"+mseq+"'>";
			output+= "	소속팀 : <input type='text' id='t_name' name='t_name' value='"+tname+"' readonly='true'>";
			output+= "	유저이름(아이디) : <input type='text' id='id' name='id' value='"+id+"' readonly='true'>";
			output+= "	득점 : <input type='text' id='b_score' name='b_score' value='"+$(this).attr("list-bscore")+"'>";
			output+= "	어시스트 : <input type='text' id='b_assist' name='b_assist' value='"+$(this).attr("list-bassist")+"'>";
			output+= "	리바운드 : <input type='text' id='b_rebound' name='b_rebound' value='"+$(this).attr("list-brebound")+"'>";
			output+= "	스틸 : <input type='text' id='b_steel' name='b_steel' value='"+$(this).attr("list-bsteel")+"'>";
			output+= "	블록 : <input type='text' id='b_block' name='b_block' value='"+$(this).attr("list-bblock")+"'>";
			output+= "	3점슛 : <input type='text' id='b_3point' name='b_3point' value='"+$(this).attr("list-b3point")+"'>";
			output+= "	<input type='submit' value='기록수정'>";
			output+= "</form>";
		$(this).parent().parent().text("").append(output);
	});
	$(".baseRecordModify").click(function(){
		var tname= $(this).attr("list-tname");
		var id = $(this).attr("list-id");
		var mseq = $(this).attr("list_mseq");
		var output = "";
			output+= "<form action='baseMemModify.do'>";
			output+= "	<input type='hidden' id='m_seq' name='m_seq' value='"+mseq+"'>";
			output+= "	소속팀 : <input type='text' id='t_name' name='t_name' value='"+tname+"' readonly='true'>";
			output+= "	유저이름(아이디) : <input type='text' id='id' name='id' value='"+id+"' readonly='true'>";
			output+= "	타수 : <input type='text' id='b_bat' name='b_bat' value='"+$(this).attr("list-bbat")+"'>";
			output+= "	안타수 : <input type='text' id='b_hit' name='b_hit' value='"+$(this).attr("list-bhit")+"'>";
			output+= "	타점 : <input type='text' id='b_rbi' name='b_rbi' value='"+$(this).attr("list-brbi")+"'>";
			output+= "	득점 : <input type='text' id='b_score' name='b_score' value='"+$(this).attr("list-bscore")+"'>";
			output+= "	승리 : <input type='text' id='b_win' name='b_win' value='"+$(this).attr("list-bwin")+"'>";
			output+= "	패배 : <input type='text' id='b_lose' name='b_lose' value='"+$(this).attr("list-blose")+"'>";
			output+= "	삼진 : <input type='text' id='b_strike' name='b_strike' value='"+$(this).attr("list-bstrike")+"'>";
			output+= "	이닝 : <input type='text' id='b_ip' name='b_ip' value='"+$(this).attr("list-bip")+"'>";
			output+= "	실점 : <input type='text' id='b_er' name='b_er' value='"+$(this).attr("list-ber")+"'>";
			output+= "	<input type='submit' value='기록수정'>";
			output+= "</form>";
		$(this).parent().parent().text("").append(output);
	});
	
});