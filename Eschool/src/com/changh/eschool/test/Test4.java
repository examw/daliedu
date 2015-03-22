package com.changh.eschool.test;

import java.util.ArrayList;
import java.util.List;

import com.changh.eschool.entity.ExamPaper;

public class Test4 {
	public static void main(String[] args) {
		List<ExamPaper> list = new ArrayList<ExamPaper>();
		List<ExamPaper> list1 = new ArrayList<ExamPaper>();
		ExamPaper p1 = new ExamPaper();
		ExamPaper p2 = new ExamPaper();
		p1.setPaperEGCheaterId(1);
		p2.setPaperEGCheaterId(2);
		list.add(p1);
		list.add(p2);
		int num = list.get(list.size()-1).getPaperEGCheaterId();
		System.out.println(num);
		for(int i=1;i<=num;i++)
		{
			boolean flag = false;
			for(int j=0;j<list.size();j++)
			{
				int k = list.get(j).getPaperEGCheaterId();
				if(k==i)
				{
					flag=true;
					list1.add(list.get(j));
					break;
				}
			}
			if(!flag)
			{
				list1.add(null);
			}
			System.out.println(list1);
		}
		System.out.println(list1);
		System.out.println("2.0/100.0".split("/")[1]);
	}
}
