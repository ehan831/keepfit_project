package com.keepfit.service;

import java.util.List;

import com.keepfit.domain.LikeVO;
import com.keepfit.domain.MemberVO;



public interface LikeService {
	
	// CRUD 기능의 메소드 구현	
		// 좋아요 추가-삭제
		void like(LikeVO vo);

		// like_user 좋아요 모두 조회
		List<LikeVO> getLikeList(LikeVO vo);

}
