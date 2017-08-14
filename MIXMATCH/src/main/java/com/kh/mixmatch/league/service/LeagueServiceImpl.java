package com.kh.mixmatch.league.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.mixmatch.league.dao.LeagueMapper;
import com.kh.mixmatch.league.domain.LeagueCommand;

@Service("leagueService")
public class LeagueServiceImpl implements LeagueService {
	
	@Resource
	private LeagueMapper leagueMapper;

	@Override
	public List<LeagueCommand> leagueList(Map<String, Object> map) {
		return leagueMapper.leagueList(map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return leagueMapper.getRowCount(map);
	}

	@Override
	public void insertLeague(LeagueCommand league) {
		leagueMapper.insertLeague(league);
	}

	@Override
	public LeagueCommand selectLeague(Integer l_seq) {
		return leagueMapper.selectLeague(l_seq);
	}

	@Override
	public void deleteLeague(Integer l_seq) {
		leagueMapper.deleteLeague(l_seq);
	}

	@Override
	public void updateLeague(LeagueCommand league) {
		leagueMapper.updateLeague(league);
	}

}
