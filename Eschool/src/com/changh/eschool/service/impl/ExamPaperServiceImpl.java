package com.changh.eschool.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.changh.eschool.dao.ExamPaperDAO;
import com.changh.eschool.dao.ExamQuestionDAO;
import com.changh.eschool.dao.ExamRecordDAO;
import com.changh.eschool.dao.ExamRuleDAO;
import com.changh.eschool.entity.ExamPaper;
import com.changh.eschool.entity.ExamQuestion;
import com.changh.eschool.entity.ExamRecord;
import com.changh.eschool.entity.ExamRule;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.ExamPaperService;

public class ExamPaperServiceImpl implements ExamPaperService {
	private ExamPaperDAO examPaperDao;
	private ExamQuestionDAO examQuestionDao;
	private ExamRecordDAO examRecordDao;
	private ExamRuleDAO examRuleDao;
	
	public void setExamRuleDao(ExamRuleDAO examRuleDao) {
		this.examRuleDao = examRuleDao;
	}

	public void setExamPaperDao(ExamPaperDAO examPaperDao) {
		this.examPaperDao = examPaperDao;
	}
	
	public void setExamRecordDao(ExamRecordDAO examRecordDao) {
		this.examRecordDao = examRecordDao;
	}


	public void setExamQuestionDao(ExamQuestionDAO examQuestionDao) {
		this.examQuestionDao = examQuestionDao;
	}
	
	public List<ExamPaper> findPageByGradeId(int gradeId, int page,
			int pagesize, String sortname, String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return examPaperDao.findPageByGradeId(gradeId, page, pagesize, sortname, sortorder);
	}
	@Override
	public long findTotalByGradeId(int gradeId) throws Exception {
		// TODO Auto-generated method stub
		return examPaperDao.findTotalByGradeId(gradeId);
	}
	public ExamPaper findById(int paperId) throws Exception {
		// TODO Auto-generated method stub
		return examPaperDao.findById(paperId);
	}

	public ExamPaper findPaperByName(String paperName) throws Exception {
		return examPaperDao.findByName(paperName);
	}


	public ExamQuestion findQuestionById(int questId) throws Exception {
		// TODO Auto-generated method stub
		return examQuestionDao.findById(questId);
	}

	public String findLinkedQid() throws Exception {
		// TODO Auto-generated method stub
		return examQuestionDao.findLinkedQid();
	}

	public boolean updateQuestionForCancelLink(String questionIds)
			throws Exception {
		// 取消连题属性，一取消都取消
		// questionId为linked的id值
		String criteria = getQueryStr(questionIds);
		List<ExamQuestion> list = examQuestionDao.findByCriteria(criteria);
		cancelLink(list);
		return true;
	}

	private String getQueryStr(String questionIds) {
		StringBuffer buf = new StringBuffer();
		buf.append(" where eq.questLinkQuestionId like '%");
		String[] arr = questionIds.split(",");
		buf.append(arr[0].split("_")[0]);
		buf.append("%'");
		for (int i = 1; i < arr.length - 1; i++) {
			buf.append(" or eq.questionLinkQuestionId like '%");
			buf.append(arr[1].split("_")[0]);
			buf.append("%'");
		}
		if (arr.length >= 2) {
			buf.append(" or eq.questionLinkQuestionId like '%");
			buf.append(arr[arr.length - 1].split("_")[0]);
			buf.append("%'");
		}
		return buf.toString();
	}

