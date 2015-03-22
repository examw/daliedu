package com.changh.sccms.until;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * 生成验证码
 * @author Administrator
 *
 */
public class ImageUtil
{
	public static Map<String,BufferedImage> getImage()
	{
		Map<String,BufferedImage> map = new HashMap<String,BufferedImage>();
		BufferedImage image = new BufferedImage(120,30,BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		Random r = new Random();
		g.setColor(Color.LIGHT_GRAY);
		g.fillRect(0, 0, 120, 30);
		char[] chars={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q',
				'r','s','t','u','w','v','x','y','z','0','1','2','3','4','5','6','7','8','9'
				,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','W','R','S'
				,'T','U','V','W','X','Y','Z'};
		StringBuffer buffer = new StringBuffer();
		for(int i=0;i<5;i++)
		{
			g.setColor(new Color(r.nextInt(256),r.nextInt(256),r.nextInt(256)));
			g.setFont(new Font(null,Font.BOLD|Font.ITALIC,30));
			char c = chars[r.nextInt(chars.length)];
			g.drawString(String.valueOf(c), 8+(i*20), 25);
			buffer.append(c);
		}
		for(int i=0;i<3;i++)
		{
			g.setColor(new Color(0,0,0));
			g.drawLine(r.nextInt(100), r.nextInt(30),r.nextInt(100), r.nextInt(30));
		}
		map.put(buffer.toString(), image);
		return map;
	}
}
