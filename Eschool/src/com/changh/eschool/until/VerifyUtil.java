package com.changh.eschool.until;

import java.util.UUID;

public class VerifyUtil {
	public static String createUUID(){
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}
	
	public static void main(String[] args){
		System.out.println(createUUID());
		System.out.println(createUUID());
		System.out.println(createUUID());
	}
	
}
