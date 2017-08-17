package com.kh.mixmatch.notice.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mixmatch.notice.domain.NoticeReplyCommand;
import com.kh.mixmatch.notice.service.NoticeService;
import com.kh.mixmatch.util.PagingUtil;

@Controller
public class NoticeReplyController {

	private Logger log = Logger.getLogger(this.getClass());
	
	private int rowCount = 10;
	private int pageCount = 10;
	
	@Resource
	private NoticeService noticeService;
	
	@ModelAttribute("noticeReplyCommand")
	public NoticeReplyCommand initCommand(){
		return new NoticeReplyCommand();
	}
	
	@RequestMapping(value="/notice/noticeWriteReply.do")
	@ResponseBody
	public Map<String, String> writeReply(NoticeReplyCommand noticeReplyCommand, HttpSession session, HttpServletRequest request){
		if(log.isDebugEnabled()){
			log.debug("<<noticeReplyCommand>> : " + noticeReplyCommand);
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		String user_id = (String)session.getAttribute("user_id");
		if(user_id == null){
			map.put("result", "logout");
		}else{
			//ip 등록
			noticeReplyCommand.setIp(request.getRemoteAddr());
			
			noticeService.insertReply(noticeReplyCommand);
			map.put("result", "success");
		}
		
		return map;
	}
	
	@RequestMapping(value="/notice/noticeListReply.do")
	@ResponseBody
	public Map<String, Object> listReply(@RequestParam(value="pageNum",defaultValue="1")int currentPage,@RequestParam("gn_seq")int gn_seq){
		if(log.isDebugEnabled()){
			log.debug("<<currentPage>> : " + currentPage);
			log.debug("<<seq>> : " + gn_seq);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gn_seq", gn_seq);
		
		//총 댓글의 개수
		int count = noticeService.getRowCountReply(map);
		PagingUtil page = new PagingUtil(currentPage, count, rowCount, pageCount, null);
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<NoticeReplyCommand> list = null;
		
		
		if(count > 0){
			list = noticeService.listReply(map);
		}else{
			list = Collections.emptyList();
		}
		
		Map<String, Object> mapJson = new HashMap<String, Object>();
		mapJson.put("count", count);
		mapJson.put("rowCount", rowCount);
		mapJson.put("list", list);
		
		return mapJson;
	}
	
	@RequestMapping(value="/notice/noticeUpdateReply.do")
	@ResponseBody
	public Map<String, String> updateReply(NoticeReplyCommand noticeReplyCommand, HttpSession session){
		if (log.isDebugEnabled()) {
			log.debug("<<noticeReplyCommand>> : " + noticeReplyCommand);
		}
		
		System.out.println(noticeReplyCommand);
		
		Map<String,String> map = new HashMap<String, String>();
		
		String user_id = (String)session.getAttribute("user_id");
		
		if (user_id == null) {
			//로그인이 안 되어있는 경우
			map.put("result", "logout");
		}else if(user_id != null && user_id.equals(noticeReplyCommand.getId())){
			//로그인 아이디와 작성자 아이디 일치
			//댓글 수정
			noticeService.updateReply(noticeReplyCommand);
			map.put("result", "success");
		}else{
			//로그인 아이디와 작성자 아이디 불일치
			map.put("result", "wrongAccess");
		}
		
		return map;
	}
	
	
	@RequestMapping(value="/notice/noticeDeleteReply.do")
	@ResponseBody
	public Map<String, String> deleteReply(@RequestParam("gnre_num")int gnre_num, @RequestParam("id")String id, HttpSession session){
		if(log.isDebugEnabled()){
			log.debug("<<re_no>> : " + gnre_num);
			log.debug("<<id>> : " + id);
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		String user_id = (String)session.getAttribute("user_id");
		if(user_id == null){
			//로그인 x
			map.put("result", "logout");
		}else if(user_id != null && user_id.equals(id)){
			//로그인 o, 로그인 아이디=작성자 아이디
			noticeService.deleteReply(gnre_num);
			map.put("result", "success");
		}else{
			map.put("result", "wrongAccess");
		}
		
		return map;
	}
}
