package com.keepfit.domain;

// 댓글 관련 VO (Value Object)
public class LikeVO {

	private int 	like_id=0;	 // 좋아요 코드 (PK / SEQ)
	private String 	like_user;	 // 좋아요 작성자 닉네임
	private int 	post_id=0;	 // 게시글 코드
	private String like_date;


	public String getLike_date() {
		return like_date;
	}

	public void setLike_date(String like_date) {
		this.like_date = like_date;
	}

	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}

	public String getLike_user() {
		return like_user;
	}
	public void setLike_user(String like_user) {
		this.like_user = like_user;
	}

	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
}