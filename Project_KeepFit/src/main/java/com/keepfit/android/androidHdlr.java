package com.keepfit.android;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.keepfit.domain.PostVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Service
public class androidHdlr {
	
	public androidHdlr() {}
	
	public String uploadAndResize (PostVO post, HttpServletRequest request) throws Exception {
		/**************************************************************************************************
		 * [FOLDER] 업로드 폴더 만들기
		 *************************************************************************************************/

		// 생성될 post_id = [POST DB] SEQ_POST_ID.nextval
		int postId = post.getPost_id();
		System.out.println("posting.jsp: "+postId);

		// post_id의 이름으로 폴더를 지정한다
		String path = "C:/PostPics/" + postId; //폴더 경로
		System.out.println(path);
		File folder = new File(path);
		File[] deleteFolderFiles = folder.listFiles();

		// 해당 디렉토리가 존재하지 않을 경우 해당 디렉토리를 생성합니다.
		if (!folder.exists()) {
			try {
				folder.mkdir(); //폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}

		// 해당 디렉토리가 존재할 경우 해당 디렉토리 내용을 정리하여 삭제합니다.
		} else {
			for (int i = 0; i < deleteFolderFiles.length; i++) {
				deleteFolderFiles[i].delete(); // 파일을 삭제합니다
			}
		System.out.println("이미 폴더가 존재하여 내용을 삭제합니다.");			
		}
		
		
		/**************************************************************************************************
		 * [PIC] 업로드 파일 저장
		 *************************************************************************************************/
				
		int sizeLimit = 30 * 1024 * 1024; // 30 MB 까지 제한 넘어서면 예외발생
		int nameSeq = 0;
		try {
			// 생성된 폴더를 업로드 경로로 지정
			MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();		
			
			// 파일 있다면
			while (files.hasMoreElements()) {
				String name = (String) files.nextElement();
			
			// post_id 경로안에 파일들 조회
			File folder2 = new File(path);
			File[] renameFolderFiles = folder2.listFiles();
			
			// 각 파일마다 이름을 "1"부터 바꾼다
				int j = 0;
			    for(File file:renameFolderFiles) {
			        j++;
			        String names = file.getName();
			        String newName = j + ".jpg";
			        String newPath = path + "\\" + newName;
			        file.renameTo(new File(newPath));
			        System.out.println(name + " changed to " + newName);
			    }			 		
			}
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("Exception: 안드로이드 부터 이미지가 전송되지 않았습니다.");
		}	
		
		/**************************************************************************************************
		 * [RESIZE] 업로드 파일 첫번째 사진 썸내일로 크기조정
		 *************************************************************************************************/
		
		File input = new File(path + "/1.jpg");
		BufferedImage image = null;
		
		// 폴더내에 첫번째 사진 읽기
		try {
			image = ImageIO.read(input);
			System.out.println(input + " 사진 불러오기 성공");
			System.out.println("type: "+ image.getType());
		} catch (IOException e) {
			System.out.println(input + " 사진 불러오기 실패");
			e.printStackTrace();
		}

		// 사진 (1.jpg) 썸내일로 크기 조정
		File output = new File(path + "/thumb.jpg");
		thumbnailMaker thumb = new thumbnailMaker();
		BufferedImage resized = thumb.resizing(image, 100, 100);	// 썸내일 만들기

		// 폴더에 크기 조정된 사진 jpg로 저장
		try {
			System.out.println("type: "+ resized.getType());
			ImageIO.write(resized, "jpg", output);
			System.out.println("thumbnail succesfully created: "+output);
		} catch (IOException e) {
			System.out.println("thumbnail creation was unsuccesfull: "+output);			
			e.printStackTrace();
		}


		return path;
	}	//	end of uploadAndResize()
		

}	// END OF androidHdlr CLASS
