package com.yssy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yssy.dao.CourseDao;
import com.yssy.model.Course;
import com.yssy.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService{

	@Autowired
	CourseDao dao;
	
	public void add(Course course) {
		dao.add(course);
	}

	public void update(Course course) {
		dao.update(course);
	}

	public int deleteAll(String[] ids) {
		return dao.deleteAll(ids);
	}

	public Course selectById(int id) {
		Course course = new Course(id,null,null,null,null,null);
		List<Course> list = dao.selectAll(course);
		return list.size()==0?null:list.get(0);
	}

	public List<Course> selectLikeAll(String key, String value) {
		Course course = new Course();
		if (key.equals("id")) {
			course.setCourseId(Integer.valueOf(value));
		} else if (key.equals("courseTitle")) {
			course.setCourseTitle(value);
		} else if (key.equals("courseDesc")) {
			course.setCourseDesc(value);
		}
		return dao.selectLikeAll(course);
	}

	public List<Course> selectCourseAndVideo(Integer videooId) {
		return dao.selectCourseAndVideoo(videooId);
	}
}