	private void cancelLink(List<ExamQuestion> list) {
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setQuestLinkQuestionId("");
		}
	}

	public boolean updateQuestionsForSetLink(String questionIds)
			throws Exception {
		// TODO Auto-generated method stub
		// 查询questionIds的集合
		String criteria = " where eq.questId in (" + questionIds
				+ ") order by eq.questId asc";
		List<ExamQuestion> list = examQuestionDao.findByCriteria(criteria);
		if (questionIds.split("[,]").length != list.size()) {
			return false;
		}
		setLink(list);
		return true;
	}

	private void setLink(List<ExamQuestion> list) {
		int questId = list.get(0).getQuestId();
		list.get(0).setQuestLinkQuestionId(questId + "_start");
		for (int i = 1; i < list.size() - 1; i++) {
			list.get(i).setQuestLinkQuestionId(questId + "_");
		}
		list.get(list.size() - 1).setQuestLinkQuestionId(questId + "_end");
	}


	public List<ExamQuestion> findQuestionOfRule(int ruleId) throws Exception {
		// TODO Auto-generated method stub
		return examQuestionDao.findAllByRuleId(ruleId);
	}

	// 提交试卷，评判分
	// 1,更新试卷属性,2,添加考试记录,3,评判分
	// 评分规则
	public ExamRecord updateForAnswer(Student stu,int paperId, String answers,List<String> textarea,List<String> qids,
										Date startTime,Date endTime) throws Exception {
		ExamPaper paper = examPaperDao.findById(paperId);
		List<ExamQuestion> list = examQuestionDao.findAllByPaperId(paperId);
		List<ExamRule> rules = paper.getExamRules();
		StringBuffer scoreBuf = new StringBuffer("eachScore&");
		try {
			String[] arr = answers.split("&");	//答案
			double score = 0, score1 = 0,score2=0;
			StringBuffer buf = new StringBuffer();
			for(int k=0;k<rules.size();k++)		//循环大题
			{
				ExamRule r = rules.get(k);
				double fen = r.getRuleScoreForEach();//每题的分数
				String fenRule = r.getRuleScoreSet();//判分规则 0|N表示每题多少分就是多少分，
													//1|N,表示答对一个选项得N分，全部答对得该题的满分
													//2|N,表示打错扣N分,最少得0分
				for(int j=0;j<list.size();j++)	//循环题目
				{
					ExamQuestion q = list.get(j);
					double tempScore = 0;
					for(int i=1;i<arr.length;i++)	//循环答案
					{
						String arr1[] = arr[i].split("[-]"); //解析答案    1001-1002-A; 1001是大题号，1002是题号，A是答案
						String actualAns = arr1.length>2?arr1[2]:"#";
						if(q.getQuestRuleId().equals(r.getRuleId())) //属于该大题的题目，按该规则进行判分
						{
							if(fenRule.startsWith("0|")) //答错不扣分，全对才得满分
							{
								if(q.getQuestId().equals(Integer.parseInt(arr1[1]))&&q.getQuestAnswer().equals(actualAns))
								{
									score=score+fen;	//得分
									tempScore = fen;
								}
							}else if(fenRule.startsWith("1|"))//答对一个选项得多少分
							{
								if(q.getQuestId().equals(Integer.parseInt(arr1[1])))
								{
									String qans = q.getQuestAnswer();
									if(qans.contains(actualAns)){
										if(qans.equals(actualAns))
										{
											score = score+fen;
											tempScore = fen;
										}else{
											String[] ua = actualAns.split("[,]");	//少选得分，是每个选项的得分还是只要是少选就得多少分
											double fen1 = Double.parseDouble(fenRule.split("[|]")[1])* ua.length;
											score = score+fen1;
											tempScore = fen1;
										}
									}
								}
							}else if(fenRule.startsWith("2|"))//答错扣分
							{
								if(q.getQuestId().equals(Integer.parseInt(arr1[1])))
								{
									String qans = q.getQuestAnswer();
									if(qans.equals(actualAns))
									{
										score1 = score1+Double.parseDouble(fenRule.split("[|]")[1]);
										tempScore = Double.parseDouble(fenRule.split("[|]")[1]);
									}else
									{
										score1 = score1-Double.parseDouble(fenRule.split("[|]")[1]);
										tempScore = 0-Double.parseDouble(fenRule.split("[|]")[1]);
									}
								}
							}
						}
					}
					scoreBuf.append(r.getRuleId()).append("-").append(q.getQuestId()).append("-").append(tempScore).append("&");	//每道题的得分
				}
				//每大题得分
				if(fenRule.startsWith("2|"))
				{
					buf.append(r.getRuleId());
					buf.append("=");
					buf.append(score1>0?score1:0);
					buf.append(";");}
				else
				{
					buf.append(r.getRuleId());
					buf.append("=");
					score2 = score-score2;
					buf.append(score2);buf.append(";");
					score2 = score;
				}
			}
			score = score1>0?(score+score1):score;
			ExamRecord record = null;
			//学员答案存进去
			record = examRecordDao.findBy2Id(stu.getStuId(), paperId);
			if(record==null){
				record = new ExamRecord();
				paper.setPaperClickNum(paper.getPaperClickNum()+1);//更新点击次数,同一学员重复考试不算
			}
			record.setPaperId(paperId);
			record.setPaperName(paper.getPaperName());
			record.setRcdTestNum((record.getRcdTestNum()==null?0:record.getRcdTestNum())+1);//考试次数+1
			record.setRcdScoreForEachRule(buf.toString());
			if(textarea!=null&&textarea.size()!=0)	//保存问答题的答案
			{
				buf.delete(0, buf.length());
				buf.append(answers);
				for (int i = 0; i < qids.size(); i++) {
					buf.append("  ");
					buf.append(qids.get(i));
					buf.append("=");
					buf.append(textarea.get(i).replaceAll("[\\s]+", " "));
				}
				record.setRcdAnswers(buf.toString());
			}else{
				record.setRcdAnswers(answers);
			}
			record.setRcdScore(score);
			record.setRcdScoreForEachQuestion(scoreBuf.toString());//每题的得分情况
			record.setPaperScore(paper.getPaperScore());
			record.setStuId(stu.getStuId());
			record.setStuUserName(stu.getStuUsername());
			record.setRcdStartTime(startTime);
			record.setRcdEndTime(endTime);
			record.setRcdTempAnswer("");
			examRecordDao.saveOrUpdate(record);
			return record;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	//查找某条件下的所有小题
	public List<ExamQuestion> findByCriteria(String criteria) throws Exception {
		// TODO Auto-generated method stub
		return examQuestionDao.findByCriteria(criteria);
	}
	public ExamRecord updateForManualMark(int paperId, int recordId,
			List<String> qids, List<String> rids, List<String> scores)
			throws Exception {
		// TODO Auto-generated method stub
		ExamRecord record = examRecordDao.findById(recordId);
		Map<String,Double> map = new HashMap<String,Double>();// key为大题id,value为大题得分
		StringBuffer buf2 = new StringBuffer(record.getRcdScoreForEachQuestion());
		double score=0;
		for(int i=0;i<qids.size();i++)	//循环问题的id
		{
			Double temp = (Double)map.get(rids.get(i));	
			map.put(rids.get(i), Double.parseDouble(scores.get(i))+(temp==null?0:temp));
			score+=Double.parseDouble(scores.get(i));
			buf2.append("&").append(rids.get(i)).append("-").append(qids.get(i)).append("-").append(Double.parseDouble(scores.get(i)));
		}
		record.setRcdScore(record.getRcdScore()+score); //总分
		String[] scoreForEach = record.getRcdScoreForEachRule().split(";"); //每大题得分
		StringBuffer buf = new StringBuffer();
		for(int i=0;i<scoreForEach.length;i++)
		{
			String[] str = scoreForEach[i].split("=");
			Double temp = (Double)map.get(str[0]);
			temp = temp==null?0.0:temp;
			buf.append(str[0]+"="+(Double.parseDouble(str[1])+temp));
			buf.append(";");
		}
		record.setRcdScoreForEachRule(buf.toString());
		record.setRcdScoreForEachQuestion(buf2.toString());
		return record;
	}
	public ExamRecord findRecordById(int rcdId) throws Exception {
		// TODO Auto-generated method stub
		return examRecordDao.findById(rcdId);
	}
	@Override
	public List<ExamRecord> findRecordByCriteria(String criteria, int page,
			int pagesize, String sortname, String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return examRecordDao.findPageByCriteria(criteria, page, pagesize, sortname, sortorder);
	}
	@Override
	public int findRecordTotalByCriteria(String criteria) throws Exception {
		// TODO Auto-generated method stub
		return (int) examRecordDao.findTotalByCriteria(criteria);
	}
	@Override
	public ExamRecord findRecordBy2Id(int stuId, int paperId)
			throws Exception {
		// TODO Auto-generated method stub
		return examRecordDao.findBy2Id(stuId, paperId);
	}
	@Override
	public int findExamNumbers(int paperId) throws Exception {
		// TODO Auto-generated method stub
		return (int) examRecordDao.findExamNumbers(paperId);
	}
	@Override
	public int findScoreRank(int stuId, int paperId) throws Exception {
		// TODO Auto-generated method stub
		return (int) examRecordDao.findScoreRank(stuId, paperId);
	}
	@Override
	public ExamRule findRuleById(int ruleId) throws Exception {
		// TODO Auto-generated method stub
		return examRuleDao.findById(ruleId);
	}
	@Override
	public void saveAnswer(int paperId, int stuId, String optionAnswer,
			String contentAnswer) throws Exception {
		// TODO Auto-generated method stub
		ExamRecord record = examRecordDao.findBy2Id(stuId, paperId);
		if(record==null)
		{
			ExamPaper paper = examPaperDao.findById(paperId);
			paper.setPaperClickNum(paper.getPaperClickNum()+1);	//之前没有记录，加1
			//还没有记录，那就记录一下
			record = new ExamRecord();
			record.setPaperId(paperId);
			record.setStuId(stuId);
			record.setRcdTempAnswer(optionAnswer+"   "+contentAnswer.trim());
		}else
		{
			record.setRcdTempAnswer(optionAnswer+"   "+contentAnswer.trim());
		}
		examRecordDao.saveOrUpdate(record);
	}
}
