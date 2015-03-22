package com.changh.sccms.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.changh.sccms.dao.ExamPaperDAO;
import com.changh.sccms.dao.ExamQuestionDAO;
import com.changh.sccms.dao.ExamRuleDAO;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.ExamPaper;
import com.changh.sccms.entity.ExamQuestion;
import com.changh.sccms.entity.ExamRule;
import com.changh.sccms.service.ExamPaperService;
import com.changh.sccms.until.Constant;
import com.changh.sccms.until.DegistUtil;
import com.changh.sccms.until.GridDataUtil;
import com.opensymphony.xwork2.ActionContext;

public class ExamPaperServiceImpl implements ExamPaperService {
	private ExamPaperDAO examPaperDao;
	private ExamRuleDAO examRuleDao;
	private ExamQuestionDAO examQuestionDao;

	public void setExamPaperDao(ExamPaperDAO examPaperDao) {
		this.examPaperDao = examPaperDao;
	}

	public void setExamRuleDao(ExamRuleDAO examRuleDao) {
		this.examRuleDao = examRuleDao;
	}

	public void setExamQuestionDao(ExamQuestionDAO examQuestionDao) {
		this.examQuestionDao = examQuestionDao;
	}

	public Map<String, Object> findPageByExamId(int examId, int page,
			int pagesize, String sortname, String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return GridDataUtil.gridMap(examPaperDao.findPageByExamId(examId, page,
				pagesize, sortname, sortorder), (int) examPaperDao
				.findTotalByExamId(examId));
	}

	public Map<String, Object> findPageByContent(String content, int page,
			int pagesize, String sortname, String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return GridDataUtil.gridMap(examPaperDao.findPageByContent(content,
				page, pagesize, sortname, sortorder), (int) examPaperDao
				.findTotalByContent(content));
	}

	public void addPaper(ExamPaper paper, List<ExamRule> rules)
			throws Exception {
		// 设置paper的一些属性
		paper.setPaperAddTime(new Date());
		paper.setPaperIsChecked(0);
		paper.setPaperClickNum(0);
		int paperId = examPaperDao.save(paper);
		// 遍历list,添加rule
		for (ExamRule rule : rules) {
			if (rule != null) {
				rule.setPaperId(paperId);// 设置所属试卷的id
				rule.setRuleActualAddNum(0);
				examRuleDao.save(rule);
			}
		}
	}

	public Map<String, Object> findQuestionOfPaper(int paperId, int page,
			int pagesize, String sortname, String sortorder) throws Exception {
		// TODO Auto-generated method stub
		// 找出paper下的所有问题
		String criteria = " where eq.questPaperId = " + paperId;
		List<ExamQuestion> list = examQuestionDao.findPageByCriteria(criteria,
				page, pagesize, sortname, sortorder);
		int total = (int) examQuestionDao.findTotalByCriteria(criteria);
		return GridDataUtil.gridMap(list, total);
	}

	public Map<String, Object> findQuestionByContent(String content, int page,
			int pagesize, String sortname, String sortorder) throws Exception {
		// TODO Auto-generated method stub
		List<ExamQuestion> list = examQuestionDao.findPageByCriteria(content,
				page, pagesize, sortname, sortorder);
		int total = (int) examQuestionDao.findTotalByCriteria(content);
		return GridDataUtil.gridMap(list, total);
	}

	public ExamPaper findById(int paperId) throws Exception {
		// TODO Auto-generated method stub
		return examPaperDao.findById(paperId);
	}

	public ExamPaper findPaperByName(String paperName) throws Exception {
		return examPaperDao.findByName(paperName);
	}

	public boolean deletePaper(int paperId) throws Exception {
		ExamPaper paper = examPaperDao.findById(paperId);
		// 删小题
		if (paper != null) {
			List<ExamQuestion> questionList = examQuestionDao
					.findAllByPaperId(paperId);
			examQuestionDao.deleteAll(questionList);
			// 删大题
			examRuleDao.deleteAll(paper.getExamRules()); // 一对多不知道级联与否
			// 删试卷
			examPaperDao.delete(paper);
			return true;
		}
		return false;
	}

