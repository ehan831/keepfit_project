package com.keepfit.service;

import java.util.List;

import com.keepfit.domain.MemberVO;
import com.keepfit.domain.PostVO;



public interface PostService {
	
	// CRUD 기능의 메소드 구현	
	// 게시물 등록
	int insertPost(PostVO vo);
	
	// 게시물 수정
	void updatePost(PostVO vo) ;
	
	// 게시물 삭제
	void deletePost(PostVO vo);

	// 게시물 상세 조회
	PostVO getPost(PostVO vo);

	// 총 게시물 조회
	List<PostVO> getPostList(PostVO vo);
	
	// 현재 게시물 번호 조회 (currval)
	PostVO getPostId();
}
