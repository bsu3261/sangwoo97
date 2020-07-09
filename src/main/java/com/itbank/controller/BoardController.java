package com.itbank.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.BoardVO;
import com.itbank.dao.ReplyVO;
import com.itbank.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired private BoardService boardService;
	
	@RequestMapping("board/")
	public ModelAndView board(HttpServletRequest request) {
		return board(1, request);
	}

//public void test1() {}
//
//public String test2() {return "test";}
//
//public ModelAndView test3() {return new ModelAndView();}
//
//public void test4(@RequestParam String input1) {}
//public void test5(@RequestParam(required = false) String input2 ) {}
//public void test6(@ModelAttribute String input3) {}
//public void test7(@PathVariable String input4) {}
//public void test7(BoardVO vo) {}
//
//@RequestMapping("address")
//@RequestMapping(value="address", method=RequestMethod.GET)
//
//@RequestMapping("board.{input4}/")
//public void test8(@PathVariable("input4")int input4) {}
	
	
	@RequestMapping("board/{page}/")
	public ModelAndView board(@PathVariable("page")int page, HttpServletRequest request) {
		return boardService.getBoardList(page, request);
	}
	
	@RequestMapping("board/searchInit/")
	public ModelAndView searchInit() {
		return boardService.searchInit();
	}
	
	@RequestMapping(value="board/read/{num}/", method=RequestMethod.GET)
	public ModelAndView read(@PathVariable("num")int num) {
		System.out.println("num : " + num);
		return boardService.getBoard(num);
	}
	
	@RequestMapping(value = "board/read/{num}/", method = RequestMethod.POST)
	public ModelAndView insertReply(ReplyVO vo, @PathVariable("num")int num) {
		vo.setBnum(num);
		return boardService.insertReply(vo);
	}

	@RequestMapping(value="board/write/", method=RequestMethod.GET)
	public String write() {
		return "write";
	}
	
	@RequestMapping(value="board/write/", method=RequestMethod.POST)
	public ModelAndView writePost(BoardVO vo, HttpServletRequest request) {
		vo.setIpaddr(request.getRemoteAddr());	// 클라이언트의 IP 주소 추가
		return boardService.write(vo);
	}
	
	@RequestMapping("board/delete/{num}/")
	public String delete(@PathVariable("num")int num) {
	
		boardService.delete(num);
		return "redirect:/board/";
	}
	
	
	
	
	
	
	
}
