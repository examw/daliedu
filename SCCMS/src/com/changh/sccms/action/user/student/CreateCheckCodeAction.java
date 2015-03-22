package com.changh.sccms.action.user.student;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Map;

import com.changh.sccms.action.BaseAction;
import com.changh.sccms.until.ImageUtil;
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
		//��ȡ��֤��ͼƬ��ӳ��
		BufferedImage image = map.get(code);
		//ѹ����jpeg��ʽ��outputStream
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		JPEGImageEncoder encoder =JPEGCodec.createJPEGEncoder(bos);
		encoder.encode(image);
		//��ͼƬ���ֽ�����,����inputStream��
		byte[] bytes=bos.toByteArray();
		input = new ByteArrayInputStream(bytes);
		//��codeֵ��session
		session.put("code", code);
		return "success";
	}
}
