package com.kh.mixmatch.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.mixmatch.notice.domain.NoticeCommand;
import com.kh.mixmatch.notice.domain.NoticeReplyCommand;


public interface NoticeMapper {
	@Insert("INSERT INTO g_notice (gn_seq,gn_title,gn_content,gn_hit,gn_uploadfile,gn_filename,gn_regdate,ip,id) VALUES(g_notice_seq.nextval,#{gn_title},#{gn_content},#{gn_hit},#{gn_uploadfile,jdbcType=BLOB},#{gn_filename,jdbcType=VARCHAR},sysdate,#{ip},#{id})")
	public void noticeInsert(NoticeCommand notice);
	@Delete("DELETE FROM g_notice WHERE gn_seq=#{gn_seq}")
	public void noticeDelete(Integer gn_seq);
	@Update("UPDATE g_notice SET gn_title=#{gn_title},gn_content=#{gn_content},gn_uploadfile=#{gn_uploadfile,jdbcType=BLOB},gn_filename=#{gn_filename,jdbcType=VARCHAR},ip=#{ip} WHERE gn_seq=#{gn_seq}")
	public void noticeUpdate(NoticeCommand notice);
	@Update("UPDATE g_notice SET gn_hit=gn_hit+1 WHERE gn_seq=#{gn_seq}")
	public void noticeUpdateHit(Integer gn_seq);
	@Select("SELECT * FROM g_notice WHERE gn_seq=#{gn_seq}")
	public NoticeCommand noticeSelect(Integer gn_seq);
	
	public int getRowCount(Map<String, Object> map);
	public List<NoticeCommand> noticeList(Map<String, Object> map);
	
	//댓글
	@Insert("INSERT INTO g_notice_re (gnre_no,gnre_content,gnre_date,id,ip,gn_seq) VALUES (gnbre_seq.nextval,#{gnre_content},sysdate,#{id},#{ip},#{gn_seq})")
	public void insertReply(NoticeReplyCommand noticeReplyCommand);
	@Select("SELECT count(*) FROM g_notice_re WHERE h_seq=#{h_seq}")
	public int getRowCountReply(Map<String,Object> map);
	public List<NoticeReplyCommand> listReply(Map<String,Object> map);
	@Update("UPDATE g_notice_re SET gnre_content=#{gnre_content},ip=#{ip} WHERE gnre_no=#{gnre_no}")
	public void updateReply(NoticeReplyCommand noticeReplyCommand);
	@Delete("DELETE FROM g_notice_re WHERE gnre_no=#{gnre_no}")
	public void deleteReply(Integer gnre_no);
	
}
