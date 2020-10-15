package com.yssy.service;

import java.util.List;

import com.yssy.model.Videoo;

public interface VideooService {
	void add(Videoo videoo);
	void deleteAll(String[] ids);
	void update(Videoo videoo);
	Videoo selectById(int id);
	//获取要播放的视频
	Videoo selectByVideooId(int videooId);
	//获取某课程所有视频
	List<Videoo> selectByCourseId(int courseId);
	//获取全部视频或模糊查询
	List<Videoo> selectLikeAll(Videoo videoo);
	//播放次数加一
	void addPlayNum(Integer videooId);
}
