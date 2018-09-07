package com.daou.intern.admin.problem;

import java.util.HashMap;
import java.util.List;

public interface ProblemMapper {
	
	// 문제관리
	public List<ProblemVO> problemList(ProblemVO pvo);
	public ProblemVO problemDetail(int problem_seq);
	public int problemReg(ProblemVO pvo);
	public int problemUpdt(ProblemVO pvo);
	public int deleteProblem(int problem_seq);
	public int selectProblemSeq();
	
	// 보기관리
	public List<HashMap<String, Object>> optionDetail(int problem_seq);
	public int optionReg(OptionVO ovo);
	public int deleteOption(int problem_seq);
	
	// 카테고리관리
	public List<ProblemVO> categoryList();
	public ProblemVO categoryDetail(int category_seq);
	public int categoryReg(ProblemVO pvo);
	public int categoryUpdt(ProblemVO pvo);
	public int deleteCategory(int category_seq);
}
