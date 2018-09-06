package com.daou.intern.admin.problem;

import java.util.List;

public class ProblemVO {

	private int problem_seq;
	private String problem;
	private String type;
	private String reg_id;
	private String reg_date;
	private String upt_id;
	private String upt_date;
	private String delete_yn;
	private String option_su;
	
	
	// 카테고리
	private int category_seq;
	private String category_name;
	
	
	// 검색
	private String scType;
	private String srch_input;
	

	
	
	public String getOption_su() {
		return option_su;
	}

	public void setOption_su(String option_su) {
		this.option_su = option_su;
	}

	public int getProblem_seq() {
		return problem_seq;
	}

	public void setProblem_seq(int problem_seq) {
		this.problem_seq = problem_seq;
	}

	public String getProblem() {
		return problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getCategory_seq() {
		return category_seq;
	}

	public void setCategory_seq(int category_seq) {
		this.category_seq = category_seq;
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

	public String getDelete_yn() {
		return delete_yn;
	}

	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getScType() {
		return scType;
	}

	public void setScType(String scType) {
		this.scType = scType;
	}

	public String getSrch_input() {
		return srch_input;
	}

	public void setSrch_input(String srch_input) {
		this.srch_input = srch_input;
	}
	
	

}