	public boolean deleteRule(int ruleId) throws Exception {
		// TODO Auto-generated method stub
		ExamRule rule = examRuleDao.findById(ruleId);
		if (rule != null) {
			if (rule.getRuleActualAddNum() != 0) {
				List<ExamQuestion> list = examQuestionDao
						.findAllByRuleId(ruleId);
				// 删除所有小题
				examQuestionDao.deleteAll(list);
			}
			// 删除该大题 (是否要维护那个大题的序号？？)
			examRuleDao.delete(rule);
			// 维护总分
			examPaperDao.updatePaperScore(rule.getPaperId(),
					rule.getRuleQuestionNum() * rule.getRuleScoreForEach());
			return true;
		}
		return false;
	}

	// 更新试卷
	public void updatePaper(ExamPaper paper, List<ExamRule> rules)
			throws Exception {
		// TODO Auto-generated method stub
		// 先从数据库找出该试卷
		ExamPaper realPaper = examPaperDao.findById(paper.getPaperId());
		List<ExamRule> realRules = realPaper.getExamRules();// 实际的大题，可能有被删除的情况
		// 更新rules属性，然后保存
		List<ExamRule> list = updateRuleAttribute(rules, realRules);
		examRuleDao.saveOrUpdate(list);
		// 更新paper属性，然后保存
		updatePaperAttribute(paper, realPaper);
		examPaperDao.update(realPaper); // 这句可不写
	}

	private List<ExamRule> updateRuleAttribute(List<ExamRule> rules,
			List<ExamRule> realRules) {
		List<ExamRule> dest = new ArrayList<ExamRule>();
		Integer paperId = null;
		for (ExamRule rule : rules) // 循环提交上来的list
		{
			if (rule != null) {
				if (rule.getRuleId() != null) {
					for (int i = 0; i < realRules.size(); i++) {
						ExamRule realRule = realRules.get(i); // 怎么不是同一个对象？
						paperId = realRule.getPaperId(); // 设置下面新的大题的paperId
						if (rule.getRuleId().equals(realRule.getRuleId())) // 与实际的进行对比，如果有相同的，更新属性
						{
							// 更新属性
							realRule.setRuleIdInPaper(rule.getRuleIdInPaper());// 在试卷中的位置
							realRule.setRuleQuestionNum(rule
									.getRuleQuestionNum());
							realRule.setRuleScoreForEach(rule
									.getRuleScoreForEach());
							realRule.setRuleScoreSet(rule.getRuleScoreSet());
							realRule.setRuleTitle(rule.getRuleTitle());
							realRule.setRuleType(rule.getRuleType());
							// 加入新建的list
							dest.add(realRule);
							break;// 找到一个就跳出循环，只可能有一个
						}
					}
				} else {
					// 新的大题
					rule.setPaperId(paperId);
					rule.setRuleActualAddNum(0);
					dest.add(rule);
				}
			}

		}
		return dest;
	}

	private void updatePaperAttribute(ExamPaper paper, ExamPaper realPaper) {
		realPaper.setPaperName(paper.getPaperName());
		realPaper.setPaperScore(paper.getPaperScore());
		realPaper.setPaperTime(paper.getPaperTime());
		realPaper.setPaperEditor(paper.getPaperEditor());
		realPaper.setPaperEGCheaterId(paper.getPaperEGCheaterId());
		realPaper.setPaperEGradeId(paper.getPaperEGradeId());
		realPaper.setPaperLinkName(paper.getPaperLinkName());
		realPaper.setPaperType(paper.getPaperType());
	}

	public ExamRule findRuleById(int ruleId) throws Exception {
		// TODO Auto-generated method stub
		return examRuleDao.findById(ruleId);
	}

	public List<String> findQuestionNo(int ruleId, List<String> list)
			throws Exception {
		// TODO Auto-generated method stub
		List<String> real = examQuestionDao.findQuestionNo(ruleId);
		list.removeAll(real);
		return list;
	}

