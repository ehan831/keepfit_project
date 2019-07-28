package com.keepfit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.keepfit.android.androidHdlr;
import com.keepfit.domain.CommentVO;
import com.keepfit.domain.LikeVO;
import com.keepfit.domain.MemberVO;
import com.keepfit.domain.PostVO;
import com.keepfit.service.CommentService;
import com.keepfit.service.LikeService;
import com.keepfit.service.MemberService;
import com.keepfit.service.PostService;

@org.springframework.stereotype.Controller
public class Controller {

	// Service 객체생성
	@Autowired
	private MemberService memberService;
	@Autowired
	private LikeService likeService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private PostService postService;

	// Servlet ModelAndView 생성
	ModelAndView mv = new ModelAndView();

	/**************************************************************************************************
	 * BASIC REQUEST HANDLERS
	 *************************************************************************************************/
	// DB 갔다오지 않는 함수 일괄 처리하는 (request = response)
	@RequestMapping(value = "{url}.do")
	public String common(@PathVariable String url) {
		System.out.println("common 호출!");
		return url;
	}

	/**************************************************************************************************
	 * [ANDROID] HANDLERS
	 * 
	 * @throws Exception
	 *************************************************************************************************/
	// [POST DB] post_id 시퀀스 받고
	// 안드로이드에서 업로드한 사진 저장 및 썸네일 생성
	// 새 게시물 페이지로 이동

	String pathPic; // case 1: 업로드로 생성된 사진 폴더경로
	int postId; // case 1: 만들어질 post_id

	@RequestMapping(value = { "picUpload.do" })
	public ModelAndView picUpload(HttpServletRequest request, @RequestParam String upload, PostVO vo) throws Exception {
		switch (upload) {
		case "0":
			System.out.println("upload: " + upload);
			vo.setPath_pic(pathPic);
			System.out.println("Path: " + vo.getPath_pic());
			vo.setPost_id(postId);
			System.out.println("Post ID: " + vo.getPost_id());
			mv.addObject("post", vo);
			mv.setViewName("zz_posting");

			break;

		case "1":
			PostVO post = postService.getPostId();

			if (post != null) {
				System.out.println("picUpload() 호출");
				androidHdlr android = new androidHdlr();
				pathPic = android.uploadAndResize(post, request);
				postId = post.getPost_id();
				System.out.println(post.getPost_id());
			} else {
				System.out.println("picUpload() 호출 실패!");
				mv.setViewName("index");
			}
			break;
		}
		return mv;

	}

	/**************************************************************************************************
	 * [로그인] HANDLERS
	 *************************************************************************************************/
	@RequestMapping(value = { "login.do" })
	public ModelAndView login(MemberVO vo, @RequestParam String signup, HttpSession session) {
		// [MEMBER DB] 에서 [email]과 [password] 확인
		MemberVO logUser = memberService.loginMember(vo);

		if (logUser != null) {
			if (vo.getMember_email().equals(logUser.getMember_email())
					&& vo.getMember_pass().equals(logUser.getMember_pass())) {
				session.setAttribute("userLogged", logUser.getMember_nick());
				mv.addObject("logged", "1"); // ****TEAM-FRONT: view url 수정가능
				mv.addObject("member", logUser); // ****TEAM-FRONT: view url 수정가능
				System.out.println("성공 ");
				mv.setViewName("loginOk");

			} else {
				mv.setViewName("index");
				mv.addObject("email", vo.getMember_email());
			}

		} else if (signup.equals("1")) {
			mv.addObject("logged", "0"); // ****TEAM-FRONT: view url 수정가능
			System.out.println("실패 ");
			mv.setViewName("zz_signUpExtra");
		}
		mv.addObject("member", vo); // 사용자 입력 값이 들어있음 : EMAIL / PW

		return mv;
	}

	/**************************************************************************************************
	 * [회원가입] HANDLERS
	 *************************************************************************************************/
	@RequestMapping(value = { "signup.do" })
	public ModelAndView test(MemberVO vo) {
		System.out.println(vo.toString());
		memberService.insertMember(vo); // 지금은 vo가 비어있는 상태

		// (1) Model
		// (2) ModelAndView
		// (3) 함수위에 @ModelAttribute
		mv.setViewName("feed");
		return mv;
	}

	@RequestMapping(value = "idCheck.do", produces = "application/text; charset=UTF-8")
	@ResponseBody // ajax인 경우 반드시 @ResponseBody를 추가해줘야 비동기 통신 가능
	public String idCheck(MemberVO vo) {
		// String userId를 인자로 받아도 됨
		MemberVO memberVO = memberService.idCheck_Login(vo);
		String result = "ID 사용 가능합니다.";
		if (memberVO != null)
			result = "중복된 ID입니다.";

		return result;
	}

