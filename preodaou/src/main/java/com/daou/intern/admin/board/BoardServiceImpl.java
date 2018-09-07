package com.daou.intern.admin.board;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("boardService")
public class BoardServiceImpl implements BoardService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private BoardMapper boardMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public BoardVO test() {
		boardMapper = sqlSession.getMapper(BoardMapper.class);
		return boardMapper.test();
	}
}