	public String addQuestion(ExamQuestion question, String link)
			throws Exception {
		// TODO Auto-generated method stub
		ExamRule rule = examRuleDao.findById(question.getQuestRuleId());
		if (rule == null)
			return "-1";
		question.setQuestAddTime(new Date());
		question.setQuestMd5code(DegistUtil.getMd5CodeOfQuestion(question
				.getQuestContent())); // 设置md5code
		if (link == null) // 表示不是连题
		{
			examQuestionDao.save1(question);
			rule.setRuleActualAddNum(rule.getRuleActualAddNum() + 1); // 更新该大题实际添加的题目数
			return "1";
		} else if (link.equals("1")) {
			// 表示勾选了连题开始
			int questId = examQuestionDao.save(question);
			// 设置连题属性
			ExamQuestion question1 = examQuestionDao.findById(questId);
			question1.setQuestLinkQuestionId(questId + "_start");
			// examQuestionDao.update(question1)
			rule.setRuleActualAddNum(rule.getRuleActualAddNum() + 1); // 更新该大题实际添加的题目数
			return questId + "_";
		} else // if(link.endsWith("_end"))
		{
			// 表示连题继续或者结束
			question.setQuestLinkQuestionId(link);
			examQuestionDao.save1(question);
			rule.setRuleActualAddNum(rule.getRuleActualAddNum() + 1); // 更新该大题实际添加的题目数
			return link;
		}
	}

	public boolean checkRepeat(String content, int ruleId, int model)
			throws Exception {
		// TODO Auto-generated method stub
		String code = DegistUtil.getMd5CodeOfQuestion(content);
		List<ExamQuestion> list = examQuestionDao.findByMD5Code(code, ruleId);
		if (model == 0)
			return list == null; // 为真，表示可以加入
		return list == null || list.size() == 1;
	}

	public ExamQuestion findQuestionById(int questId) throws Exception {
		// TODO Auto-generated method stub
		return examQuestionDao.findById(questId);
	}

	public String findLinkedQid() throws Exception {
		// TODO Auto-generated method stub
		return examQuestionDao.findLinkedQid();
	}

	public boolean deleteQuestion(int questId) throws Exception {
		// TODO Auto-generated method stub
		ExamQuestion question = examQuestionDao.findById(questId);
		if (question == null) {
			return false;
		} else {
			examQuestionDao.delete(question);
			// 更新大题实际的添加数
			ExamRule rule = examRuleDao.findById(question.getQuestRuleId());
			rule.setRuleActualAddNum(rule.getRuleActualAddNum() - 1);
			// examRuleDao.update(rule);
			return true;
		}
	}

