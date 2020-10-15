package com.yssy.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yssy.model.Course;
import com.yssy.model.Subject;
import com.yssy.service.CourseService;
import com.yssy.service.SubjectService;

@Controller
public class CourseController {

	private String Key,Value;
	
	@Autowired
	CourseService courseService;
	@Autowired
	SubjectService subjectService;
	
	@RequestMapping("courseShow")
	public String courseShow(@RequestParam(value = "page",defaultValue = "1")int page,@RequestParam(value="tag",defaultValue="1")int tag,String key, String value, HttpServletRequest req, HttpServletResponse resp) {
		if (key == null) {
			key = tag==1?"":Key;
		} else {
			Key = key;
		}
		if (value == null) {
			value = tag==1?"":Value;
		} else {
			Value = value;
		}
		PageHelper.startPage(page,5);
		List<Course> list = courseService.selectLikeAll(key,value);
		PageInfo<Course> pageInfo = new PageInfo<Course>(list);
		req.setAttribute("courseList", list);
		req.setAttribute("pageInfo", pageInfo);
		req.setAttribute("tag", tag);
		return "courseShow";
	}
	
	@RequestMapping("courseGetSubject")
	public String getSubject(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("subjectList", subjectService.selectAll());
		return "courseAdd";
	}
	
	@RequestMapping("courseAdd")
	public String courseAdd(Course course, HttpServletRequest req, HttpServletResponse resp) {
		courseService.add(course);
		return "redirect:courseShow";
	}
	
	@RequestMapping("courseById")
	public String courseById(String id, HttpServletRequest req, HttpServletResponse resp) {
		//传递要查询的课程
		Course course = courseService.selectById(Integer.valueOf(id));
		req.setAttribute("course", course);
		//传递所有课程名
		req.setAttribute("subjectList", subjectService.selectAll());
		return "courseUpdate";
	}
	
	@RequestMapping("courseUpdate")
	public String courseUpdate(Course course, HttpServletRequest req, HttpServletResponse resp) {
		courseService.update(course);
		return "redirect:courseShow";
	}
	
	@RequestMapping("courseDeleteAll")
	public String courseDeleteAll(String id,HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String[] ids = req.getParameterValues("deleteBox");
		if (ids == null) {
			String[] strings = {id};
			ids = strings;
			int i = courseService.deleteAll(ids);
			if (i!=0) {
				resp.getWriter().write(String.valueOf("success"));
			} else {
				resp.getWriter().write(String.valueOf("err"));
			}
			return null;
		} else {
			courseService.deleteAll(ids);
			return "redirect:courseShow";
		}
	}

}
