package com.kh.mixmatch.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.kh.mixmatch.board.domain.BoardCommand;
import com.kh.mixmatch.board.domain.BoardReplyCommand;

@Transactional
public interface BoardService {
	//부모글
	@Transactional(readOnly=true)
	public List<BoardCommand> list(Map<String,Object> map);
	@Transactional(readOnly=true)
	public int getRowCount(Map<String,Object> map);
	public void insert(BoardCommand board);
	@Transactional(readOnly=true)
	public BoardCommand selectBoard(Integer gb_seq);
	public void updateHit(Integer gb_seq);
	public void update(BoardCommand board);
	public void delete(Integer gb_seq);
	//댓글
	@Transactional(readOnly=true)
	public List<BoardReplyCommand> listReply(Map<String,Object> map);
	@Transactional(readOnly=true)
	public int getRowCountReply(Map<String,Object> map);
	public void insertReply(BoardReplyCommand boardReply);
	public void updateReply(BoardReplyCommand boardReply);
	public void deleteReply(Integer gbre_no);
}