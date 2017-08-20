package com.kh.mixmatch.member.service;

import org.springframework.transaction.annotation.Transactional;

import com.kh.mixmatch.member.domain.MemberCommand;

@Transactional
public interface MemberService {
	public void insertMember(MemberCommand member);
	@Transactional(readOnly=true)
	public MemberCommand selectMember(String id);
	public void updateMember(MemberCommand member);
	public void updatePw(MemberCommand member);
	public void deleteMember(String id);
	
	//등급수정
	public void silverUpdate();
	public void goldUpdate();
	public void platinumUpdate();
	public void diamondUpdate();
	
	//상위 1위회원 검색
	@Transactional(readOnly=true)
	public MemberCommand todayMember();
	//상위 1위회원에게 포인트 추가 적립
	public void todayMemberPointUpdate(String id);
}
