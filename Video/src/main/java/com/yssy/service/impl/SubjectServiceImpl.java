package com.yssy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yssy.dao.SubjectDao;
import com.yssy.model.Subject;
import com.yssy.service.SubjectService;

@Service
public class SubjectServiceImpl implements SubjectService{

	@Autowired
	SubjectDao dao;

	public List<Subject> selectCourseAndVideo(int subjectId) {
		return dao.selectCourseAndVideo(subjectId);
	}

	public List<Subject> selectAll() {
		Subject subject = new Subject();
		return dao.selectAll(subject);
	}

	public Subject selectById(Integer subjectId) {
		Subject subject = new Subject(subjectId,null,null);
		List<Subject> list = dao.selectAll(subject);
		return list.size()==0?null:list.get(0);
	}

}
