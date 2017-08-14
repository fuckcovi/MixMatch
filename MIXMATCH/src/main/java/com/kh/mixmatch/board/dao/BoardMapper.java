package com.kh.mixmatch.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.mixmatch.board.domain.BoardCommand;
import com.kh.mixmatch.board.domain.BoardReplyCommand;

public interface BoardMapper {
	//부모글
	public List<BoardCommand> list(Map<String,Object> map);
	public int getRowCount(Map<String,Object> map);
	@Insert("INSERT INTO g_board(gb_seq,gb_title,gb_content,gb_regdate,gb_uploadfile,gb_filename,ip,id) VALUES (g_board_seq.nextval,#{gb_title},#{gb_content},sysdate,#{gb_uploadfile,jdbcType=BLOB},#{gb_filename,jdbcType=VARCHAR},#{ip},#{id})")
	public void insert(BoardCommand board);
	@Select("SELECT * FROM g_board WHERE gb_seq=#{gb_seq}")
	public BoardCommand selectBoard(Integer gb_seq);
	@Update("UPDATE g_board SET gb_hit=gb_hit+1 WHERE gb_seq=#{gb_seq}")
	public void updateHit(Integer gb_seq);
	@Update("UPDATE g_board SET gb_title=#{gb_title},gb_content=#{gb_content},gb_uploadfile=#{gb_uploadfile,jdbcType=BLOB},gb_filename=#{gb_filename,jdbcType=VARCHAR},ip=#{ip} WHERE gb_seq=#{gb_seq}")
	public void update(BoardCommand board);
	@Delete("DELETE FROM g_board WHERE gb_seq=#{gb_seq}")
	public void delete(Integer gb_seq);
	//댓글
	public List<BoardReplyCommand> listReply(Map<String,Object> map);
	@Select("SELECT count(*) FROM g_board_re WHERE gb_seq=#{gb_seq}")
	public int getRowCountReply(Map<String,Object> map);
	@Insert("INSERT INTO g_board_re (gbre_no,gbre_content,gbre_date,ip,gb_seq,id) VALUES (gbre_seq.nextval,#{gbre_content},sysdate,#{ip},#{gb_seq},#{id})")
	public void insertReply(BoardReplyCommand boardReply);
	@Update("UPDATE g_board_re SET gbre_content=#{gbre_content},ip=#{ip} WHERE gbre_no=#{gbre_no}")
	public void updateReply(BoardReplyCommand boardReply);
	@Delete("DELETE FROM g_board_re WHERE gbre_no=#{gbre_no}")
	public void deleteReply(Integer gbre_no);
	
	//부모글 삭제시 댓글이 존재하면 부모글 삭제전 댓글 삭제
	@Delete("DELETE FROM g_board_re WHERE gb_seq=#{gb_seq}")
	public void deleteReplyBySeq(Integer gb_seq);
}
