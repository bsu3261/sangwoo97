package com.itbank.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.BoardDAO;
import com.itbank.dao.BoardParam;
import com.itbank.dao.BoardVO;
import com.itbank.dao.ReplyVO;

@Service
public class BoardService {

	@Autowired private BoardDAO dao;
	
	private final int perPage = 10;		// 페이지 당 출력할 글의 개수
	private String searchType;			// 검색타입 저장할 멤버 필드
	private String searchWord;			// 검색단어 저장할 멤버 필드
	
	public ModelAndView getBoardList(int page, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("board");

		// 검색 파라미터 처리 
		BoardParam bp = new BoardParam();
		String st = request.getParameter("searchType");
		String sw = request.getParameter("searchWord");
		searchType = st != null ? st : searchType;	// 입력값이 없으면 기존 검색어를 그대로 사용
		searchWord = sw != null ? sw : searchWord;
		bp.setSearchType(searchType);
		bp.setSearchWord(searchWord);
		
		// 총 페이지 개수
		int boardCount = dao.selectCount(bp);
		int pageCount = boardCount / perPage;
		pageCount += boardCount % perPage == 0 ? 0 : 1;
		
		// 작은 페이징
		int first = (page - 1) * perPage + 1;
		int last = first + perPage - 1;
		bp.setStart(first);	// 시작 글 rownum
		bp.setEnd(last);	// 마지막 글 rownum
		
		// 큰 페이징
		int section = (page - 1) / 10;
		int begin = 10 * section + 1;
		int end = begin + 9 > pageCount ? pageCount : begin + 9;
		
		System.out.println("first : " + first );	// 첫번째 글 번호
		System.out.println("last : " + last);		// 마지막 글 번호
		System.out.println("section : " + section);	// 페이징 구역
		System.out.println("begin : " + begin);		// 페이징에 표시할 시작 페이지
		System.out.println("end : " + end);			// 페이징에 표시할 마지막 페이지
		System.out.println("boardCount : " + boardCount);	// 총 게시글 개수
		System.out.println("pageCount : " + pageCount);		// 총 페이지 개수
		System.out.println("prev : " + (section != 0));		// 이전을 표시할 조건
		System.out.println("next : " + (boardCount > perPage * end));	// 다음을 표시할 조건
		System.out.println("==========================");
		
		// 뷰에 전달
		mav.addObject("list", dao.selectAll(bp));
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("page", page);
		mav.addObject("bp", bp);
		mav.addObject("prev", section != 0);
		mav.addObject("next", boardCount > perPage * end);
		
		return mav;
	}

	public ModelAndView getBoard(int num) {
		ModelAndView mav = new ModelAndView("read");
		// 글 번호로 게시글 정보 가져오기
		
		mav.addObject("vo", dao.selectOne(num));
		dao.plusViewCount(num);
		
		//댓글
		mav.addObject("replyList", dao.selectReplyList(num));
		
		return mav;
	}

	public ModelAndView write(BoardVO vo) {
		ModelAndView mav = new ModelAndView("redirect:/board/");
		mav.addObject("result", dao.insert(vo));
		return mav;
	}

	public ModelAndView searchInit() {
		ModelAndView mav = new ModelAndView("redirect:/board/");
		searchType = null;
		searchWord = null;
		return mav;
	}

	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public ModelAndView insertReply(ReplyVO vo) {
		ModelAndView mav = new ModelAndView("redirect:/board/read/" + vo.getBnum() + "/");
//		ModelAndView mav = new ModelAndView("redirect:/");
		mav.addObject(dao.insert(vo));
		
		
		System.out.println(vo.getBnum());
		System.out.println(vo.getContext());
		System.out.println(vo.getWriter());
		System.out.println(vo.getTime());
		
		
		return mav;
	}
	@Transactional	//트랜젝션에는 AOP의 기술이 녹아 있다
	public void delete(int num) {
		//댓글이 먼저 지워져야 게시판을 삭제 할 수 있다
		//외래키 참조의 특성
//		ModelAndView mav = new ModelAndView();
		dao.deletereply(num + 1000);
		//게시글 삭제
		dao.delete(num);
//		mav.setViewName("redirect:/board/");
//		return mav;
		
	}
	
	
	

	
}
