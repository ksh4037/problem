package com.daou.intern.user.exam;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExamController {
	@Autowired
	@Resource(name = "examService")
	private ExamService examService;

	@RequestMapping(value = "/exam.do")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView("exam/exam");
		mav.addObject("test", examService.test());
		return mav;
	}
}
