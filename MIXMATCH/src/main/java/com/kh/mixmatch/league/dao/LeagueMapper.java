package com.kh.mixmatch.league.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.mixmatch.league.domain.LeagueCommand;
import com.kh.mixmatch.league.domain.LeagueDtlCommand;

public interface LeagueMapper {

	public List<LeagueCommand> leagueList(Map<String, Object> map);
	public int getRowCount(Map<String, Object> map);
	@Insert("INSERT INTO g_league (l_seq,id,l_title,l_area,l_date,l_time,l_place,l_cost,l_content,l_number,l_team,l_type) VALUES (g_league_seq.nextval,#{id},#{l_title},#{l_area},#{l_date},#{l_time},#{l_place},#{l_cost},#{l_content,jdbcType=VARCHAR},#{l_number},#{l_team},#{l_type})")
	public void insertLeague(LeagueCommand league);
	@Select("SELECT * FROM g_league WHERE l_seq=#{l_seq}")
	public LeagueCommand selectLeague(Integer l_seq);
	@Delete("DELETE FROM g_league WHERE l_seq=#{l_seq}")
	public void deleteLeague(Integer l_seq);
	@Update("UPDATE g_league SET l_title=#{l_title},l_area=#{l_area},l_date=#{l_date},l_time=#{l_time},l_place=#{l_place},l_cost=#{l_cost},l_content=#{l_content},l_team=#{l_team} WHERE l_seq=#{l_seq}")
	public void updateLeague(LeagueCommand league);
	
	// 종목별 팀 가져오기
	@Select("SELECT t_name FROM g_team WHERE id IN(SELECT id FROM g_team_member WHERE id=#{id} AND t_type IN(SELECT l_type FROM g_league WHERE l_seq=#{l_seq})) AND t_name NOT IN (SELECT t_name FROM g_league_detail WHERE l_seq=#{l_seq})")
	public List<String> getTeamType(Map<String, Object> map);
	// 팀 참가신청
	@Insert("INSERT INTO g_league_detail (ld_seq,l_seq,t_name) VALUES (g_league_detail_seq.nextval,#{l_seq},#{t_name})")
	public void insertLeagueDtl(LeagueDtlCommand leagueDtl);
	// 참가신청한 팀 목록 가져오기
	@Select("SELECT ld.*,t.t_win,t.t_draw,t.t_lose FROM g_league_detail ld, g_team t WHERE ld.t_name=t.t_name AND l_seq=#{l_seq}")
	public List<LeagueDtlCommand> selectLeagueDtl(Integer l_seq);
	// 팀 참가승인
	@Update("UPDATE g_league_detail SET ld_check='Y' WHERE ld_seq=#{ld_seq}")
	public void updateChk(Integer ld_seq);
	// 참가승인 l_seq 받아오기
	@Select("SELECT l_seq FROM g_league_detail WHERE ld_seq=#{ld_seq}")
	public String selectL_seq(Integer ld_seq);
	// 참가팀수 증가
	@Update("UPDATE g_league SET l_team=l_team+1 WHERE l_seq=(SELECT l_seq FROM g_league_detail WHERE ld_seq=#{ld_seq})")
	public void updateTeamNum(Integer ld_seq);
	
}
