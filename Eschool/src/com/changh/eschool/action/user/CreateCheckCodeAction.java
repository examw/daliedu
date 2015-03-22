package com.changh.eschool.action.user;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Map;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.until.ImageUtil;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class CreateCheckCodeAction extends BaseAction{
	private InputStream input;

	public InputStream getInput()
	{
		return input;
	}

	public void setInput(InputStream input)
	{
		this.input = input;
	}
	
	public String execute() throws Exception
	{
		Map<String,BufferedImage> map = ImageUtil.getImage();
		String code = map.keySet().iterator().next();
		//获取验证码图片的映像
		BufferedImage image = map.get(code);
		//压缩成jpeg格式如outputStream
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		JPEGImageEncoder encoder =JPEGCodec.createJPEGEncoder(bos);
		encoder.encode(image);
		//将图片的字节数组,放入inputStream中
		byte[] bytes=bos.toByteArray();
		input = new ByteArrayInputStream(bytes);
		//绑定code值到session
		session.put("code", code);
		return "success";
	}
}
