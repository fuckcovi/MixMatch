package com.kh.mixmatch.notice.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.mixmatch.notice.domain.NoticeCommand;
import com.kh.mixmatch.notice.service.NoticeService;
import com.kh.mixmatch.util.PagingUtil;

@Controller
public class NoticeController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private NoticeService noticeService;
	
	@ModelAttribute("noticeCommand")
	public NoticeCommand initCommand(){
		return new NoticeCommand();
	}
	
	private int rowCount = 10;
	private int pageCount = 5;
	
	@RequestMapping("/notice/notice.do")
	public ModelAndView noticeList(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
			@RequestParam(value="keyfield",defaultValue="") String keyfield,
			@RequestParam(value="keyword",defaultValue="") String keyword){
		
		if(log.isDebugEnabled()){
			log.debug("<<pageNum>> : " +currentPage);
			log.debug("<<keyfield>> : " +keyfield);
			log.debug("<<keyword>> : " +keyword);
		}
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyfield",keyfield);
		map.put("keyword", keyword);
		
		int count = noticeService.getRowCount(map);
		if(log.isDebugEnabled()){
			log.debug("<<<count>> : "+count );
		}
		PagingUtil page = new PagingUtil(currentPage, count, rowCount, pageCount, "notice.do");
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		List<NoticeCommand> list = null;
		
		if(count>0){
			list = noticeService.noticeList(map);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice");
		mav.addObject("pagingHtml",page.getPagingHtml());
		mav.addObject("count",count);
		mav.addObject("list",list);
		return mav; 
	}
	
	@RequestMapping(value="/notice/noticeInsert.do",method=RequestMethod.GET)
	public String noticeInsertForm(HttpSession session, Model model){
		String id = (String)session.getAttribute("user_id");
		NoticeCommand noticeCommand = new NoticeCommand();
		noticeCommand.setId(id);
		model.addAttribute("noticeCommand", noticeCommand);
		return "noticeInsert";
	}
	
	@RequestMapping(value="/notice/noticeInsert.do",method=RequestMethod.POST)
	public String noticeInsertSubmit(@ModelAttribute("command") @Valid NoticeCommand noticeCommand, BindingResult result, HttpServletRequest request){
		if(log.isDebugEnabled()){
			log.debug("<<<<<<< noticeCommand : " +noticeCommand);
		}
		if(result.hasErrors()){
			return "noticeInsert";
		}
		noticeCommand.setIp(request.getRemoteAddr());
		// �۾���
		noticeService.noticeInsert(noticeCommand);
		return "redirect:/notice/notice.do";
	}
	
	@RequestMapping("/notice/noticeDetail.do")
	public ModelAndView noticeDetail(@RequestParam int gn_seq){
		if(log.isDebugEnabled()){
			log.debug("<<<< gn_seq>>>>> : " +gn_seq);
		}
		// �ش� ���� ��ȸ�� ����
		noticeService.noticeUpdateHit(gn_seq);
		NoticeCommand notice = noticeService.noticeSelect(gn_seq);
		
		return new ModelAndView("noticeDetail","notice",notice);
	}
	
	@RequestMapping(value="/notice/noticeUpdate.do",method=RequestMethod.GET)
	public ModelAndView noticeUpdate(@RequestParam("gn_seq")int gn_seq){
		if(log.isDebugEnabled()){
			log.debug("<<<< gn_seq>>>>> : " +gn_seq);
		}
		
		NoticeCommand noticeCommand = noticeService.noticeSelect(gn_seq);
		
		return new ModelAndView("noticeUpdate","noticeCommand",noticeCommand);
	}
	
	@RequestMapping(value="/notice/noticeUpdate.do",method=RequestMethod.POST)
	public String noticeUpdateSubmit(@ModelAttribute("command") @Valid NoticeCommand noticeCommand, BindingResult result, HttpServletRequest request, HttpSession session ){
		
		if(log.isDebugEnabled()){
			log.debug("<<noticeCommand>> : " + noticeCommand);
		}
		
		String user_id = (String)session.getAttribute("user_id");
		
		NoticeCommand notice = noticeService.noticeSelect(noticeCommand.getGn_seq());
		
		if(result.hasErrors()){
			notice.setGn_filename((noticeCommand.getGn_filename()));
			
			return "noticeUpdate";
		}
	     
		//전송된 파일이 없을 경우
		if(noticeCommand.getGn_uploadfile_upload().isEmpty()){
			//기존 정보 셋팅
			noticeCommand.setGn_uploadfile(notice.getGn_uploadfile());
			noticeCommand.setGn_filename(notice.getGn_filename());
		}
		
		//id세팅
		noticeCommand.setId(user_id);
		//ip셋팅
		noticeCommand.setIp(request.getRemoteAddr());
	     
		//글수정
		noticeService.noticeUpdate(noticeCommand);
	   
		return "redirect:/notice/notice.do";
	}

	// ���� �ٿ�ε�
	@RequestMapping("/notice/noticefile.do")
	public ModelAndView download(@RequestParam int gn_seq){
		NoticeCommand notice = noticeService.noticeSelect(gn_seq);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("downloadView");
		mav.addObject("downloadFile",notice.getGn_uploadfile());
		mav.addObject("filename", notice.getGn_filename());
		return mav;
	}
	
	// �̹��� ���
	@RequestMapping("/notice/noticeimageView.do")
	public ModelAndView viewImage(@RequestParam int n_seq){
		NoticeCommand notice = noticeService.noticeSelect(n_seq);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile",notice.getGn_uploadfile());
		mav.addObject("filename",  notice.getGn_filename());
		return mav;
	}
}
