package com.kh.mixmatch.member.scheduler;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.mixmatch.member.domain.MemberCommand;
import com.kh.mixmatch.member.service.MemberService;

@Component
public class authCheck {

	@Resource
	MemberService memberService;
	
	@Scheduled(cron="0 33 15 * * *")
	public void authUpdate(){
		System.out.println("등급수정 스케줄러 작동");
		
		System.out.println("실버등급 수정");
		memberService.silverUpdate();
		
		System.out.println("골드등급 수정");
		memberService.goldUpdate();
		
		System.out.println("플래티넘등급 수정");
		memberService.platinumUpdate();
		
		System.out.println("다이아몬드등급 수정");
		memberService.diamondUpdate();
		
		System.out.println("등급수정 스케줄러 수행 완료");
	}
	
	@Scheduled(cron="0 36 15 * * *")
	public void todayMemberUpdate(){
		System.out.println("상위1위 회원 포인트 적립 스케줄러 작동");
		
		MemberCommand memberCommand =  memberService.todayMember();
		
		memberService.todayMemberPointUpdate(memberCommand.getId());
		
		System.out.println("상위1위 회원 포인트 적립 스케줄러 수행 완료");
	}
}
