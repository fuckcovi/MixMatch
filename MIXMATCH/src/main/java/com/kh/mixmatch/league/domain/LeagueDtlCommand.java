package com.kh.mixmatch.league.domain;

public class LeagueDtlCommand {

	private int ld_seq;
	private int l_seq;
	private String t_name;
	private String ld_check;
	
	// 조인
	private int t_win;
	private int t_draw;
	private int t_lose;

	public int getT_win() {
		return t_win;
	}
	public void setT_win(int t_win) {
		this.t_win = t_win;
	}
	public int getT_draw() {
		return t_draw;
	}
	public void setT_draw(int t_draw) {
		this.t_draw = t_draw;
	}
	public int getT_lose() {
		return t_lose;
	}
	public void setT_lose(int t_lose) {
		this.t_lose = t_lose;
	}
	
	public int getLd_seq() {
		return ld_seq;
	}
	public void setLd_seq(int ld_seq) {
		this.ld_seq = ld_seq;
	}
	public int getL_seq() {
		return l_seq;
	}
	public void setL_seq(int l_seq) {
		this.l_seq = l_seq;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getLd_check() {
		return ld_check;
	}
	public void setLd_check(String ld_check) {
		this.ld_check = ld_check;
	}
	
	@Override
	public String toString() {
		return "LeagueDtlCommand [ld_seq=" + ld_seq + ", l_seq=" + l_seq + ", t_name=" + t_name + ", ld_check="
				+ ld_check + "]";
	}
	
}
