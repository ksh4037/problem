package com.daou.intern.user.exam;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("examService")
public class ExamServiceImpl implements ExamService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private ExamMapper examMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public ExamVO test() {
		examMapper = sqlSession.getMapper(ExamMapper.class);
		return examMapper.test();
	}
}
