package com.kh.mixmatch.league.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.mixmatch.league.domain.LeagueCommand;
import com.kh.mixmatch.league.domain.LeagueDtlCommand;
import com.kh.mixmatch.league.service.LeagueService;
import com.kh.mixmatch.match.domain.MatchCommand;
import com.kh.mixmatch.match.service.MatchService;
import com.kh.mixmatch.util.PagingUtil;

@Controller
public class LeagueController {

	private Logger log = Logger.getLogger(this.getClass());
	
	private int rowCount = 10;
	private int pageCount = 10;
	
	@Resource 
	private LeagueService leagueService;
	@Resource
	private MatchService matchService;
	
	@ModelAttribute("leagueCommand")
	public LeagueCommand initLeagueCommand() {
		return new LeagueCommand();
	}
	@ModelAttribute("matchCommand")
	public MatchCommand initMatchCommand() {
		return new MatchCommand();
	}
	
	@RequestMapping("/league/leagueList.do")
	public ModelAndView leagueListForm(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
									   @RequestParam(value="keyword",defaultValue="") String keyword,
									   @RequestParam(value="type",defaultValue="축구") String type) {				
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("keyword", keyword);
		
		
		int count = leagueService.getRowCount(map);
		
		if (log.isDebugEnabled()) {
			log.debug("<<type>> : " + type);
			log.debug("<<pageNum>> : " + currentPage);
			log.debug("<<keyword>> : " + keyword);
			log.debug("<<count>> : " + count);
		}
		
		PagingUtil page = new PagingUtil(null, keyword, currentPage, count, rowCount, pageCount, "leagueList.do");
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<LeagueCommand> list = null;
		if (count > 0) {
			list = leagueService.leagueList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("leagueList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("type", type);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}
	
	// 리그등록폼
	@RequestMapping(value="/league/leagueInsert.do", method=RequestMethod.GET)
	public ModelAndView leagueInsertForm(HttpSession session) {
		String id = (String) session.getAttribute("user_id");
		
		if (log.isDebugEnabled()) {
			log.debug("<<리그등록폼 id>> : " + id);
		}
		
		ArrayList<String> area = new ArrayList<String>();
		area.add("서울");
		area.add("인천");
		area.add("경기");
		area.add("강원");
		area.add("대전");
		area.add("충북");
		area.add("충남");
		area.add("광주");
		area.add("전북");
		area.add("전남");
		area.add("대구");
		area.add("울산");
		area.add("경북");
		area.add("경남");
		area.add("부산");
		area.add("제주");
		
		ArrayList<String> type = new ArrayList<String>();
		type.add("축구");
		type.add("야구");
		type.add("농구");
		
		LeagueCommand leagueCommand = new LeagueCommand();
		leagueCommand.setId(id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("leagueInsert");
		mav.addObject("league", leagueCommand);
		mav.addObject("area", area);
		mav.addObject("type", type);
		
		return mav;
	}
	
	// 리그등록
	@RequestMapping(value="/league/leagueInsert.do", method=RequestMethod.POST)
	public String leagueInsertSubmit(@ModelAttribute("league") LeagueCommand leagueCommand,
									 BindingResult result, HttpServletRequest request) {
		if (log.isDebugEnabled()) {
			log.debug("<<리그등록 leagueCommand>> : " + leagueCommand);
		}
		
		if (result.hasErrors()) {
			return "leagueInsert";
		}
		
		leagueService.insertLeague(leagueCommand);
		
		return "redirect:/league/leagueList.do";
	}
	
	// 리그 상세보기
	@RequestMapping("/league/leagueDetail.do")
	public ModelAndView leagueDetailForm(@RequestParam("l_seq") int l_seq, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		List<String> t_name = matchService.getTeamList(user_id);
		
		if (log.isDebugEnabled()) {
			log.debug("<<리그 상세보기 l_seq>> : " + l_seq);
			log.debug("<<리그 상세보기 user_id>> : " + user_id);
		}
		
		LeagueCommand leagueCommand = leagueService.selectLeague(l_seq);
		
		// 팀목록 받아오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", user_id);
		map.put("l_seq", l_seq);
		
		List<String> teamCommand = leagueService.getTeamType(map);
		
		LeagueDtlCommand leagueDtlCommand = new LeagueDtlCommand();
		
		// 참가신청한 팀 목록
		List<LeagueDtlCommand> leagueDtl = leagueService.selectLeagueDtl(l_seq);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("leagueDetail");
		mav.addObject("league", leagueCommand);
		mav.addObject("user_id", user_id);
		mav.addObject("team", teamCommand);
		mav.addObject("t_name", t_name);
		mav.addObject("leagueDtl", leagueDtlCommand);
		mav.addObject("list", leagueDtl);
		
		return mav;
	}
	
	// 리그 삭제
	@RequestMapping("/league/leagueDelete.do")
	public String leagueDeleteProcess(@RequestParam("l_seq") int l_seq) {
		if (log.isDebugEnabled()) {
			log.debug("<<리그 삭제 l_seq>> : " + l_seq);
		}
		
		leagueService.deleteLeague(l_seq);
		
		return "redirect:/league/leagueList.do";
	}
	
	// 리그 수정폼
	@RequestMapping(value="/league/leagueUpdate.do", method=RequestMethod.GET)
	public ModelAndView leagueUpdateForm(@RequestParam("l_seq") int l_seq) {
		if (log.isDebugEnabled()) {
			log.debug("<<리그 수정폼 l_seq>> : " + l_seq);
		}
		
		ArrayList<String> area = new ArrayList<String>();
		area.add("서울");
		area.add("인천");
		area.add("경기");
		area.add("강원");
		area.add("대전");
		area.add("충북");
		area.add("충남");
		area.add("광주");
		area.add("전북");
		area.add("전남");
		area.add("대구");
		area.add("울산");
		area.add("경북");
		area.add("경남");
		area.add("부산");
		area.add("제주");
		
		ArrayList<String> type = new ArrayList<String>();
		type.add("축구");
		type.add("야구");
		type.add("농구");
		
		LeagueCommand leagueCommand = leagueService.selectLeague(l_seq);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("leagueUpdate");
		mav.addObject("league", leagueCommand);
		mav.addObject("area", area);
		mav.addObject("type", type);
		
		return mav;
	}
	
	// 리그수정
	@RequestMapping(value="/league/leagueUpdate.do", method=RequestMethod.POST)
	public String leagueUpdateSubmit(@ModelAttribute("league") LeagueCommand leagueCommand,
									 BindingResult result, HttpServletRequest request) {
		if (log.isDebugEnabled()) {
			log.debug("<<리그수정 leagueCommand>> : " + leagueCommand);
		}
		
		if (result.hasErrors()) {
			return "leagueUpdate";
		}
		
		leagueService.updateLeague(leagueCommand); 
		
		return "redirect:/league/leagueList.do";
	}
	
	// 팀 참가신청
	@RequestMapping("/league/leagueDtlInsert.do")
	public String leagueDtlInsertSubmit(@ModelAttribute("leagueDtl") LeagueDtlCommand leagueDtlCommand,
										BindingResult result, HttpServletRequest request, RedirectAttributes redirect) {
		if (log.isDebugEnabled()) {
			log.debug("<<팀 참가신청 leagueDtlCommand>> : " + leagueDtlCommand);
		}
		
		if (result.hasErrors()) {
			return "leagueList";
		}
		
		// 참가신청
		leagueService.insertLeagueDtl(leagueDtlCommand);
		
		// 리다이렉트시 파라미터 전달
		redirect.addAttribute("l_seq", leagueDtlCommand.getL_seq());
		
		return "redirect:/league/leagueDetailRe.do";
	}
	
	// 팀 참가승인
	@RequestMapping("/league/leagueDtlCheck.do")
	public String leagueDtlCheck(@RequestParam("ld_seq") int ld_seq, RedirectAttributes redirect) {
		// 참가승인
		// 참가팀수 증가
		leagueService.updateChk(ld_seq);
		
		// 리다이렉트시 파라미터 전달
		redirect.addAttribute("l_seq", leagueService.selectL_seq(ld_seq));
		
		return "redirect:/league/leagueDetailRe.do";
	}
	
	// 리그 상세보기 폼 리다이렉트
	@RequestMapping("league/leagueDetailRe.do")
	public String leagueDetailRedirect(@RequestParam("l_seq") int l_seq) {
		return "redirect:/league/leagueDetail.do?l_seq="+l_seq;
	}
	
}
