package com.yssy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yssy.dao.VideooDao;
import com.yssy.model.Videoo;
import com.yssy.service.VideooService;

@Service
public class VideooServiceImpl implements VideooService{

	@Autowired
	VideooDao dao;
	
	public void add(Videoo videoo) {
		dao.add(videoo);
	}

	public void deleteAll(String[] ids) {
		dao.deleteAll(ids);
	}

	public void update(Videoo videoo) {
		dao.update(videoo);
	}

	public Videoo selectById(int id) {
		Videoo videoo = new Videoo();
		videoo.setVideooId(id);
		List<Videoo> list = dao.selectAll(videoo);
		return list.size()==0?null:list.get(0);
	}

	public List<Videoo> selectLikeAll(Videoo videoo) {
		return dao.selectLikeAll(videoo);
	}


	public Videoo selectByVideooId(int videooId) {
		Videoo videoo = new Videoo();
		videoo.setVideooId(videooId);
		List<Videoo> list = dao.selectAll(videoo);
		return list.size()==0?null:list.get(0);
	}

	public List<Videoo> selectByCourseId(int courseId) {
		Videoo videoo = new Videoo();
		videoo.setCourseId(courseId);
		return dao.selectAll(videoo);
	}

	//视频播放次数加一
	public void addPlayNum(Integer videooId) {
		Videoo videoo = selectByVideooId(videooId);
		videoo.setPlayNum(videoo.getPlayNum()+1);
		dao.update(videoo);
	}
}
