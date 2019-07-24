package com.keepfit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keepfit.dao.LikeDAOImpl;
import com.keepfit.dao.MemberDAOImpl;
import com.keepfit.domain.LikeVO;
import com.keepfit.domain.MemberVO;


@Service("likeService")
public class LikeServiceImpl implements LikeService {
	
	@Autowired
	private LikeDAOImpl likeDAO;


	@Override
	public void like(LikeVO vo) {
		likeDAO.like(vo);		
	}

	@Override
	public LikeVO getLikeList(LikeVO vo) {		
		return likeDAO.getLikeList(vo);
	}
	
	
}	// end of LikeServiceImpl