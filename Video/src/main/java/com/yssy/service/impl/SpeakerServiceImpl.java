package com.yssy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yssy.dao.SpeakerDao;
import com.yssy.model.Speaker;
import com.yssy.service.SpeakerService;

@Service
public class SpeakerServiceImpl implements SpeakerService{

	@Autowired
	SpeakerDao dao;
	
	public void add(Speaker speaker) {
		dao.add(speaker);
	}

	public void update(Speaker speaker) {
		dao.update(speaker);
	}

	public void deleteAll(String[] ids) {
		dao.deleteAll(ids);
	}

	public List<Speaker> selectLikeAll(String key, String value) {
		Speaker speaker = new Speaker();
		if (key.equals("id")) {
			speaker.setSpeakerId(Integer.valueOf(value));
		} else if (key.equals("speakerName")) {
			speaker.setSpeakerName(value);
		} else if (key.equals("speakerDesc")) {
			speaker.setSpeakerDesc(value);
		} else if (key.equals("speakerJob")) {
			speaker.setSpeakerJob(value);
		}
		return dao.selectLikeAll(speaker);
	}

	public Speaker selectById(int id) {
		Speaker speaker = new Speaker();
		speaker.setSpeakerId(id);
		List<Speaker> list = dao.selectLikeAll(speaker);
		return list.size()==0?null:list.get(0);
	}

}
