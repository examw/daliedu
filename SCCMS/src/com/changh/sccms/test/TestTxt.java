package com.changh.sccms.test;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import com.changh.sccms.entity.ExamQuestion;
import com.changh.sccms.until.DegistUtil;

public class TestTxt {
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream("C:\\test2.txt")));
		String str=br.readLine();
		String str2=null;
		String str3=null;
		StringBuffer buf = new StringBuffer();
		StringBuffer buf2 = new StringBuffer();
		StringBuffer md5buf = new StringBuffer();
		List<ExamQuestion> list = new LinkedList<ExamQuestion>();
		int count = 1;
		while(str!=null)
		{
			if(!str.startsWith(String.valueOf(count)))
			{
				str = br.readLine();
			}else
			{
				//表示第一题开始
				ExamQuestion q = new ExamQuestion();
				str2 = str;
				//System.out.println(str2);
				while(str2!=null)
				{
					if(!str2.startsWith(String.valueOf(count+1)))
					{
						if(str2.startsWith("[答案]"))
						{
							str3=br.readLine();
							while(str3!=null)
							{
								buf2.append(str3);
								str3=br.readLine();
							}
						}
						buf.append(str2+"\n");
						str2 = br.readLine();
					}else{
						count=count+1;
						break;
					}
				}
				buf.delete(0, 2);
				String content = buf.toString().trim();
				System.out.println(content);
				q.setQuestContent(content);
				String md5 = DegistUtil.getMd5CodeOfQuestion(content);
				q.setQuestMd5code(md5);
				if(list.size()==0)
				{
					q.setQuestOptionNum(content.replaceAll("[A-Z][.)、．]", "@@@").split("@@@").length-1);
					list.add(q);
					md5buf.append(md5);
				}else if(md5buf.indexOf(md5)==-1)//判断重复
				{
					q.setQuestOptionNum(content.replaceAll("[A-Z][.)、．]", "@@@").split("@@@").length-1);
					list.add(q);
					md5buf.append(md5);
				}else
				{
					list.add(null);
				}
				str=str2;
				buf.delete(0, buf.length()); //清空buf
			}
		}
		String answer[] = buf2.toString().split("[0-9]+[.．)]");
		System.out.println(list.size());
		br.close();
		for(int i=0;i<list.size();i++)
		{
			ExamQuestion e = list.get(i);
			if(e!=null)
			{
				e.setQuestAnswer(answer[i+1].trim());
			}
		}
		while(list.contains(null))
		{
			list.remove(null);
		}
		
	}
}
