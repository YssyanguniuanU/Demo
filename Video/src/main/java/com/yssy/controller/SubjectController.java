package com.yssy.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yssy.model.Subject;
import com.yssy.service.SubjectService;

@Controller
public class SubjectController {

	@Autowired
	SubjectService service;
	
	@RequestMapping("subjectCourseAndVideoo")
	public String subjectCourseAndVideoo(Integer subjectId,HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		//获取课程名称
		Subject subjectN = service.selectById(subjectId);
		
		//获取该学科所有课程和视频
		List<Subject> cavList = service.selectCourseAndVideo(subjectId);
		
		req.setAttribute("subjectN", subjectN);
		req.setAttribute("cavList", cavList);
		return "QcourseShow";
	}
}