	public boolean updateQuestion(ExamQuestion question) throws Exception {
		// TODO Auto-generated method stub
		ExamQuestion real = examQuestionDao.findById(question.getQuestId());
		if (real != null) {
			real.setQuestAnalysis(question.getQuestAnalysis());
			real.setQuestAnswer(question.getQuestAnswer());
			real.setQuestContent(question.getQuestContent());
			real.setQuestEditor(question.getQuestEditor());
			real.setQuestOptionNum(question.getQuestOptionNum());
			real.setQuestMd5code(DegistUtil.getMd5CodeOfQuestion(question
					.getQuestContent()));
			// examQuestionDao.update(question);
			return true;
		}
		return false;
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

	public boolean saveBatchFromFile(File mf, int ruleId, int paperId,
			int questType, int startNo, int model) throws Exception {
		// TODO Auto-generated method stub
		String editor = ((Administrator) ActionContext.getContext()
				.getSession().get("admin")).getAdmUsername();
		ExamRule rule = examRuleDao.findById(ruleId);
		if (rule == null)
			return false;
		List<ExamQuestion> list = null;
		if (model == 0) {
			list = parseFile(mf, ruleId, paperId, questType, startNo, editor);
		} else {
			list = parseFile2(mf, ruleId, paperId, questType, startNo, editor);
		}
		if (list.size() < 1) {
			return false;
		}
		examQuestionDao.save(list,
				rule.getRuleQuestionNum() - rule.getRuleActualAddNum());
		// 更新rule
		rule.setRuleActualAddNum(rule.getRuleActualAddNum() + list.size());
		examRuleDao.update(rule);
		return true;

	}

	private List<ExamQuestion> parseFile(File mf, int ruleId, int paperId,
			int questType, int startNo, String editor) throws IOException {
		List<ExamQuestion> list = null;
		BufferedReader br = null;
		try {
			list = new ArrayList<ExamQuestion>();
			br = new BufferedReader(new InputStreamReader(new FileInputStream(
					mf)));
			String str = br.readLine();
			String str2 = null;
			String str3 = null;
			String str4 = null;
			StringBuffer buf = new StringBuffer();
			StringBuffer buf1 = new StringBuffer();
			StringBuffer buf2 = new StringBuffer();
			StringBuffer md5buf = new StringBuffer();
			int count = 1;
			while (str != null) {
				if (!str.startsWith(String.valueOf(count))) {
					str = br.readLine();
				} else {
					// 表示第一题开始
					ExamQuestion question = new ExamQuestion();
					str2 = str;
					while (str2 != null) {
						if (str2.indexOf("[答案]") == -1) {
							buf.append(str2 + "\n");
							str2 = br.readLine();
						} else {
							str3 = str2;
							if (questType != Constant.Q_QANDA) {
								while (str3 != null) {
									if (str3.indexOf("[解析]") == -1) {
										buf1.append(str3 + "\n");
										str3 = br.readLine();
									} else {
										str4 = str3;
										while (str4 != null) {
											if (!str4.startsWith(String
													.valueOf(count + 1))) {
												buf2.append(str4 + "\n");
												str4 = br.readLine();
											} else {
												count = count + 1;
												break;
											}
										}
										// 解析加完
										question.setQuestAnalysis(buf2
												.delete(0, 5).toString().trim());
										buf2.delete(0, buf2.length());
										str3 = null;
									}
								}
							} else {
								str4 = str2;
								while (str4 != null) {
									if (!str4.startsWith(String
											.valueOf(count + 1))) {
										buf2.append(str4 + "\n");
										str4 = br.readLine();
									} else {
										count = count + 1;
										break;
									}
								}
								// 解析加完
								question.setQuestAnalysis(buf2.delete(0, 5)
										.toString().trim());
								buf2.delete(0, buf2.length());
								str3 = null;
							}
							// 答案加完
							question.setQuestAnswer(buf1.delete(0, 5)
									.toString().trim());
							buf1.delete(0, buf1.length()); // 清空buf1
							str2 = null;
						}
					}
					// 题目加完
					buf.delete(0, 2);
					question.setQuestContent(buf.toString().trim());
					String md5 = DegistUtil.getMd5CodeOfQuestion(buf.toString()
							.trim());
					question.setQuestMd5code(md5);
					if (list.size() == 0) {
						question.setQuestAddTime(new Date());
						question.setQuestOrderId(startNo);
						question.setQuestType(questType);
						question.setQuestRuleId(ruleId);
						question.setQuestPaperId(paperId);
						question.setQuestEditor(editor);
						question.setQuestOptionNum(buf.toString()
								.replaceAll("[A-Z][.)、．]", "@@@").split("@@@").length - 1);
						list.add(question);
						md5buf.append(md5);
					} else if (md5buf.indexOf(md5) == -1)// 判断重复
					{
						question.setQuestAddTime(new Date());
						question.setQuestOrderId(startNo + list.size());
						question.setQuestType(questType);
						question.setQuestRuleId(ruleId);
						question.setQuestPaperId(paperId);
						question.setQuestEditor(editor);
						question.setQuestOptionNum(buf.toString()
								.replaceAll("[A-Z][.)、．]", "@@@").split("@@@").length - 1);
						list.add(question);
						md5buf.append(md5);
					}
					str = str4;
					buf.delete(0, buf.length()); // 清空buf
				}
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			br.close();
		}
		return list;
	}

	private List<ExamQuestion> parseFile2(File mf, int ruleId, int paperId,
			int questType, int startNo, String editor) throws IOException {
		List<ExamQuestion> list = null;
		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(new FileInputStream(
					mf)));
			String str = br.readLine();
			String str2 = null;
			String str3 = null;
			StringBuffer buf = new StringBuffer();
			StringBuffer buf2 = new StringBuffer();
			StringBuffer md5buf = new StringBuffer();
			list = new LinkedList<ExamQuestion>();
			int count = 1;
			while (str != null) {
				if (!str.startsWith(String.valueOf(count))) {
					str = br.readLine();
				} else {
					// 表示第一题开始
					ExamQuestion q = new ExamQuestion();
					str2 = str;
					while (str2 != null) {
						if (!str2.startsWith(String.valueOf(count + 1))) {
							if (str2.startsWith("[答案]")) {
								str3 = br.readLine();
								while (str3 != null) {
									buf2.append(str3);
									str3 = br.readLine();
								}
							}
							buf.append(str2 + "\n");
							str2 = br.readLine();
						} else {
							count = count + 1;
							break;
						}
					}
					buf.delete(0, 2);
					String content = buf.toString().trim();
					q.setQuestContent(content);
					String md5 = DegistUtil.getMd5CodeOfQuestion(content);
					q.setQuestMd5code(md5);
					if (list.size() == 0) {
						q.setQuestAddTime(new Date());
						q.setQuestOrderId(startNo);
						q.setQuestType(questType);
						q.setQuestRuleId(ruleId);
						q.setQuestPaperId(paperId);
						q.setQuestEditor(editor);
						q.setQuestOptionNum(content.replaceAll("[A-Z][.)、．]",
								"@@@").split("@@@").length - 1);
						list.add(q);
						md5buf.append(md5);
					} else if (md5buf.indexOf(md5) == -1)// 判断重复
					{
						q.setQuestAddTime(new Date());
						q.setQuestOrderId(startNo);
						q.setQuestType(questType);
						q.setQuestRuleId(ruleId);
						q.setQuestPaperId(paperId);
						q.setQuestEditor(editor);
						q.setQuestOptionNum(content.replaceAll("[A-Z][.)、．]",
								"@@@").split("@@@").length - 1);
						list.add(q);
						md5buf.append(md5);
					} else {
						list.add(null); // 跳过重复的答案
					}
					str = str2;
					buf.delete(0, buf.length()); // 清空buf
				}
			}
			String answer[] = buf2.toString().split("[0-9]+[.．)]");
			// 为question加答案
			for (int i = 0; i < list.size(); i++) {
				ExamQuestion e = list.get(i);
				if (e != null) {
					e.setQuestAnswer(answer[i + 1].trim());
				}
			}
			// 清除为null的元素
			while (list.contains(null)) {
				list.remove(null);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			br.close();
		}
		return list;
	}

	public boolean saveBatchFromEditor(String questContent, int ruleId,
			int paperId, int questType, int startNo, int model)
			throws Exception {
		// TODO Auto-generated method stub
		String editor = ((Administrator) ActionContext.getContext()
				.getSession().get("admin")).getAdmUsername();
		ExamRule rule = examRuleDao.findById(ruleId);
		if (rule == null)
			return false;
		List<ExamQuestion> list = null;
		if (model == 0) {
			list = parseContent(questContent, ruleId, paperId, questType,
					startNo, editor);
		} else {
			list = parseContent2(questContent, ruleId, paperId, questType,
					startNo, editor);
		}
		if (list.size() == 0) {
			return false;
		}
		examQuestionDao.save(list,
				rule.getRuleQuestionNum() - rule.getRuleActualAddNum());
		// 更新rule
		rule.setRuleActualAddNum(rule.getRuleActualAddNum() + list.size());
		examRuleDao.update(rule);
		return true;
	}

	private List<ExamQuestion> parseContent(String questContent, int ruleId,
			int paperId, int questType, int startNo, String editor) {
		List<ExamQuestion> list = new ArrayList<ExamQuestion>();
		try {
			questContent = "<p><br /></p>" + questContent;
			questContent = questContent.replaceAll("<[/]?p>", "")
					.replaceAll("&nbsp;", "")
					.replaceAll("<br />[0-9]+[、．]", "@@@@"); //2014.04.11去掉小数点的情况
			String[] contentArr = questContent.split("@@@@");
			StringBuffer buf = new StringBuffer();
			StringBuffer md5buf = new StringBuffer();
			for (int i = 1; i < contentArr.length; i++) {
				String s = contentArr[i];
				ExamQuestion q = new ExamQuestion();
				if (buf.length() != 0) {
					buf.delete(0, buf.length());
				}
				buf.append(s.replaceAll("<br />", "\n"));
				String content = buf.substring(0, buf.indexOf("[答案]:")).trim();
				q.setQuestContent(content);
				String md5 = DegistUtil.getMd5CodeOfQuestion(content);
				q.setQuestMd5code(md5);
				if (list.size() == 0) {
					q.setQuestAnswer(buf.substring(buf.indexOf("[答案]:") + 5,
							buf.indexOf("[解析]:")).trim());
					q.setQuestAnalysis(buf.substring(buf.indexOf("[解析]:") + 5)
							.trim());
					q.setQuestAddTime(new Date());
					q.setQuestOrderId(startNo);
					q.setQuestType(questType);
					q.setQuestRuleId(ruleId);
					q.setQuestPaperId(paperId);
					q.setQuestEditor(editor);
					q.setQuestOptionNum(content
							.replaceAll("[A-Z][.)、．]", "@@@").split("@@@").length - 1);
					list.add(q);
					md5buf.append(md5);
				} else if (md5buf.indexOf(md5) == -1)// 判断重复
				{
					q.setQuestAnswer(buf.substring(buf.indexOf("[答案]:") + 5,
							buf.indexOf("[解析]:")).trim());
					q.setQuestAnalysis(buf.substring(buf.indexOf("[解析]:") + 5)
							.trim());
					q.setQuestAddTime(new Date());
					q.setQuestOrderId(startNo + list.size());
					q.setQuestType(questType);
					q.setQuestRuleId(ruleId);
					q.setQuestPaperId(paperId);
					q.setQuestEditor(editor);
					q.setQuestOptionNum(content
							.replaceAll("[A-Z][.)、．]", "@@@").split("@@@").length - 1);
					list.add(q);
					md5buf.append(md5);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			list = null;
		}
		return list;
	}

	// 答案在所有题的最后面，只有答案没有解析
	private List<ExamQuestion> parseContent2(String questContent, int ruleId,
			int paperId, int questType, int startNo, String editor) {
		List<ExamQuestion> list = new ArrayList<ExamQuestion>();
		try {
			questContent = "<p><br /></p>" + questContent;
			questContent = questContent.replaceAll("<[/]?p>", "").replaceAll(
					"&nbsp;", "");
			String[] answer = questContent
					.substring(questContent.indexOf("[答案]:"))
					.replaceAll("[0-9]+[.、．)]", "@@@").replaceAll("<br />", "")
					.split("@@@");
			questContent = questContent.substring(0,
					questContent.indexOf("[答案]:")).replaceAll(
					"<br />[0-9]+[.、．]", "@@@@");
			String[] contentArr = questContent.split("@@@@");
			StringBuffer buf = new StringBuffer();
			StringBuffer md5buf = new StringBuffer();
			for (int i = 1; i < contentArr.length; i++) {
				String s = contentArr[i];
				ExamQuestion q = new ExamQuestion();
				if (buf.length() != 0) {
					buf.delete(0, buf.length());
				}
				buf.append(s.replaceAll("<br />", "\n"));
				String content = buf.toString().trim();
				q.setQuestContent(content);
				String md5 = DegistUtil.getMd5CodeOfQuestion(content);
				q.setQuestMd5code(md5);
				if (list.size() == 0) {
					q.setQuestAnswer(answer[i].trim());
					// q.setQuestAnalysis(buf.substring(buf.indexOf("[解析]:")+5).trim());
					q.setQuestAddTime(new Date());
					q.setQuestOrderId(startNo);
					q.setQuestType(questType);
					q.setQuestRuleId(ruleId);
					q.setQuestPaperId(paperId);
					q.setQuestEditor(editor);
					q.setQuestOptionNum(content
							.replaceAll("[A-Z][.)、．]", "@@@").split("@@@").length - 1);
					list.add(q);
					md5buf.append(md5);
				} else if (md5buf.indexOf(md5) == -1)// 判断重复
				{
					q.setQuestAnswer(answer[i].trim());
					// q.setQuestAnalysis(buf.substring(buf.indexOf("[解析]:")+5).trim());
					q.setQuestAddTime(new Date());
					q.setQuestOrderId(startNo + list.size());
					q.setQuestType(questType);
					q.setQuestRuleId(ruleId);
					q.setQuestPaperId(paperId);
					q.setQuestEditor(editor);
					q.setQuestOptionNum(content
							.replaceAll("[A-Z][.)、．]", "@@@").split("@@@").length - 1);
					list.add(q);
					md5buf.append(md5);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			list = null;
		}
		return list;
	}

	public List<ExamQuestion> findQuestionOfRule(int ruleId) throws Exception {
		// TODO Auto-generated method stub
		return examQuestionDao.findAllByRuleId(ruleId);
	}

	//查找某条件下的所有小题
	public List<ExamQuestion> findByCriteria(String criteria) throws Exception {
		// TODO Auto-generated method stub
		return examQuestionDao.findByCriteria(criteria);
	}
}
