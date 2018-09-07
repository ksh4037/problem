package com.daou.intern.admin.problem;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class ProblemController {
	@Autowired
	@Resource(name = "problemService")
	private ProblemService problemService;

	@RequestMapping(value = "admin/problemList")
	public ModelAndView problemList(HttpServletRequest request, HttpServletResponse response, ProblemVO pvo) {
		ModelAndView mav = new ModelAndView("admin/problem/problemList");
		List<ProblemVO> problemList = problemService.problemList(pvo);
		List<ProblemVO> categoryList = problemService.categoryList();
		
		mav.addObject("categoryList",categoryList);
		mav.addObject("problemList",problemList);
		mav.addObject("scType",pvo.getScType());
		mav.addObject("srch_input",pvo.getSrch_input());
		return mav;
	}
	
	@RequestMapping(value = "admin/problemDetail", method = RequestMethod.POST)
	public ModelAndView problemDetail( @RequestParam(value="problem_seq") int problem_seq, HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("admin/problem/problemDetail");
		
		ProblemVO problemDetail = problemService.problemDetail(problem_seq);
		List<HashMap<String, Object>> optionDetail = problemService.optionDetail(problem_seq);
		
		List<ProblemVO> categoryList = problemService.categoryList();
		mav.addObject("categoryList",categoryList);
		
		mav.addObject("problemDetail",problemDetail);
		mav.addObject("optionDetail",optionDetail);
		
		return mav;
	}
	
	@RequestMapping(value = "admin/problemRegForm")
	public ModelAndView problemRegForm(HttpServletRequest request, HttpServletResponse response, ProblemVO pvo) {
		ModelAndView mav = new ModelAndView("admin/problem/problemRegForm");
		
		List<ProblemVO> categoryList = problemService.categoryList();
		mav.addObject("categoryList",categoryList);
		
		return mav;
	}
	
	
	@RequestMapping(value = "admin/problemReg")
	public ModelAndView problemReg(HttpServletRequest request, HttpServletResponse response, ProblemVO pvo, 
							OptionVO ovo, @RequestParam(value="option_contents") String[] option_contents) {
		
		ModelAndView mav = new ModelAndView("admin/problem/result");
		String msg="";
		int p_result=0; //문제가 잘 저장되었는지 쿼리 리턴값을 받아오는 변수
		int o_result=0; //보기가 잘 저장되었는지 쿼리 리턴값을 받아오는 변수
		
	    try {
	    	if(pvo.getType().equals("1")) { 		// O/X 저장
	    		
	    		p_result = problemService.problemReg(pvo); 
				int problem_seq = problemService.selectProblemSeq(); 
				ovo.setProblem_seq(problem_seq);
				ovo.setAnswer_yn("Y");
				
				for(int i=0; i<option_contents.length; i++) {
					ovo.setOption_contents(option_contents[i]);
					o_result += problemService.optionReg(ovo);
				}
				
				if(p_result == 1 && o_result >= 1) {
					msg="success";
				}else {
					msg="error";
				}
	    		
	    	}else if (pvo.getType().equals("2")) { 	// 객관식 저장
	    		
	    		p_result = problemService.problemReg(pvo); 
				int problem_seq = problemService.selectProblemSeq(); 
				ovo.setProblem_seq(problem_seq);
					
				for(int i=0; i<option_contents.length; i++) {
					
					if(i == 0) {  // 첫 번째가 정답이니까
						ovo.setAnswer_yn("Y");
					}else {
						ovo.setAnswer_yn("N");
					}
					
					ovo.setOption_contents(option_contents[i]);
					o_result = problemService.optionReg(ovo);
				}
				
				if(p_result == 1 && o_result >= 1) {
					msg="success";
				}else {
					msg="error";
				}

	    	}
	    	
	    }catch(Exception e){
	    	mav.addObject("resultCode", "error");
	    }
	    
	    mav.addObject("resultCode", msg);
	    return mav;
	}
	
	

	@RequestMapping(value = "admin/deleteProblem")
	public ModelAndView deleteProblem(HttpServletRequest request, HttpServletResponse response,ProblemVO pvo) {
		ModelAndView mav = new ModelAndView("admin/problem/result");
		String msg="";
		
		try {
			int result = problemService.deleteProblem(pvo.getProblem_seq());
			
			if(result == 1) {
				msg = "success";
			}else {
				msg = "error";
			}
		}catch(Exception e){
	    	mav.addObject("resultCode", "error");
	    }
		
		mav.addObject("resultCode", msg);
		return mav;
	}
	
	@RequestMapping(value = "admin/problemUpdtForm")
	public ModelAndView problemUpdtForm( @RequestParam(value="problem_seq") int problem_seq, HttpServletRequest request, HttpServletResponse response) {
	
		ModelAndView mav = new ModelAndView("admin/problem/problemUpdtForm");
		
		ProblemVO problemDetail = problemService.problemDetail(problem_seq);
		List<HashMap<String, Object>> optionDetail = problemService.optionDetail(problem_seq);
		
		List<ProblemVO> categoryList = problemService.categoryList();
		mav.addObject("categoryList",categoryList);
		
		mav.addObject("problemDetail",problemDetail);
		mav.addObject("optionDetail",optionDetail);
	
		return mav;
	}
	
	
	
	
	@RequestMapping(value = "admin/problemUpdt")
	public ModelAndView problemUpdt(HttpServletRequest request, HttpServletResponse response, ProblemVO pvo, 
							OptionVO ovo, @RequestParam(value="option_contents") String[] option_contents) {
		
		ModelAndView mav = new ModelAndView("admin/problem/result");
		String msg="";
		int p_update_result=0;
		int o_delete_result=0;
		int o_reg_result=0;
		
	    try {
	    	if(pvo.getType().equals("1")) { 		// O/X 저장
	    		
				p_update_result = problemService.problemUpdt(pvo); 
				o_delete_result = problemService.deleteOption(pvo.getProblem_seq());
				
				ovo.setProblem_seq(pvo.getProblem_seq());
				ovo.setAnswer_yn("Y");
				
				for(int i=0; i<option_contents.length; i++) {
					ovo.setOption_contents(option_contents[i]);
					o_reg_result += problemService.optionReg(ovo);
				}
				
				if(p_update_result >=1 && o_delete_result >=1 && o_reg_result >=1) {
					msg="success";
				}else {
					msg="error";
				}
	    		
	    	}else if (pvo.getType().equals("2")) { 	// 객관식 저장
	    		
	    		p_update_result = problemService.problemUpdt(pvo); 
	    		o_delete_result =  problemService.deleteOption(pvo.getProblem_seq());
				
				ovo.setProblem_seq(pvo.getProblem_seq());
				
				for(int i=0; i<option_contents.length; i++) {
					
					if(i == 0) {  // 첫 번째가 정답이니까
						ovo.setAnswer_yn("Y");
					}else {
						ovo.setAnswer_yn("N");
					}
					
					ovo.setOption_contents(option_contents[i]);
					o_reg_result += problemService.optionReg(ovo);
				}
				
				if(p_update_result >=1 && o_delete_result >=1 && o_reg_result >=1) {
					msg="success";
				}else {
					msg="error";
				}
	    	}
	    }catch(Exception e){
	    	mav.addObject("resultCode", "error");
	    }
		mav.addObject("resultCode", msg);
	    return mav;
	}
	
	
	@RequestMapping(value = "admin/deleteChkProblem")
	public ModelAndView deleteChkProblem(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="rowid") Integer[] checkList) {
		
		ModelAndView mav = new ModelAndView("admin/problem/result");
		int result=0;
		String msg="";
		
		try {
			
			for(int i=0; i<checkList.length;i++) {
				result += problemService.deleteProblem(checkList[i]);
			}
			
			if(result >= 1) {
				msg="success";
			}else {
				msg="error";
			}
		}catch(Exception e){
	    	mav.addObject("resultCode", "error");
	    }
		
		mav.addObject("resultCode", msg);
		return mav;
	}
	
	@RequestMapping(value = "admin/categoryList")
	public ModelAndView categoryList() {
		ModelAndView mav = new ModelAndView("admin/problem/categoryList");
		
		List<ProblemVO> categoryList = problemService.categoryList();
		mav.addObject("categoryList",categoryList);
		
		return mav;
	}
	
	
	@RequestMapping(value = "admin/categoryDetail")
	public ModelAndView categoryDetail( @RequestParam(value="category_seq") int category_seq, HttpServletRequest request, HttpServletResponse response) {
		
	
		ModelAndView mav;
		String caller = request.getParameter("caller");
		
		if(caller.equals("updt")) {
			mav = new ModelAndView("admin/problem/categoryUpdtForm");
			
			ProblemVO categoryDetail = problemService.categoryDetail(category_seq);
			mav.addObject("categoryDetail",categoryDetail);
			
		}else{
			mav = new ModelAndView("admin/problem/categoryDetail");
			
			ProblemVO categoryDetail = problemService.categoryDetail(category_seq);
			mav.addObject("categoryDetail",categoryDetail);
		}
		
		return mav;
	}
	

	@RequestMapping(value = "admin/categoryUpdt")
	public ModelAndView categoryUpdt(HttpServletRequest request, HttpServletResponse response, ProblemVO pvo) {
		
		ModelAndView mav = new ModelAndView("admin/problem/result");
		int result = 0;
		String msg="";
	    try {
	    	result = problemService.categoryUpdt(pvo); 
	    	if(result == 1) {
	    		msg="success";
	    	}else {
	    		msg="error";
	    	}
	    }catch(Exception e){
	    	mav.addObject("resultCode", "error");
	    }
	    mav.addObject("resultCode", msg);
	    return mav;
	}
	
	@RequestMapping(value = "admin/categoryRegForm")
	public ModelAndView categoryRegForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("admin/problem/categoryRegForm");
		return mav;
	}
	
	@RequestMapping(value = "admin/categoryReg")
	public ModelAndView categoryReg(HttpServletRequest request, HttpServletResponse response, ProblemVO pvo) {
		
		ModelAndView mav = new ModelAndView("admin/problem/result");
		int result = 0;
		String msg="";
		
	    try {
	    	
	    	result = problemService.categoryReg(pvo); 
	    	
	    	if(result >= 1) {
	    		msg="success";
	    	}else {
	    		msg="error";
	    	}

	    }catch(Exception e){
	    	mav.addObject("resultCode", "error");
	    }
	    mav.addObject("resultCode", msg);
		return mav;
	}
	
	
	@RequestMapping(value = "admin/deleteCategory")
	public ModelAndView deleteCategory(HttpServletRequest request, HttpServletResponse response, ProblemVO pvo) {
		
		ModelAndView mav = new ModelAndView("admin/problem/result");
		String msg="";
		
		try {
			int result = problemService.deleteCategory(pvo.getCategory_seq());
			if(result == 1) {
				msg="success";
			}else {
				msg="error";
			}
		}catch(Exception e){
	    	mav.addObject("resultCode", "error");
	    }
		
		mav.addObject("resultCode", msg);
		
		return mav;
	}

	
	@RequestMapping(value = "admin/deleteChkCategory")
	public ModelAndView deleteChkCategory(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="rowid") Integer[] checkList) {
		
		ModelAndView mav = new ModelAndView("admin/problem/result");
		int result=0;
		String msg="";
		
		try {
			
			for(int i=0; i<checkList.length;i++) {
				result += problemService.deleteCategory(checkList[i]);
			}
			
			if(result >= 1) {
				msg="success";
			}else {
				msg="error";
			}
		}catch(Exception e){
	    	mav.addObject("resultCode", "error");
	    }
		
		mav.addObject("resultCode", msg);
		return mav;
	}
	
}
