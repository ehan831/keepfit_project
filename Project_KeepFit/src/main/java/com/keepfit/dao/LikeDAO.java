package com.keepfit.dao;

import java.util.List;

import com.keepfit.domain.LikeVO;
import com.keepfit.domain.MemberVO;


public interface LikeDAO {
	
	// 좋아요 추가-삭제
	public void like(LikeVO vo);

	// like_user 좋아요 모두 조회
	public LikeVO getLikeList(LikeVO vo);

}
