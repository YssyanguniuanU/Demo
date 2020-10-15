package com.yssy.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yssy.model.Subject;
import com.yssy.model.Videoo;
import com.yssy.service.CourseService;
import com.yssy.service.SpeakerService;
import com.yssy.service.SubjectService;
import com.yssy.service.VideooService;

@Controller
public class VideooController {

	private Videoo Videoo = new Videoo();
	
	@Autowired
	VideooService videooService;
	@Autowired
	CourseService courseService;
	@Autowired
	SpeakerService speakerService;
	@Autowired
	SubjectService subjectService;
	
	@RequestMapping("videooShow")
	public String videooShow(@RequestParam(value = "page",defaultValue = "1")int page,@RequestParam(value="tag",defaultValue="1")int tag,Videoo videoo, HttpServletRequest req, HttpServletResponse resp) {
		if (videoo.getSpeakerId() == null && videoo.getCourseId()==null) {
			videoo = tag==1?new Videoo():Videoo;
		} else {
			if (videoo.getSpeakerId()==null) {
				Videoo.setSpeakerId(0);
				Videoo.setCourseId(videoo.getCourseId());
			} else if (videoo.getCourseId()==null) {
				Videoo.setSpeakerId(videoo.getSpeakerId());
				Videoo.setCourseId(0);
			} else {
				Videoo.setSpeakerId(videoo.getSpeakerId());
				Videoo.setCourseId(videoo.getCourseId());
			}
		}
		PageHelper.startPage(page,5);
		List<Videoo> list = videooService.selectLikeAll(videoo);
		PageInfo<Videoo> pageInfo = new PageInfo<Videoo>(list);
		req.setAttribute("videooList", list);
		req.setAttribute("pageInfo", pageInfo);
		req.setAttribute("tag", tag);
		req.setAttribute("speakerList", speakerService.selectLikeAll("", ""));
		req.setAttribute("courseList", courseService.selectLikeAll("", ""));
		Videoo = tag==1?new Videoo():Videoo;
		req.setAttribute("Videoo", Videoo);
		return "videooShow";
	}
	
	@RequestMapping("videooAdd")
	public String videooAdd(Videoo videoo, HttpServletRequest req, HttpServletResponse resp) {
		videooService.add(videoo);
		return "redirect:videooShow";
	}
	
	@RequestMapping("videooById")
	public String videooById(String id, HttpServletRequest req, HttpServletResponse resp) {
		//传递要查询的视频
		Videoo videoo = videooService.selectById(Integer.valueOf(id));
		req.setAttribute("videoo", videoo);
		req.setAttribute("speakerList", speakerService.selectLikeAll("", ""));
		req.setAttribute("courseList", courseService.selectLikeAll("", ""));
		return "videooUpdate";
	}
	
	@RequestMapping("videooUpdate")
	public String videooUpdate(Videoo videoo, HttpServletRequest req, HttpServletResponse resp) {
		videooService.update(videoo);
		return "redirect:videooShow";
	}
	
	@RequestMapping("videooDeleteAll")
	public String videooDeleteAll(String id,HttpServletRequest req, HttpServletResponse resp) {
		String[] ids = req.getParameterValues("deleteBox");
		if (ids == null) {
			String[] strings = {id};
			ids = strings;
		}
		videooService.deleteAll(ids);
		return "redirect:videooShow";
	}
	
	//获取主讲人和课程信息
	@RequestMapping("videoGetSpeakerAndCourse")
	public String getSpeakerAndCourse(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("speakerList", speakerService.selectLikeAll("", ""));
		req.setAttribute("courseList", courseService.selectLikeAll("", ""));
		return "videooAdd";
	}

	//获取播放页面视频列表
	@RequestMapping("getVideoList")
	public String getVideoList(Videoo videoo, HttpServletRequest req, HttpServletResponse resp) {
		//查询某个课程全部的视频信息
		List<Videoo> videoList = videooService.selectByCourseId(videoo.getCourseId());
		//查询要播放的视频信息
		Videoo videooPlay = videooService.selectByVideooId(videoo.getVideooId());
		
		//获取课程名称
		Subject subject = subjectService.selectById(Integer.valueOf(videooPlay.getCourse().getSubjectId()));
		
		//传递参数
		req.setAttribute("subject", subject);
		req.setAttribute("videooList", videoList);
		req.setAttribute("videooPlay", videooPlay);
		return "videoPlay";
	}
	
	//播放次数加1
	@RequestMapping("addPlayNum")
	public void getVideoList(String videooId, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		videooService.addPlayNum(Integer.valueOf(videooId));
		
		resp.getWriter().write("success");
	}
}
