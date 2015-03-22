package com.changh.sccms.test;


	import java.io.File;
import java.io.FileWriter;

import javax.swing.JFileChooser;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.filechooser.FileNameExtensionFilter;
	public class FileChooseTest {
	public static void main(String [] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedLookAndFeelException {
	//首先是创建JFileChooser 对象，里面带个参数，表示默认打开的目录，这里是默认打开当前文件所在的目录。
	JFileChooser file = new JFileChooser (".");
	//下面这句是去掉显示
	 UIManager.setLookAndFeel(
             UIManager.getSystemLookAndFeelClassName());

    JFileChooser jf = new JFileChooser();
    jf.setFileSelectionMode(JFileChooser.SAVE_DIALOG | JFileChooser.FILES_ONLY);
    FileNameExtensionFilter filter = new FileNameExtensionFilter("TXT","txt");//建立过滤器    
    jf.setFileFilter(filter);//开始过滤    
    int returnVal =jf.showSaveDialog(jf);
//    File fi = jf.getSelectedFile();
//    String f = fi.getAbsolutePath()+"\\test.txt";
//    System.out.println("save: "+f);
//    try{
//        FileWriter out = new FileWriter(f);
//        out.write("successful!!!");
//        out.close();
//    }
//    catch(Exception e){}
	}
	}
