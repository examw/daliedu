package com.changh.eschool.until;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.XMLWriter;

import com.changh.eschool.entity.ExamPaper;
import com.changh.eschool.entity.ExamQuestion;
import com.changh.eschool.entity.ExamRule;

public class XMLCreatorUtil {

	public static InputStream createPaperXML(ExamPaper paper, List<ExamRule> rules,
			List<List<ExamQuestion>> questionList) {
		// TODO Auto-generated method stub
		/**
		 * <paper id="" title="" type="" time="" sorce="" examId="" gradeId="" cheaterId="">
		 * 		<rule id="" title=""　type="" questionNum="" paperId="" sorceForEach="" sorceSet="">
		 * 			<question>
		 * 				<id></id>
		 * 				<type></type>
		 * 				<title></title>
		 * 				...
		 * 				.
		 * 				.
		 * 			</question>
		 * 		</rule>
		 * </paper>
		 */
		if(paper!=null)
		{
			Document doc = DocumentHelper.createDocument();
			Element root= doc.addElement("paper");
			root.addAttribute("id", paper.getPaperId().toString());
			root.addAttribute("title", paper.getPaperName());
			root.addAttribute("type", paper.getPaperType().toString());
			root.addAttribute("time", paper.getPaperTime().toString());
			root.addAttribute("sorce", paper.getPaperScore().toString());
			root.addAttribute("examId", paper.getPaperExamId().toString());
			root.addAttribute("gradeId", paper.getPaperEGradeId().toString());
			root.addAttribute("cheaterId", paper.getPaperEGCheaterId().toString());
			if(rules!=null&&rules.size()>0)
			{
				for(int i=0;i<rules.size();i++)
				{
					ExamRule r = rules.get(i);
					Element rule = root.addElement("rule");
					rule.addAttribute("id", r.getRuleId().toString());
					rule.addAttribute("title", r.getTitle());
					rule.addAttribute("type", r.getRuleType().toString());
					rule.addAttribute("questionNum", r.getRuleQuestionNum().toString());
					rule.addAttribute("paperId", r.getPaperId().toString());
					rule.addAttribute("sorceForEach", String.valueOf(r.getRuleScoreForEach()));
					rule.addAttribute("sorceSet", r.getRuleScoreSet());
					if(questionList!=null&&questionList.size()>0)
					{
						for(int j=0;j<questionList.get(i).size();j++)
						{
							ExamQuestion q = questionList.get(i).get(j);
							Element question = rule.addElement("question");
							setQuestionFormat(question,q);
						}
					}
				}
			}
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			try
			{
				XMLWriter xmlWriter = new XMLWriter(out);
				xmlWriter.write(doc);
	            xmlWriter.close();
			}catch(Exception e)
			{
				e.printStackTrace();
			}finally
			{
				try {
					out.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return new ByteArrayInputStream(out.toByteArray()); 
		}
		return null;
	}

	private static void setQuestionFormat(Element question, ExamQuestion q) {
		// TODO Auto-generated method stub
		Element id = question.addElement("id");
		id.setText(q.getQuestId().toString());
		id = question.addElement("type");
		id.setText(q.getQuestType().toString());
		if(1==q.getQuestType()||2==q.getQuestType())	//单选或者多选题
		{
			String[] arr = q.getQuestContent().replaceAll("[A-Z][.．、)]", "@@@").split("@@@");
			id = question.addElement("title");
			id.setText(arr[0]);
			id = question.addElement("optionNum");
			id.setText(q.getQuestOptionNum().toString());
			id = question.addElement("options");
			for(int i=1;i<arr.length;i++)
			{
				Element option = id.addElement("option");
				option.setText(((char)(64+i))+"．"+arr[i]);
			}
		}else
		{
			id = question.addElement("title");
			id.setText(q.getQuestContent());
		}
		id = question.addElement("answer");
		id.setText(q.getQuestAnswer()==null?"":q.getQuestAnswer());
		id = question.addElement("analysis");
		id.setText(q.getQuestAnalysis()==null?"":q.getQuestAnalysis());
		id = question.addElement("examId");
		id.setText(q.getQuestExamId()==null?"":q.getQuestExamId().toString());
		id = question.addElement("ruleId");
		id.setText(q.getQuestRuleId().toString());
		id = question.addElement("paperId");
		id.setText(q.getQuestPaperId().toString());
		id = question.addElement("linkQid");
		id.setText(q.getQuestLinkQuestionId()==null?"":q.getQuestLinkQuestionId().toString());
	}
	
}
