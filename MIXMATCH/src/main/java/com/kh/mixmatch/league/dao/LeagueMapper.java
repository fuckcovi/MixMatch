package com.kh.mixmatch.league.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.mixmatch.league.domain.LeagueCommand;

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
	
}
