package com.kh.mixmatch;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mixmatch.board.domain.BoardCommand;
import com.kh.mixmatch.board.service.BoardService;
import com.kh.mixmatch.match.domain.MatchCommand;
import com.kh.mixmatch.match.service.MatchService;
import com.kh.mixmatch.member.domain.MemberCommand;
import com.kh.mixmatch.member.service.MemberService;
import com.kh.mixmatch.notice.domain.NoticeCommand;
import com.kh.mixmatch.notice.service.NoticeService;
import com.kh.mixmatch.team.domain.TeamCommand;
import com.kh.mixmatch.team.domain.TeamMemCommand;
import com.kh.mixmatch.team.service.TeamMemService;
import com.kh.mixmatch.team.service.TeamService;

@Controller
public class HomeController {
	
	@Resource
	private NoticeService noticeService;
	@Resource
	private TeamService teamService;
	@Resource
	private MatchService matchService;
	@Resource
	private MemberService memberService;
	@Resource
	private TeamMemService teamMemService;
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping("/home.do")
	public ModelAndView mainPage(HttpSession session){
	// 공지사항 //
		Map<String, Object> map = new HashMap<String, Object>();
		// map에 아무것도 전달해주지 않으면서 단순 공지사항 글 수 개져옴
		int noticeCount = noticeService.getRowCount(map);
		List<NoticeCommand> noticeList = null;
		if(noticeCount>0){
			// 최근 글 5개만 리스트생성
			map.put("start", 1);
			map.put("end", 5);
			noticeList = noticeService.noticeList(map);
		}

		//자유게시판 //
		Map<String, Object> boardmap = new HashMap<String, Object>();
		// map에 아무것도 전달해주지 않으면서 단순 공지사항 글 수 개져옴
		int boardCount = boardService.getRowCount(boardmap);
		List<BoardCommand> boardList = null;
		if(boardCount>0){
			// 최근 글 5개만 리스트생성
			boardmap.put("start", 1);
			boardmap.put("end", 5);
			boardList = boardService.list(boardmap);
		}else{
			boardList = new ArrayList<BoardCommand>();
		}
		if(boardList.size()<5){
			BoardCommand board = new BoardCommand();
			for(int i=boardList.size()+1;i<=5;i++){
				boardList.add(board);
			}
		}
	// 야구팀랭킹	- 승리 1~5위 리스트
		Map<String, Object> bmap = new HashMap<String, Object>();
		bmap.put("keyword","야구");
		bmap.put("keyfield","teamtype");
		int baseTeamCount = teamService.getTeamCount(bmap);
		bmap.put("start", 1);
		bmap.put("end",5);
		
		List<TeamCommand> baseTeamList = null;
		if(baseTeamCount > 0){
			bmap.put("order", "t_win");
			baseTeamList = teamService.listRank(bmap);
		}else{
			baseTeamList = new ArrayList<TeamCommand>();
		}
		if(baseTeamList.size()<5){
			TeamCommand team = new TeamCommand();
			for(int i=baseTeamList.size()+1;i<=5;i++){
				baseTeamList.add(team);
			}
		}
	// 축구팀
		Map<String, Object> fmap = new HashMap<String, Object>();
		fmap.put("keyword","축구");
		fmap.put("keyfield","teamtype");
		int footTeamCount = teamService.getTeamCount(fmap);
		fmap.put("start", 1);
		fmap.put("end",5);
		
		List<TeamCommand> footTeamList = null;
		if(footTeamCount > 0){
			fmap.put("order", "t_win");
			footTeamList = teamService.listRank(fmap);
		}else{
			footTeamList = new ArrayList<TeamCommand>();
		}
		if(footTeamList.size()<5){
			TeamCommand team = new TeamCommand();
			for(int i=footTeamList.size()+1;i<=5;i++){
				footTeamList.add(team);
			}
		}
	// 농구팀
		Map<String, Object> bkmap = new HashMap<String, Object>();
		bkmap.put("keyword","농구");
		bkmap.put("keyfield","teamtype");
		int basketTeamCount = teamService.getTeamCount(bkmap);
		bkmap.put("start", 1);
		bkmap.put("end",5);
		
		List<TeamCommand> basketTeamList = null;
		if(basketTeamCount > 0){
			bkmap.put("order", "t_win");
			basketTeamList = teamService.listRank(bkmap);
		}else{
			basketTeamList = new ArrayList<TeamCommand>();
		}
		if(basketTeamList.size()<5){
			TeamCommand team = new TeamCommand();
			for(int i=basketTeamList.size()+1;i<=5;i++){
				basketTeamList.add(team);
			}
		}
		
	// 최근경기결과 - 야구
		Map<String, Object> matchBmap = new HashMap<String, Object>();
		matchBmap.put("type", "야구");
		matchBmap.put("board", "score");
		matchBmap.put("start", 1);
		matchBmap.put("end",5);
		int matchBResultCount = teamService.MainmatchCountFinish(matchBmap);
		
		List<MatchCommand> matchBResultlist = null;
		if (matchBResultCount > 0) {
			matchBResultlist = teamService.matchListFinish(matchBmap);
		}else{
			matchBResultlist = new ArrayList<MatchCommand>();
		}
		if(matchBResultlist.size() <5){
			MatchCommand match = new MatchCommand();
			for(int i=matchBResultlist.size()+1;i<=5;i++){
				matchBResultlist.add(match);
			}
		}
	// 최근경기결과 - 농구
		Map<String, Object> matchBKmap = new HashMap<String, Object>();
		matchBKmap.put("type", "농구");
		matchBKmap.put("board", "score");
		matchBKmap.put("start", 1);
		matchBKmap.put("end",5);
		int matchBKResultCount = teamService.MainmatchCountFinish(matchBKmap);
		
		List<MatchCommand> matchBKResultlist = null;
		if (matchBKResultCount > 0) {
			matchBKResultlist = teamService.matchListFinish(matchBKmap);
		}else{
			matchBKResultlist = new ArrayList<MatchCommand>();
		}
		if(matchBKResultlist.size() <5){
			MatchCommand match = new MatchCommand();
			for(int i=matchBKResultlist.size()+1;i<=5;i++){
				matchBKResultlist.add(match);
			}
		}
	// 최근경기결과 -축구
		Map<String, Object> matchFmap = new HashMap<String, Object>();
		matchFmap.put("type", "축구");
		matchFmap.put("board", "score");
		matchFmap.put("start", 1);
		matchFmap.put("end",5);
		int matchFResultCount = teamService.MainmatchCountFinish(matchFmap);
		
		List<MatchCommand> matchFResultlist = null;
		if (matchFResultCount > 0) {
			matchFResultlist = teamService.matchListFinish(matchFmap);
		}else{
			matchFResultlist = new ArrayList<MatchCommand>();
		}
		if(matchFResultlist.size() <5){
			MatchCommand match = new MatchCommand();
			for(int i=matchFResultlist.size()+1;i<=5;i++){
				matchFResultlist.add(match);
			}
		}
		
	// 사이드바 - 마이페이지
		String user_id = (String)session.getAttribute("user_id");
		MemberCommand member = null;
		int joinCountSide = 0;
	// 사이드 팀 메뉴
		Map<String, Object> teammap = new HashMap<String, Object>();	
		teammap.put("id", user_id);
		if(user_id != null){	// 로그인한 상태면 마이페이지에 뜸
			member = memberService.selectMember(user_id);
			joinCountSide = teamMemService.getRowMemCount(user_id);
		}
		
		List<TeamMemCommand> joinListSide = null;
		if(joinCountSide>0){
			joinListSide = teamMemService.listConfirmTeam(teammap);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		mav.addObject("noticeCount",noticeCount);
		mav.addObject("noticeList",noticeList);
		mav.addObject("boardCount",boardCount);
		mav.addObject("boardList",boardList);
		mav.addObject("baseTeamCount",baseTeamCount);
		mav.addObject("baseTeamList",baseTeamList);
		mav.addObject("basketTeamCount",basketTeamCount);
		mav.addObject("basketTeamList",basketTeamList);
		mav.addObject("footTeamCount",footTeamCount);
		mav.addObject("footTeamList",footTeamList);
		
		mav.addObject("matchBResultCount", matchBResultCount);
		mav.addObject("matchBResultlist", matchBResultlist);
		mav.addObject("matchFResultCount", matchFResultCount);
		mav.addObject("matchFResultlist", matchFResultlist);
		mav.addObject("matchBKResultCount", matchBKResultCount);
		mav.addObject("matchBKResultlist", matchBKResultlist);
		
		mav.addObject("member",member);
		mav.addObject("joinCountSide",joinCountSide);
		mav.addObject("joinListSide",joinListSide);	 
		session.setAttribute("member", member);
		session.setAttribute("joinCountSide", joinCountSide);
		session.setAttribute("joinListSide", joinListSide);
		return mav;
	}
	
	// 마이페이지 사진
	@RequestMapping("/imageViewSide.do")
	public ModelAndView viewImage(@RequestParam("id")String id){
		
		MemberCommand member = memberService.selectMember(id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", member.getProfile());
		mav.addObject("filename", member.getProfile_name());
		
		return mav;
	}
	// 사이드 마이팀 사진
	@RequestMapping("/imageViewTside.do")
	public ModelAndView viewImageTeamLogo(@RequestParam String t_name){
		TeamCommand team = teamService.selectTeam(t_name);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile",team.getT_logo());
		mav.addObject("filename", team.getT_logo_name());
		return mav;
	}
}

