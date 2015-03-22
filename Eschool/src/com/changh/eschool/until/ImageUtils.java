package com.changh.eschool.until;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

/**
 * 图片工具类
 */
public class ImageUtils {

	private ImageUtils(){}
	
	private BufferedImage image = null;

	public void load(File imageFile) throws IOException {
		image = ImageIO.read(imageFile);
	}

	public int getImageWidth() {
		return image.getWidth();
	}

	public int getImageHeight() {
		return image.getHeight();
	}

	//图片裁剪
	public void cutTo(int x,int  y,int tarWidth, int tarHeight) throws FileNotFoundException {
		if (image == null) {
			throw new FileNotFoundException(
					"image file not be load.please execute 'load' function agin.");
		}

		int iSrcWidth = getImageWidth(); // 得到源图宽
		int iSrcHeight = getImageHeight(); // 得到源图长

		// 如果源图片的宽度或高度小于目标图片的宽度或高度，则直接返回出错
		if (iSrcWidth < tarWidth && iSrcHeight < tarHeight) {
			return ;
			//throw new RuntimeException("source image size too small.");
		}
		if(x==-1||y==-1)
		{
			this.image = new BufferedImage(tarWidth,tarHeight,BufferedImage.TYPE_INT_RGB);
			Graphics g = image.getGraphics();
			g.setColor(Color.ORANGE);
			g.fillRect(0, 0, tarWidth, tarHeight);
			return;
		}
		// 先求源图和目标图的尺寸比例
		double dSrcScale = iSrcWidth * 1.0 / iSrcHeight;
		double dDstScale = tarWidth * 1.0 / tarHeight;

		// 先确定剪裁尺寸
		int iDstLeft, iDstTop, iDstWidth, iDstHeight;
		if (dDstScale > dSrcScale) { // 目标图片宽
			iDstWidth = iSrcWidth;
			iDstHeight = (int) (iDstWidth * 1.0 / dDstScale);
		} else { // 目标图片高
			iDstHeight = iSrcHeight;
			iDstWidth = (int) (iDstHeight * dDstScale);
		}
		iDstLeft = (iSrcWidth - iDstWidth) / 2;
		iDstTop = (iSrcHeight - iDstHeight) / 2;

		// 剪裁
		this.image = image
				.getSubimage(x, y, tarWidth, tarHeight);
				//.getSubimage(iDstLeft, iDstTop, iDstWidth, iDstHeight);

	}

	/**
	 * 	//图片缩放 不生成新的图片
	 */
	public void zoomTo(int tarWidth, int tarHeight) {
		BufferedImage tagImage = new BufferedImage(tarWidth, tarHeight,
				BufferedImage.TYPE_INT_RGB); // 缩放图像
		Image image = this.image.getScaledInstance(tarWidth, tarHeight,
				Image.SCALE_SMOOTH);
		Graphics g = tagImage.getGraphics();
		g.drawImage(image, 0, 0, null); // 绘制目标图
		g.dispose();
		this.image = tagImage;

	}

	/**
	 * 保存
	 * @param fileName
	 * @param formatName
	 * @throws IOException
	 */
	public void save(String fileName, String formatName) throws IOException {
		// 写文件
		FileOutputStream out = null;
		try {
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			ImageIO.write(this.image, formatName, bos);// 输出到bos
			out = new FileOutputStream(fileName);
			out.write(bos.toByteArray()); // 写文件
		} catch (IOException e) {
			throw e;
		} finally {
			try {
				if (out != null)
					out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	
	/**
	 * //缩放图片 生成新的图片
	 */
	public static boolean zoomImage(String srcFile, String dstFile, int width,
			int height, String formatName) {
		try {
			ImageUtils zoom = new ImageUtils();
			zoom.load(new File(srcFile));
			zoom.zoomTo(width, height);
			zoom.save(dstFile, formatName);
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

	private static ImageUtils fromImageFile(File file) throws IOException {
		ImageUtils utils = new ImageUtils();
		utils.load(file);
		return utils;
	}

	/**
	 * 加载图片
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	public static ImageUtils load(String fileName) throws IOException {
		File file = new File(fileName);
		return fromImageFile(file);
	}
	
	
//	public static void main(String[] args) {
//		String p =  "e:/090613221071ed5df7cf2bce72.jpg";
//		ImageUtils image , image2;
//		try {
//			image = ImageUtils.load(p);
//			//image.zoomImage(p, "e:/xxx.jpg", 500, 500, "jpg");
//			image.zoomTo(500, 500);
//			image.cutTo(50,50,100, 100);
//			image.save("e:/111.jpg", "jpg");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}

}