	/**************************************************************************************************
	 * [좋아요] HANDLERS
	 *************************************************************************************************/
	// post_id 에 좋아요 버튼 핸들러
	// [LIKE DB] : IF EXISTS > DELETE, IF NOT EXISTS > INSERT
	// 인자: (LikeVO)
	@RequestMapping(value = { "like.do" })
	public ModelAndView like(LikeVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		likeService.like(vo);
		return mv;
	}

	// member_nick 관련 좋아요 조회
	// 인자: (LikeVO)
	@RequestMapping("getLikeList.do")
	public ModelAndView getLikeList(LikeVO vo) {

		List<LikeVO> likeUser = likeService.getLikeList(vo);

		if (likeUser != null) {
			mv.addObject("likeUser", likeUser);
			mv.addObject("likeStatus", "1"); // ****FRONT: parameter 수정가능
			System.out.println("좋아요 조회");
			mv.setViewName("zz_thumbnail"); // ****FRONT: view url 수정가능
			return mv;
		} else {
			mv.addObject("likeStatus", "0");
			System.out.println("좋아요 리스트 호출 실패");
			return mv;
		}
	}

	/**************************************************************************************************
	 * [댓글] HANDLERS
	 *************************************************************************************************/
	// post_id 관련 전체 댓글 내용 조회 핸들러
	// 인자: (CommentVO : post_id)
	@RequestMapping(value = { "getCommentList.do" })
	public ModelAndView getCommentList(CommentVO vo) { // 현재는 필요없음
		ModelAndView mv = new ModelAndView();
		mv.addObject("commentList", commentService.getCommentList(vo));
		System.out.println("댓글 조회");
		mv.setViewName("comment1");
		return mv;
	}

	// post_id 에 댓글 작성 버튼 핸들러
	// 인자: (CommentVO : comment_content, comment_writer, post_id)
	@RequestMapping(value = { "insertComment.do" })
	public ModelAndView insertComment(CommentVO vo) {
		// insertComment() 댓글입력 후 return 값: 댓글 개수 증가
		int countComment = commentService.insertComment(vo);

		if (countComment != 0) {
			System.out.println("현재 댓글 : " + countComment);
			mv.addObject("countComment", countComment);
			mv.addObject("commentStatus", "insert1"); // ****FRONT: parameter 수정가능
			mv.setViewName("TEST-comment"); // ****FRONT: view url 수정가능
			System.out.println("댓글 작성!");
		} else {
			mv.addObject("commentStatus", "insert0"); // ****FRONT: parameter 수정가능
			mv.setViewName("feed");
			System.out.println("댓글 실패!");
		}

		return mv;
	}

	// 댓글 상세 조회 핸들러 (작성자일때만 접근 가능)
	// 인자: (CommentVO : post_id, comment_writer)
	@RequestMapping(value = { "getComment.do" })
	public ModelAndView getComment(CommentVO vo) {
		commentService.getComment(vo);
		mv.setViewName("TEST-comment"); // ****TEAM-FRONT: view url 수정가능

		return mv;
	}

	// 댓글 삭제 핸들러
	// 인자: (CommentVO : post_id, comment_writer)
	@RequestMapping(value = { "deleteComment.do" })
	public ModelAndView deleteComment(CommentVO vo) {
		commentService.deleteComment(vo);
		mv.setViewName("comment"); // ****TEAM-FRONT: view url 수정가능

		return mv;
	}

	// 댓글에 내용 수정 핸들러
	// 보내는 인자 (CommentVO : post_id, comment_writer)
	@RequestMapping(value = { "updateComment.do" })
	public ModelAndView updateComment(CommentVO vo) {
		commentService.updateComment(vo);
		mv.setViewName("comment"); // ****TEAM-FRONT: view url 수정가능

		return mv;
	}

	/**************************************************************************************************
	 * [글쓰기] HANDLERS
	 *************************************************************************************************/

	// NEWS FEED > 전체 게시글 내용 조회 핸들러
	// 인자: (PostVO)
	@RequestMapping(value = "getPostList.do")
	public ModelAndView post(PostVO vo) { // , WebRequest request

		// [POST DB]에서 게시글 모두 조회
		List<PostVO> postList = postService.getPostList(vo);

		if (postList != null) {
			mv.addObject("postList", postList); // ****FRONT: parameter 수정가능
			mv.addObject("postStatus", "1"); // ****FRONT: parameter 수정가능
			System.out.println("게시글 조회");
			mv.setViewName("zz_feed"); // ****FRONT: view url 수정가능
//			mv.setViewName("feed_test2"); // ****FRONT: view url 수정가능
			return mv;
		} else {
			mv.addObject("postStatus", "0"); // ****FRONT: parameter 수정가능
			System.out.println("게시글 없음");
			return mv;
		}
	}

