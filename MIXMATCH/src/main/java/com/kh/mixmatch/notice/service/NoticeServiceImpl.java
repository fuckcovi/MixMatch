package com.kh.mixmatch.notice.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.mixmatch.notice.dao.NoticeMapper;
import com.kh.mixmatch.notice.domain.NoticeCommand;
import com.kh.mixmatch.notice.domain.NoticeReplyCommand;
@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	
	@Resource
	private NoticeMapper noticeMapper;
	
	@Override
	public void noticeInsert(NoticeCommand notice) {
		noticeMapper.noticeInsert(notice);
	}

	@Override
	public void noticeDelete(Integer gn_seq) {
		noticeMapper.noticeDelete(gn_seq);		
	}

	@Override
	public void noticeUpdate(NoticeCommand notice) {
		noticeMapper.noticeUpdate(notice);
	}

	@Override
	public void noticeUpdateHit(Integer gn_seq) {
		noticeMapper.noticeUpdateHit(gn_seq);
	}

	@Override
	public NoticeCommand noticeSelect(Integer gn_seq) {
		return noticeMapper.noticeSelect(gn_seq);
	}

	@Override
	public List<NoticeCommand> noticeList(Map<String, Object> map) {
		return noticeMapper.noticeList(map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return noticeMapper.getRowCount(map);
	}

	@Override
	public void insertReply(NoticeReplyCommand noticeReplyCommand) {
		noticeMapper.insertReply(noticeReplyCommand);
	}

	@Override
	public int getRowCountReply(Map<String, Object> map) {
		return noticeMapper.getRowCount(map);
	}

	@Override
	public List<NoticeReplyCommand> listReply(Map<String, Object> map) {
		return noticeMapper.listReply(map);
	}

	@Override
	public void updateReply(NoticeReplyCommand noticeReplyCommand) {
		noticeMapper.updateReply(noticeReplyCommand);
	}

	@Override
	public void deleteReply(Integer gnre_no) {
		noticeMapper.deleteReply(gnre_no);
	}
	
}
