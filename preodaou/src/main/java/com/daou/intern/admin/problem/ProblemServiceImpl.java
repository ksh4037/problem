package com.daou.intern.admin.problem;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("problemService")
public class ProblemServiceImpl implements ProblemService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private ProblemMapper problemMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 문제관리

	@Override
	public List<ProblemVO> problemList(ProblemVO pvo) {
		problemMapper = sqlSession.getMapper(ProblemMapper.class);
		return problemMapper.problemList(pvo);
	}

	@Override
	public ProblemVO problemDetail(int problem_seq) {
		problemMapper = sqlSession.getMapper(ProblemMapper.class);
		return problemMapper.problemDetail(problem_seq);
	}


	@Override
	public int problemReg(ProblemVO pvo) {
		problemMapper = sqlSession.getMapper(ProblemMapper.class);
		return problemMapper.problemReg(pvo);
	}
	
	@Override
	public int selectProblemSeq() {
		problemMapper = sqlSession.getMapper(ProblemMapper.class);
		return problemMapper.selectProblemSeq();
	}
	
	@Override
	public int deleteProblem(int problem_seq) {
		problemMapper = sqlSession.getMapper(ProblemMapper.class);
		return problemMapper.deleteProblem(problem_seq);
	}
	
	@Override
	public int problemUpdt(ProblemVO pvo) {
		problemMapper = sqlSession.getMapper(ProblemMapper.class);
		return problemMapper.problemUpdt(pvo);
	}
	
	// 보기관리
	@Override
	public List<HashMap<String, Object>> optionDetail(int problem_seq) {
		problemMapper = sqlSession.getMapper(ProblemMapper.class);
		return problemMapper.optionDetail(problem_seq);
	}
	
	
	@Override
	public int optionReg(OptionVO ovo) {
		problemMapper = sqlSession.getMapper(ProblemMapper.class);
		return problemMapper.optionReg(ovo);
	}
	
	@Override
	public int deleteOption(int problem_seq) {
		problemMapper = sqlSession.getMapper(ProblemMapper.class);
		return problemMapper.deleteOption(problem_seq);
	}
	

	// 카테고리 관리
	
	@Override
	public List<ProblemVO> categoryList() {
		problemMapper = sqlSession.getMapper(ProblemMapper.class);
		return problemMapper.categoryList();
	}

	@Override
	public ProblemVO categoryDetail(int category_seq) {
		problemMapper = sqlSession.getMapper(ProblemMapper.class);
		return problemMapper.categoryDetail(category_seq);
	}
	
	@Override
	public int categoryUpdt(ProblemVO pvo) {
		problemMapper = sqlSession.getMapper(ProblemMapper.class);
		return problemMapper.categoryUpdt(pvo);
	}
	
	@Override
	public int categoryReg(ProblemVO pvo) {
		problemMapper = sqlSession.getMapper(ProblemMapper.class);
		return problemMapper.categoryReg(pvo);
	}
	
	@Override
	public int deleteCategory(int category_seq) {
		problemMapper = sqlSession.getMapper(ProblemMapper.class);
		return problemMapper.deleteCategory(category_seq);
	}
	
}
