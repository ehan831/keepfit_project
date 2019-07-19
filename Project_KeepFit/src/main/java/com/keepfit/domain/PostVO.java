package com.keepfit.domain;

import java.util.Date;

// 게시글 관련 VO (Value Object)
public class PostVO {

	private int post_id; // 게시글 코드 (PK)
	private String post_writer; // 게시글 작성자
	private String selected_date; // 게시글 지정 날짜
	private String post_date; // 게시글 작성 날짜
	private String modify_date; // 게시글 수정 날짜
	private String post_mood; // 선택 상태 코드
	private String member_tag; // 사람 태그
	private String sport_name; // 선택 운동 이름
	private int sport_type; // 선택 운동 코드
	private String place_tag; // 위치 태그
	private int pic_count; // 사진 개수
	private String privacy; // 공유 범위
	private String content; // 게시글 내용
	private float total_calories; // 소모 칼로리
	private String path_pic; // 사진 경로 (폴더)
	private String path_thumb; // 썸내일 경로


	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public String getPost_writer() {
		return post_writer;
	}
	public void setPost_writer(String post_writer) {
		this.post_writer = post_writer;
	}

	public String getSelected_date() {
		return selected_date;
	}
	public void setSelected_date(String selected_date) {
		this.selected_date = selected_date;
	}

	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	
	public String getModify_date() {
		return modify_date;
	}
	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}
	
	public String getPost_mood() {
		return post_mood;
	}
	public void setPost_mood(String post_mood) {
		this.post_mood = post_mood;
	}
	
	public String getMember_tag() {
		return member_tag;
	}
	public void setMember_tag(String member_tag) {
		this.member_tag = member_tag;
	}

	public String getSport_name() {
		return sport_name;
	}
	public void setSport_name(String sport_name) {
		this.sport_name = sport_name;
	}

	public int getSport_type() {
		return sport_type;
	}
	public void setSport_type(int sport_type) {
		this.sport_type = sport_type;
	}

	public String getPlace_tag() {
		return place_tag;
	}
	public void setPlace_tag(String place_tag) {
		this.place_tag = place_tag;
	}

	public int getPic_count() {
		return pic_count;
	}
	public void setPic_count(int pic_count) {
		this.pic_count = pic_count;
	}
	
	public String getPrivacy() {
		return privacy;
	}
	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public float getTotal_calories() {
		return total_calories;
	}
	public void setTotal_calories(float total_calories) {
		this.total_calories = total_calories;
	}

	public String getPath_pic() {
		return path_pic;
	}
	public void setPath_pic(String path_pic) {
		this.path_pic = path_pic;
	}
	
	public String getPath_thumb() {
		return path_thumb;
	}
	public void setPath_thumb(String path_thumb) {
		this.path_thumb = path_thumb;
	}


	@Override
	public String toString() {
		return "[PostVO]" 
				+ "\n No= " + post_id 
				+ "\n 작성 날짜= " + post_date 
				+ "\n 수정 날짜= " + modify_date 
				+ "\n Writer= " + post_writer 
				+ "\n 게시글 날짜= " + selected_date 
				+ "\n 사람태그= " + member_tag 
				+ "\n 상태 코드= " + post_mood
				+ "\n 운동 종류= " + sport_type 
				+ "\n 운동= " + sport_name 
				+ "\n 위치= " + place_tag 
				+ "\n 칼로리= " + total_calories 
				+ "\n 사진 개수= " + pic_count
				+ "\n 공개= " + privacy
				+ "\n 사진 경로= " + path_pic
				+ "\n 썸네일 경로= " + path_thumb;
	}
}