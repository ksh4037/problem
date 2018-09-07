/**
 *   // 좌측 메뉴 링크제어
 */


$(document).ready(function() {
	var path = window.location.href;
	if(path.indexOf("admin/problem") != -1) {
		$("#problem_li").addClass("active_1"); 
		$("#exam_li").removeClass("active_1"); 
		$("#member_li").removeClass("active_1"); 
		$("#board_li").removeClass("active_1"); 
		$("#write_li").removeClass("active_1"); 
	}
	if(path.indexOf("admin/category") != -1) {
		$("#problem_li").addClass("active_1"); 
		$("#exam_li").removeClass("active_1"); 
		$("#member_li").removeClass("active_1"); 
		$("#board_li").removeClass("active_1"); 
		$("#write_li").removeClass("active_1"); 
	}
	if(path.indexOf("admin/employee") != -1) {
		$("#member_li").addClass("active_1"); 
		$("#exam_li").removeClass("active_1"); 			
		$("#problem_li").removeClass("active_1"); 
		$("#board_li").removeClass("active_1"); 
		$("#write_li").removeClass("active_1"); 
	}
	if(path.indexOf("admin/board") != -1) {
		$("#board_li").addClass("active_1"); 
		$("#exam_li").removeClass("active_1"); 
		$("#problem_li").removeClass("active_1"); 
		$("#member_li").removeClass("active_1"); 
		$("#write_li").removeClass("active_1"); 
	}
	if(path.indexOf("admin/exam") != -1) {
		$("#exam_li").addClass("active_1"); 
		$("#board_li").removeClass("active_1"); 
		$("#problem_li").removeClass("active_1"); 
		$("#member_li").removeClass("active_1"); 
		$("#write_li").removeClass("active_1"); 
	}

});


