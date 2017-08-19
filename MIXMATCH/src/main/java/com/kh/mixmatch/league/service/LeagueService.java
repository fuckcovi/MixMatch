package com.kh.mixmatch.league.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.kh.mixmatch.league.domain.LeagueCommand;
import com.kh.mixmatch.league.domain.LeagueDtlCommand;

@Transactional
public interface LeagueService {

	@Transactional(readOnly=true)
	public List<LeagueCommand> leagueList(Map<String, Object> map);
	@Transactional(readOnly=true)
	public int getRowCount(Map<String, Object> map);
	public void insertLeague(LeagueCommand league);
	public LeagueCommand selectLeague(Integer l_seq);
	public void deleteLeague(Integer l_seq);
	public void updateLeague(LeagueCommand league);

	public List<String> getTeamType(Map<String, Object> map);
	public void insertLeagueDtl(LeagueDtlCommand leagueDtl);
	public List<LeagueDtlCommand> selectLeagueDtl(Integer l_seq);
	public void updateChk(Integer ld_seq);
	public String selectL_seq(Integer ld_seq);
	
}
