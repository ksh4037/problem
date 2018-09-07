package com.daou.intern.admin.problem;

import java.util.HashMap;
import java.util.List;

public class OptionVO {
	private int option_seq;
	private int problem_seq;
	private String option_contents;
	private String answer_yn;
	private String reg_id;
	private String reg_date;
	private String upt_id;
	private String upt_date;
	private int option_su;

	public int getOption_seq() {
		return option_seq;
	}

	public void setOption_seq(int option_seq) {
		this.option_seq = option_seq;
	}

	public int getProblem_seq() {
		return problem_seq;
	}

	public void setProblem_seq(int problem_seq) {
		this.problem_seq = problem_seq;
	}


	

	public String getOption_contents() {
		return option_contents;
	}

	public void setOption_contents(String option_contents) {
		this.option_contents = option_contents;
	}

	public String getAnswer_yn() {
		return answer_yn;
	}

	public void setAnswer_yn(String answer_yn) {
		this.answer_yn = answer_yn;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getUpt_id() {
		return upt_id;
	}

	public void setUpt_id(String upt_id) {
		this.upt_id = upt_id;
	}

	public String getUpt_date() {
		return upt_date;
	}

	public void setUpt_date(String upt_date) {
		this.upt_date = upt_date;
	}
	

	public int getOption_su() {
		return option_su;
	}

	public void setOption_su(int option_su) {
		this.option_su = option_su;
	}


}
