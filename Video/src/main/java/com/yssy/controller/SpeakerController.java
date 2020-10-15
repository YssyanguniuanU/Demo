package com.yssy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yssy.model.Course;
import com.yssy.model.Speaker;
import com.yssy.service.SpeakerService;

@Controller
public class SpeakerController {

	private String Key,Value;
	
	@Autowired
	SpeakerService speakerService;
	
	@RequestMapping("speakerShow")
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
		List<Speaker> list = speakerService.selectLikeAll(key,value);
		PageInfo<Speaker> pageInfo = new PageInfo<Speaker>(list);
		req.setAttribute("speakerList", list);
		req.setAttribute("pageInfo", pageInfo);
		req.setAttribute("tag", tag);
		return "speakerShow";
	}
	
	@RequestMapping("speakerAdd")
	public String courseAdd(Speaker speaker, HttpServletRequest req, HttpServletResponse resp) {
		speakerService.add(speaker);
		return "redirect:speakerShow";
	}
	
	@RequestMapping("speakerById")
	public String courseById(String id, HttpServletRequest req, HttpServletResponse resp) {
		//传递要查询的主讲人
		Speaker speaker = speakerService.selectById(Integer.valueOf(id));
		req.setAttribute("speaker", speaker);
		return "speakerUpdate";
	}
	
	@RequestMapping("speakerUpdate")
	public String courseUpdate(Speaker speaker, HttpServletRequest req, HttpServletResponse resp) {
		speakerService.update(speaker);
		return "redirect:speakerShow";
	}
	
	@RequestMapping("speakerDeleteAll")
	public String courseDeleteAll(String id,HttpServletRequest req, HttpServletResponse resp) {
		String[] ids = req.getParameterValues("deleteBox");
		if (ids == null) {
			String[] strings = {id};
			ids = strings;
		}
		speakerService.deleteAll(ids);
		return "redirect:speakerShow";
	}
}
