package com.kh.mixmatch.notice.domain;

public class NoticeReplyCommand {

	private int gnre_no;
	private String gnre_content;
	private String gnre_date;
	private String id;
	private String ip;
	private int gn_seq;
	
	public int getGnre_no() {
		return gnre_no;
	}
	public void setGnre_no(int gnre_no) {
		this.gnre_no = gnre_no;
	}
	public String getGnre_content() {
		return gnre_content;
	}
	public void setGnre_content(String gnre_content) {
		this.gnre_content = gnre_content;
	}
	public String getGnre_date() {
		return gnre_date;
	}
	public void setGnre_date(String gnre_date) {
		this.gnre_date = gnre_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getGn_seq() {
		return gn_seq;
	}
	public void setGn_seq(int gn_seq) {
		this.gn_seq = gn_seq;
	}
	
	@Override
	public String toString() {
		return "NoticeReplyCommand [gnre_no=" + gnre_no + ", gnre_content=" + gnre_content + ", gnre_date=" + gnre_date
				+ ", id=" + id + ", ip=" + ip + ", gn_seq=" + gn_seq + "]";
	}
	
}
