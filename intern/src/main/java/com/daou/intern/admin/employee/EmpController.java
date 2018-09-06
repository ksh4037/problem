package com.daou.intern.admin.employee;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmpController {
	@Autowired
	@Resource(name = "empService")
	private EmpService empService;

	@RequestMapping(value = "/ee")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView("admin/employee/employee");
		mav.addObject("test", empService.test());
		return mav;
	}
}
