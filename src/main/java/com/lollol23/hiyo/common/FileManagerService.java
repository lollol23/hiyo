package com.lollol23.hiyo.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	public final static String FILE_UPLOAD_PATH = "C:\\Users\\mark7777\\Desktop\\download/";
	
	public static String savefile(int userId, MultipartFile file) {
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;
		File directory = new File(filePath);
		
		if(directory.mkdir() == false) {
			return null;
		}
		
		try {
			byte[] bytes = file.getBytes();
			// 파일 경로
			Path path = Paths.get(filePath + file.getOriginalFilename());
			// 파일 저장
			Files.write(path, bytes);
			
		} catch (IOException e) {
//			logger.error("[FileManagerService saveFile] 파일 생성 실패");
			e.printStackTrace();
			return null;
		}
		
		
		// 파일을 접근할수 있는 경로 
		// <img src="/images/43_281281298129/test.png">	
		
		return "/images/" + directoryName + file.getOriginalFilename();
	}
}
