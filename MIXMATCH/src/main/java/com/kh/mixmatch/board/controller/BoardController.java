package com.kh.mixmatch.board.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mixmatch.board.service.BoardService;

import com.kh.mixmatch.board.domain.BoardCommand;
import com.kh.mixmatch.util.PagingUtil;

import com.kh.mixmatch.board.domain.BoardReplyCommand;

@Controller
public class BoardController {

	private Logger log = Logger.getLogger(this.getClass());
	
	private int rowCount = 10;
	private int pageCount = 10;
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping("/board/list.do")
	public ModelAndView boardListProcess(@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam(value="keyfield",defaultValue="")
			String keyfield,
			@RequestParam(value="keyword",defaultValue="")
			String keyword){
		
		if(log.isDebugEnabled()){
			log.debug("<<pageNum>> : " + currentPage);
			log.debug("<<keyfield>> : " + keyfield);
			log.debug("<<keyword>> : " + keyword);
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//총 글의 갯수 또는 검색된 글의 갯수
		int count = boardService.getRowCount(map);
		
		if(log.isDebugEnabled()){
			log.debug("<<count>> : " + count);
		}
		
		PagingUtil page =
				new PagingUtil(keyfield,keyword,currentPage,
						count,rowCount,pageCount,"list.do");
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<BoardCommand> list = null;
		if(count > 0){
			list = boardService.list(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardList");
		mav.addObject("count",count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}
	
	@RequestMapping(value="/board/write.do",method=RequestMethod.GET)
	public String boardWriteForm(HttpSession session, Model model){
		String id = (String)session.getAttribute("user_id");
		
		BoardCommand command = new BoardCommand();
		command.setId(id);
		model.addAttribute("command", command);
		
		return "boardWrite";
	}
	
	@RequestMapping(value="/board/write.do",method=RequestMethod.POST)
	public String boardWriteSubmit(@ModelAttribute("command")
	                     @Valid BoardCommand boardCommand,
	                     BindingResult result,
	                     HttpServletRequest request){
		
		if(log.isDebugEnabled()){
			log.debug("<<boardCommand>> : " + boardCommand);
		}
		
		//유효성 체크
		if(result.hasErrors()){
			return "boardWrite";
		}
		
		//ip 셋팅
		boardCommand.setIp(request.getRemoteAddr());
		
		//글쓰기
		boardService.insert(boardCommand);
		
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("/board/detail.do")
	public ModelAndView boardDetailProcess(@RequestParam("gb_seq") int gb_seq){
		
		if(log.isDebugEnabled()){
			log.debug("<<gb_seq>> : " + gb_seq);
		}
		
		//해당 글의 조회수 증가
		boardService.updateHit(gb_seq);
		BoardCommand board = boardService.selectBoard(gb_seq);
		
		return new ModelAndView("boardView","board",board);
	}
	//파일 다운로드
	@RequestMapping("/board/file.do")
	public ModelAndView download(@RequestParam("gb_seq") int gb_seq){
		
		BoardCommand board = boardService.selectBoard(gb_seq);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("downloadView");
		mav.addObject("downloadFile", board.getGb_uploadfile());
		mav.addObject("filename", board.getGb_filename());
		
		return mav;
	}
	//이미지 출력
	@RequestMapping("/board/imageView.do")
	public ModelAndView viewImage(@RequestParam("gb_seq") int gb_seq){
		
		BoardCommand board = boardService.selectBoard(gb_seq);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", board.getGb_uploadfile());
		mav.addObject("filename", board.getGb_filename());
		
		return mav;
	}
	
	@RequestMapping(value="/board/update.do",method=RequestMethod.GET)
	public String boardUpdateForm(@RequestParam("gb_seq") int gb_seq,
			           Model model){
		BoardCommand boardCommand = boardService.selectBoard(gb_seq);
		model.addAttribute("command", boardCommand);
		
		return "boardModify";
	}
	
	@RequestMapping(value="/board/update.do",method=RequestMethod.POST)
	public String boardUpdateSubmit(@ModelAttribute("command")
	                     @Valid BoardCommand boardCommand,
	                     BindingResult result,
	                     HttpSession session,
	                     HttpServletRequest request) throws Exception{
		
		if(log.isDebugEnabled()){
			log.debug("<<boardCommand>> : " + boardCommand);
		}
		
		String user_id = (String)session.getAttribute("user_id");
		if(!user_id.equals(boardCommand.getId())){
			throw new Exception(
			"로그인한 아이디로 작성된 글이 아니기 때문에 수정할 수 없습니다.");
		}
		
		BoardCommand board = boardService.selectBoard(
				                     boardCommand.getGb_seq());
		
		if(result.hasErrors()){
			//원래 파일명 셋팅
			boardCommand.setGb_filename(board.getGb_filename());
			return "boardModify";
		}
		
		//전송된 파일이 없을 경우
		if(boardCommand.getGb_upload().isEmpty()){
			//기존 정보 셋팅
			boardCommand.setGb_uploadfile(board.getGb_uploadfile());
			boardCommand.setGb_filename(board.getGb_filename());
		}
		
		//ip셋팅
		boardCommand.setIp(request.getRemoteAddr());
		
		//글수정
		boardService.update(boardCommand);
		
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("/board/delete.do")
	public String boardDeleteSubmit(@RequestParam("gb_seq") int gb_seq,
			             HttpSession session)
			            		    throws Exception{
		if(log.isDebugEnabled()){
			log.debug("<<gb_seq>> : " + gb_seq);
		}
		
		BoardCommand boardCommand = 
				boardService.selectBoard(gb_seq);
		String user_id = (String)session.getAttribute("user_id");
		if(!user_id.equals(boardCommand.getId())){
			throw new Exception("로그인한 아이디로 작성된 글이 아니기 때문에 삭제할 수 없습니다.");
		}
		
		//글 삭제
		boardService.delete(boardCommand.getGb_seq());
		
		return "redirect:/board/list.do";
	}
	
	//===============댓글=================
	@RequestMapping("/board/listReply.do")
	@ResponseBody
	public Map<String,Object> boardListReplyProcess(
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam("gb_seq") int gb_seq){
		
		if(log.isDebugEnabled()){
			log.debug("<<currentPage>> : " + currentPage);
			log.debug("<<seq>> : " + gb_seq);
		}
		
		Map<String,Object> map = 
				new HashMap<String,Object>();
		map.put("gb_seq", gb_seq);
		
		//총 글의 갯수
		int count = boardService.getRowCountReply(map);
		
		PagingUtil page = new PagingUtil(currentPage, 
				count, rowCount, pageCount,null);
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<BoardReplyCommand> list = null;
		if(count > 0){
			list = boardService.listReply(map);
		}else{
			list = Collections.emptyList();
		}
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("count", count);
		mapJson.put("rowCount", rowCount);
		mapJson.put("list", list);
		
		return mapJson;
	}
	
	@RequestMapping("/board/writeReply.do")
	@ResponseBody
	public Map<String,String> boardWriteReplyProcess(BoardReplyCommand 
			                          boardReplyCommand,
			                          HttpSession session,
			                          HttpServletRequest request){
		if(log.isDebugEnabled()){
			log.debug("<<boardReplyCommand>> : " 
		                             + boardReplyCommand);
		}
		
		Map<String,String> map = new HashMap<String,String>();
		
		String user_id = (String)session.getAttribute("user_id");
		if(user_id==null){
			//로그인 안 됨
			map.put("result", "logout");
		}else{
			
			//ip등록
			boardReplyCommand.setIp(request.getRemoteAddr());
			
			//로그인 됨, 댓글 등록
			boardService.insertReply(boardReplyCommand);
			map.put("result", "success");
		}
		return map;
	}
	
	@RequestMapping("/board/updateReply.do")
	@ResponseBody
	public Map<String,String> boardUpdateReplyProcess(
			BoardReplyCommand boardReplyCommand,
			HttpSession session,
			HttpServletRequest request){
		
		if(log.isDebugEnabled()){
			log.debug("<<boardReplyCommand>> : " + boardReplyCommand);
		}
		
		Map<String,String> map = new HashMap<String,String>();
		
		String user_id = (String)session.getAttribute("user_id");
		
		if(user_id==null){
			//로그인이 안 되어있는 경우
			map.put("result", "logout");
		}else if(user_id!=null && 
				user_id.equals(boardReplyCommand.getId())){
			//로그인 아이디와 작성자 아이디 일치
			
			//ip 등록
			boardReplyCommand.setIp(request.getRemoteAddr());
			
			//댓글 수정
			boardService.updateReply(boardReplyCommand);
			map.put("result", "success");
		}else{
			//로그인 아이디와 작성자 아이디 불일치
			map.put("result", "wrongAccess");
		}
		
		return map;
	}
	
	@RequestMapping("/board/deleteReply.do")
	@ResponseBody
	public Map<String,String> boardDeleteReplyProcess(
			@RequestParam("gbre_no") int gbre_no,
			@RequestParam("id") String id,
			HttpSession session){
		
		if(log.isDebugEnabled()){
			log.debug("<<gbre_no>> : " + gbre_no);
			log.debug("<<id>> : " + id);
		}
		
		Map<String,String> map = new HashMap<String,String>();
		
		String user_id = (String)session.getAttribute("user_id");
		if(user_id==null){
			//로그인이 되어있지 않음
			map.put("result", "logout");
		}else if(user_id!=null && user_id.equals(id)){
			//로그인 되어 있고 로그인한 아이디와 작성자 아이디 일치
			boardService.deleteReply(gbre_no);
			map.put("result", "success");
		}else{
			map.put("result", "wrongAccess");
		}
		
		return map;
	}
	
}
