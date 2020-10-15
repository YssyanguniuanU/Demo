package com.yssy.service;

import java.util.List;

import com.yssy.model.Subject;

public interface SubjectService {
	List<Subject> selectAll();
	Subject selectById(Integer subjectId);
	List<Subject> selectCourseAndVideo(int subjectId);
}