	@RequestMapping(value = { "insertPost.do" })
	public ModelAndView insertPost(PostVO vo) {
		System.out.println(vo.toString());
		System.out.println("insertPost.do 호출!");
		int result = postService.insertPost(vo);
		mv.setViewName("index"); // ****TEAM-FRONT: view url 수정가능

		return mv;
	}

	// 기존 게시물 상세 조회 핸들러 (작성자일때만 접근 가능)
	// 인자: (CommentVO : post_id, comment_writer)
	@RequestMapping(value = { "getPost.do" })
	public ModelAndView getPost(PostVO vo) {
		PostVO thisPost = postService.getPost(vo);
		mv.addObject("thisPost", thisPost); // ****FRONT: parameter 수정가능
		mv.setViewName("zz_feed_detail"); // ****TEAM-FRONT: view url 수정가능

		return mv;
	}

	// 기존 게시물 수정
	// 인자 (PostVO : post_id, post_writer)
	@RequestMapping(value = { "updatePost.do" })
	public ModelAndView updatePost(PostVO vo) {
		postService.updatePost(vo);
		mv.setViewName("postDetail"); // ****TEAM-FRONT: view url 수정가능

		return mv;
	}

	// 기존 게시물 삭제
	// 인자 (PostVO : post_id, post_writer)
	@RequestMapping(value = { "deletePost.do" })
	public ModelAndView deletePost(PostVO vo) {
		postService.deletePost(vo);
		mv.setViewName("feed"); // ****TEAM-FRONT: view url 수정가능

		return mv;
	}
	
	/**************************************************************************************************
	 * [검색] HANDLERS
	 *************************************************************************************************/
	// SEARCH RESULT > keyword 기준으로 검색
	// 인자: (PostVO, MemberVO, CommentVO)
	@RequestMapping(value = { "getSearchList.do" })

	public ModelAndView search(PostVO post, MemberVO member, CommentVO comment,  
			@RequestParam String searchParameter, String searchKeyword) {
		// [Search parameter]에 따라 관련 결과 조회
//		String searchParameter = request.getParameter("searchParameter");
		// 0 > users [MEMBER DB]
		// 1 > comments [COMMENT DB]
		// 2 > sports [POST DB]
		// 3 > places [POST DB]
//		String searchKeyword = request.getParameter("searchKeyword");

		switch (searchParameter) {
		case "0":
			// [MEMBER DB]에 keyword: %[member_nick]% 관련된 모든 user 조회
			List<MemberVO> memberList = memberService.getMemberList(member);

			if (memberList != null) {
				mv.addObject("memberList", memberList); // ****FRONT: parameter 수정가능
				mv.addObject("memberStatus", "1"); // ****FRONT: parameter 수정가능
				System.out.println("[MEMBER DB]: "+ searchKeyword+ " 조회");
			} else {
				mv.addObject("memberStatus", "0"); // ****FRONT: parameter 수정가능
				System.out.println("[MEMBER DB]: "+ searchKeyword+ " 없음");
			}
			break;

		case "1":
			// [COMMENT DB]에 %[post_writer]% 관련된 모든 댓글 조회
			List<CommentVO> commentList = commentService.getCommentList(comment);

			if (commentList != null) {
				mv.addObject("commentList", commentList); // ****FRONT: parameter 수정가능
				mv.addObject("commentStatus", "1"); // ****FRONT: parameter 수정가능
				System.out.println("[COMMENT DB]: "+ searchKeyword+ " 조회");
			} else {
				mv.addObject("commentStatus", "0"); // ****FRONT: parameter 수정가능
				System.out.println("[COMMENT DB]: "+ searchKeyword+ " 없음");
			}
			break;
			
		case "2":
			// [POST DB]에 %[sport_name]% 관련된 모든 게시물 조회
			List<PostVO> sportPostList = postService.getPostList(post);

			if (sportPostList != null) {
				mv.addObject("postList", sportPostList); // ****FRONT: parameter 수정가능
				mv.addObject("postStatus", "1"); // ****FRONT: parameter 수정가능
				System.out.println("[POST DB]: "+ searchKeyword+ " 조회");
			} else {
				mv.addObject("postStatus", "0"); // ****FRONT: parameter 수정가능
				System.out.println("[POST DB]: "+ searchKeyword+ " 없음");
			}
			break;
			
		case "3":
			// [POST DB]에 %[place_tag]% 관련된 모든 게시물 조회
			List<PostVO> placePostList = postService.getPostList(post);
			
			if (placePostList != null) {
				mv.addObject("postList", placePostList); // ****FRONT: parameter 수정가능
				mv.addObject("postStatus", "1"); // ****FRONT: parameter 수정가능
				System.out.println("[POST DB]: "+ searchKeyword+ " 조회");
			} else {
				mv.addObject("postStatus", "0"); // ****FRONT: parameter 수정가능
				System.out.println("[POST DB]: "+ searchKeyword+ " 없음");
			}
			break;
			
			
		} // end of switch statements
		mv.setViewName("searchResult"); // ****FRONT: view url 수정가능
		return mv;
		
	} // end of search()

