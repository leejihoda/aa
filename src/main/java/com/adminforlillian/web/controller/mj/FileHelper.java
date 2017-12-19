package com.adminforlillian.web.controller.mj;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 * 첨부파일의 Upload 및 Helper 클래스.
 * 
 * @version 0.1 (2016-03-25)
 * @author 
 */
@Component
public class FileHelper {
	
	//파일 업로드 기본 경로
	public static String UPLOAD_DIRECTORY = "";


	public Map<String,Object> uploadFiles(HttpServletRequest request, MultipartFile mFile) throws Exception {

		UPLOAD_DIRECTORY = request.getSession().getServletContext().getRealPath("/resources/file/");

		Map<String,Object> file = new HashMap<>();
		try{
			if (mFile.isEmpty() == false) {
				file = savedFile(mFile);
			}
		} catch ( Exception e) {

		}
		return file;
	}

	public Map<String,Object> savedFile(MultipartFile mFile) throws Exception {
		return writeDisk(mFile);
	}

	private Map<String,Object> writeDisk (MultipartFile mFile) throws Exception {

		Map<String,Object> returnFile = new HashMap<>();

		String saveName = FileHelper.makeFileName(mFile.getOriginalFilename(), null, null);
//		String saveName = mFile.getOriginalFilename();

		File writePath = new File(
				UPLOAD_DIRECTORY);
		if (writePath.exists() == false) {
			writePath.mkdirs();
		}

		File savedFile = new File(
				UPLOAD_DIRECTORY +
						saveName
		);
		mFile.transferTo(savedFile);

		returnFile.put("file_path",savedFile.toString());
		return returnFile;
	}

	public static String getExtension(MultipartFile file)
			throws IllegalArgumentException {
		return getExtension(file, true);
	}

	public static String getExtension(MultipartFile file, boolean toLowerCase)
			throws IllegalArgumentException {

		if (file == null) {
			throw new IllegalArgumentException("업로드 대상 파일이 없음");
		}

		String fileName = file.getOriginalFilename();

		return getExtensionFromName(fileName, toLowerCase);
	}

	public static String getExtensionFromName(String fileName, boolean toLowerCase) {
		if (fileName == null || fileName.equals("")) {
			throw new IllegalArgumentException("파일명이 없음");
		}

		String[] fileNameInformation = fileName.split("\\.");
		String extension = fileNameInformation[fileNameInformation.length - 1];

		return (toLowerCase)? extension.toLowerCase(): extension;
	}


	private static String makeFileName(String extension, String prefix, String suffix) {

		String timeStamp = Long.toString(System.nanoTime());
//		UUID random = UUID.randomUUID();
//		timeStamp += "_" + random.toString();

		StringBuilder sb = new StringBuilder();

		if (prefix != null) {
			sb.append(prefix)
					.append("_");
		}

		sb.append(timeStamp);

		if (suffix != null) {
			sb.append("_")
					.append(suffix);
		}

		return sb.append("_").append(extension).toString();
	}

	
	
}
