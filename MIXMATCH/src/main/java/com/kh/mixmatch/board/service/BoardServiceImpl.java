package com.kh.mixmatch.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.mixmatch.board.dao.BoardMapper;
import com.kh.mixmatch.board.domain.BoardCommand;
import com.kh.mixmatch.board.domain.BoardReplyCommand;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Resource
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardCommand> list(Map<String, Object> map) {
		return boardMapper.list(map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return boardMapper.getRowCount(map);
	}

	@Override
	public void insert(BoardCommand board) {
		boardMapper.insert(board);
	}

	@Override
	public BoardCommand selectBoard(Integer gb_seq) {
		return boardMapper.selectBoard(gb_seq);
	}

	@Override
	public void updateHit(Integer gb_seq) {
		boardMapper.updateHit(gb_seq);
	}

	@Override
	public void update(BoardCommand board) {
		boardMapper.update(board);
	}

	@Override
	public void delete(Integer gb_seq) {
		//댓글이 존재하면 댓글을 우선 삭제하고 부모글을 삭제
		boardMapper.deleteReplyBySeq(gb_seq);
		//부모글 삭제
		boardMapper.delete(gb_seq);
	}

	@Override
	public List<BoardReplyCommand> listReply(Map<String, Object> map) {
		return boardMapper.listReply(map);
	}

	@Override
	public int getRowCountReply(Map<String, Object> map) {
		return boardMapper.getRowCountReply(map);
	}

	@Override
	public void insertReply(BoardReplyCommand boardReply) {
		boardMapper.insertReply(boardReply);
	}

	@Override
	public void updateReply(BoardReplyCommand boardReply) {
		boardMapper.updateReply(boardReply);
	}

	@Override
	public void deleteReply(Integer gbre_no) {
		boardMapper.deleteReply(gbre_no);
	}

	@Override
	public void updatePoint(String id) {
		boardMapper.updatePoint(id);
	}

	@Override
	public void updatePointRe(String id) {
		boardMapper.updatePointRe(id);
	}

}