	/**************************************************************************************************
	 * [글쓰기] test - han
	 *************************************************************************************************/
	@RequestMapping(value = "zz_posting.do")
	public ModelAndView posting(String post_id, String post_writer) { // , WebRequest request
		// 두 개의 변수를 가지고 글쓰기 페이지 진입
		System.out.println("글쓰기 진입");
		mv.addObject("post_id", post_id);
		mv.addObject("post_writer", post_writer);
		mv.setViewName("zz_posting"); // ****FRONT: view url 수정가능
		return mv;
	}
//
//    @RequestMapping(value = "feed_test.do")
//    public ModelAndView feed_test(PostVO vo) { // , WebRequest request
//
//        List<PostVO> postList = postService.getPostList( vo );
//
//        mv.addObject( "postList", postList ); // ****FRONT: parameter 수정가능
//        mv.addObject( "postStatus", "1" ); // ****FRONT: parameter 수정가능
//        System.out.println( "test" );
//        mv.setViewName( "feed_test" ); // ****FRONT: view url 수정가능
//        return mv;
//    }

	@RequestMapping(value = "zz_feed.do")
	public ModelAndView feed_test2(PostVO vo) { // , WebRequest request

		List<PostVO> postList = postService.getPostList(vo);

		mv.addObject("postList", postList); // ****FRONT: parameter 수정가능
		System.out.println("zz_feed 호출");
		mv.setViewName("zz_feed"); // ****FRONT: view url 수정가능
		return mv;
	}

	// post_id 에 좋아요 버튼 핸들러
	// [LIKE DB] : IF EXISTS > DELETE, IF NOT EXISTS > INSERT
	// 인자: (LikeVO)
	@RequestMapping(value = { "like_test.do" })
	public ModelAndView like_test(LikeVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		likeService.like(vo);
		return mv;
	}

	@RequestMapping("zz_getLikeList.do")
	public ModelAndView getLikeList_test(LikeVO vo) {

		List<LikeVO> likeUser = likeService.getLikeList(vo);
		if (likeUser != null) {
			mv.addObject("likeUser", likeUser);
			mv.addObject("likeStatus", "1"); // ****FRONT: parameter 수정가능
			System.out.println("좋아요 조회");
			mv.setViewName("zz_thumbnail"); // ****FRONT: view url 수정가능
		} else {
			mv.addObject("likeStatus", "0");
			System.out.println("좋아요 리스트 호출 실패");
		}
		return mv;
	}
//	@RequestMapping("zz_signup.do")
//	public ModelAndView zz_signup(MemberVO vo) {
//		System.out.println("회원가입 조회");
////		memberService.insertMember(vo); // 지금은 vo가 비어있는 상태
//
//		// (1) Model
//		// (2) ModelAndView
//		// (3) 함수위에 @ModelAttribute
//		mv.setViewName( "zz_signup" );
//		return mv;
//	}

	@RequestMapping("zz_signUpExtra.do")
	public ModelAndView zz_signUpExtra(MemberVO vo) {
		System.out.println("회원가입 Extra 조회");
//		memberService.insertMember(vo); // 지금은 vo가 비어있는 상태

		// (1) Model
		// (2) ModelAndView
		// (3) 함수위에 @ModelAttribute
		mv.setViewName("zz_signUpExtra");
		return mv;
	}

	@RequestMapping("zz_login.do")
	public ModelAndView zz_login(MemberVO vo) {
		System.out.println("로그인 호출");
//		memberService.insertMember(vo); // 지금은 vo가 비어있는 상태

		// (1) Model
		// (2) ModelAndView
		// (3) 함수위에 @ModelAttribute
		mv.setViewName("zz_login");
		return mv;
	}

	@RequestMapping("zz_idCheck.do")
	@ResponseBody // ajax인 경우 반드시 @ResponseBody를 추가해줘야 비동기 통신 가능
	public String zz_idCheck(MemberVO vo) {
		// String userId를 인자로 받아도 됨
		MemberVO memberVO = memberService.idCheck_Login(vo);
		String result = "ID 사용 가능합니다.";
		if (memberVO != null)
			result = "중복된 ID입니다.";

		return result;
	}
} // END OF Controller CLASS
