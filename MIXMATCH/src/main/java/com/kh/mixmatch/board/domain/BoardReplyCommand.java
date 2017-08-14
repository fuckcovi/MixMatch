package com.kh.mixmatch.board.domain;

import com.kh.mixmatch.util.DurationFromNow;

public class BoardReplyCommand {
	private int gbre_no;
	private String gbre_content;
	private String gbre_date;
	private String ip;
	private int gb_seq;
	private String id;
	
	public int getGbre_no() {
		return gbre_no;
	}
	public void setGbre_no(int gbre_no) {
		this.gbre_no = gbre_no;
	}
	public String getGbre_content() {
		return gbre_content;
	}
	public void setGbre_content(String gbre_content) {
		this.gbre_content = gbre_content;
	}
	public String getGbre_date() {
		return gbre_date;
	}
	public void setGbre_date(String gbre_date) {
		this.gbre_date = DurationFromNow.getTimeDiffLabel(gbre_date);
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getGb_seq() {
		return gb_seq;
	}
	public void setGb_seq(int gb_seq) {
		this.gb_seq = gb_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "BoardReplyCommand [gbre_no=" + gbre_no + ", gbre_content=" + gbre_content + ", gbre_date=" + gbre_date
				+ ", ip=" + ip + ", gb_seq=" + gb_seq + ", id=" + id + "]";
	}

}