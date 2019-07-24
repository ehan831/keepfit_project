package com.keepfit.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.keepfit.domain.LikeVO;



@Repository("likeDAO")
public class LikeDAOImpl implements LikeDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// 좋아요 추가-삭제
	@Override
	public void like(LikeVO vo) {
		System.out.println("===> Mybatis insertLike() 호출");
		LikeVO likeExists = mybatis.selectOne("db.likeExists", vo);
		if (likeExists != null) {
			mybatis.delete("db.deleteLike", vo);
			System.out.println(vo.getLike_user() + ": 좋아요 삭제");
		} else {
			mybatis.insert("db.insertLike", vo);
			System.out.println(vo.getLike_user() + ": 좋아요 +1");
		}
		
	}

	// 좋아요 개수 조회
	@Override
	public int getLike(LikeVO vo) {
		System.out.println("===> Mybatis getLike() 호출");
		return mybatis.selectOne("db.getLike", vo);
	}
	
	
}	// end of LikeDAOImpl