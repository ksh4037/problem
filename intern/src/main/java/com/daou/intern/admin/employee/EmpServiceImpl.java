package com.daou.intern.admin.employee;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("empService")
public class EmpServiceImpl implements EmpService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private EmpMapper empMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public EmpVO test() {
		empMapper = sqlSession.getMapper(EmpMapper.class);
		return empMapper.test();
	}
}
