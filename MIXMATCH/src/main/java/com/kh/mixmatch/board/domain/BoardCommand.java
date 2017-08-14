package com.kh.mixmatch.board.domain;

import java.io.IOException;
import java.sql.Date;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class BoardCommand {
	private int gb_seq;
	@NotEmpty
	private String gb_title;
	@NotEmpty
	private String gb_content;
	private int gb_hit;
	private Date gb_regdate;
	private MultipartFile gb_upload;
	private byte[] gb_uploadfile;
	private String gb_filename;
	private String ip;
	@NotEmpty
	private String id;
	
	private int reply_cnt; //댓글 수
	
	public void setGb_upload(MultipartFile gb_upload) 
			                            throws IOException {
		this.gb_upload = gb_upload;
		
		setGb_uploadfile(gb_upload.getBytes());
		setGb_filename(gb_upload.getOriginalFilename());
	}
	  
	public int getGb_seq() {
		return gb_seq;
	}
	public void setGb_seq(int gb_seq) {
		this.gb_seq = gb_seq;
	}
	public String getGb_title() {
		return gb_title;
	}
	public void setGb_title(String gb_title) {
		this.gb_title = gb_title;
	}
	public String getGb_content() {
		return gb_content;
	}
	public void setGb_content(String gb_content) {
		this.gb_content = gb_content;
	}
	public int getGb_hit() {
		return gb_hit;
	}
	public void setGb_hit(int gb_hit) {
		this.gb_hit = gb_hit;
	}
	public Date getGb_regdate() {
		return gb_regdate;
	}
	public void setGb_regdate(Date gb_regdate) {
		this.gb_regdate = gb_regdate;
	}
	public MultipartFile getGb_upload() {
		return gb_upload;
	}
	public byte[] getGb_uploadfile() {
		return gb_uploadfile;
	}
	public void setGb_uploadfile(byte[] gb_uploadfile) {
		this.gb_uploadfile = gb_uploadfile;
	}
	public String getGb_filename() {
		return gb_filename;
	}
	public void setGb_filename(String gb_filename) {
		this.gb_filename = gb_filename;
	}
	
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public int getReply_cnt() {
		return reply_cnt;
	}

	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	
	//byte[]의 uploadfile은 제외!!!
	@Override
	public String toString() {
		return "BoardCommand [gb_seq=" + gb_seq + ", gb_title=" + gb_title + ", gb_content=" + gb_content + ", gb_hit=" + gb_hit + ", gb_regdate="
				+ gb_regdate + ", gb_upload=" + gb_upload + ", gb_filename=" + gb_filename + ", ip=" + ip + ", id=" + id
				+ ", reply_cnt=" + reply_cnt + "]";
	}
}