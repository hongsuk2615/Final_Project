package com.ace.thrifty.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Utils {
	public static String saveFile(MultipartFile upfile, String savePath) throws IllegalStateException, IOException {
		
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int random = (int)(Math.random() * 90000 + 10000);
		
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime+random+ext;
		
		upfile.transferTo(new File(savePath+changeName));
		
		return changeName;
	}
}	
