package com.itbank.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired private SqlSessionTemplate sst;
	
	public List<BoardVO> selectAll(BoardParam bp) {
		return sst.selectList("board.selectAll", bp);
	}

	public int selectCount(BoardParam bp) {
		return sst.selectOne("board.count", bp);
	}

	public BoardVO selectOne(int num) {
		return sst.selectOne("board.selectOne", num);
	}

	public int insert(ReplyVO vo) {
		return sst.insert("board.insertReply", vo);
	}
	public int insert(BoardVO vo) {
		return sst.insert("insert", vo);
	}

	public int plusViewCount(int num) {
		return sst.update("plusViewCount", num);
	}

	public List<ReplyVO> selectReplyList(int num) {
		// TODO Auto-generated method stub
		return sst.selectList("replyList", num);
	}

	public Object delete(int num) {
		return sst.delete("delete", num);
	}

	public Object deletereply(int num) {
		return sst.delete("deleteReply", num);
	}
	
		
	
}
