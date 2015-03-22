package com.changh.sccms.until;

import java.io.File;

public class IOUtil {
	public static String getAbsolutePath() {
		File file = new File("D:/yuan");
		return file.getAbsolutePath();
	}
	public static String[] list() {
		File file = new File("D:/root");
		return file.list();
	}
	public static void main(String[] args) {
		System.out.println(IOUtil.getAbsolutePath());
		String[] array = IOUtil.list();
		for (int i =0 ;i<array.length;i++) {
			System.out.print(array[i] + "|");
		}
	}
}
