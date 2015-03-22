package com.changh.eschool.until;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class FileUtil {
	public static void copy(File src,File dest) throws Exception{
		BufferedInputStream bis = 
			new BufferedInputStream(
				new FileInputStream(src));
		BufferedOutputStream bos = 
			new BufferedOutputStream(
					new FileOutputStream(dest));
		byte[] buffer = new byte[1024];
		int size = -1;
		while((size=bis.read(buffer)) !=-1 ){
			bos.write(buffer,0,size);
		}
		bis.close();
		bos.flush();
		bos.close();
	}
}
