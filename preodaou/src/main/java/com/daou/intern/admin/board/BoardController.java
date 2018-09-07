package com.daou.intern.admin.board;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Autowired
	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping(value = "admin/board.do")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView("admin/board/board");
		mav.addObject("test", boardService.test());
		return mav;
	}
}
