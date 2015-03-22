package com.changh.sccms.service.impl;

import java.util.Date;
import java.util.Map;

import com.changh.sccms.dao.ExamQuestionDAO;
import com.changh.sccms.dao.ExamQuestionErrorDAO;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.ExamQuestion;
import com.changh.sccms.entity.ExamQuestionError;
import com.changh.sccms.service.ExamQuestionErrorService;
import com.changh.sccms.until.DegistUtil;
import com.changh.sccms.until.GridDataUtil;
import com.opensymphony.xwork2.ActionContext;

public class ExamQuestionErrorServiceImpl implements ExamQuestionErrorService {
	private ExamQuestionDAO examQuestionDao;
	private ExamQuestionErrorDAO examQuestionErrorDao;

	public void setExamQuestionDao(ExamQuestionDAO examQuestionDao) {
		this.examQuestionDao = examQuestionDao;
	}

	public void setExamQuestionErrorDao(
			ExamQuestionErrorDAO examQuestionErrorDao) {
		this.examQuestionErrorDao = examQuestionErrorDao;
	}

	public ExamQuestionError findById(int id) throws Exception {
		// TODO Auto-generated method stub
		return examQuestionErrorDao.findById(id);
	}

	public Map<String, Object> findPageByCriteria(String criteria, int page,
			int pagesize, String sortname, String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return GridDataUtil.gridMap(examQuestionErrorDao.findPageByCriteria(
				criteria, page, pagesize, sortname, sortorder),
				(int) examQuestionErrorDao.findTotalByCriteria(criteria));
	}

	public boolean updateError(ExamQuestionError error, ExamQuestion question)
			throws Exception {
		// TODO Auto-generated method stub
		if (question != null) {
			ExamQuestion real = examQuestionDao.findById(question.getQuestId());
			question.setQuestMd5code(DegistUtil.getMd5CodeOfQuestion(question
					.getQuestContent()));
			if (real == null) {
				return false;
			}
			if (real.equals(question)) // 没做修改不更新
			{
				return false;
			}
			changeQuestionAttribute(real, question);// 更新问题
		}
		// 更新状态
		ExamQuestionError realError = examQuestionErrorDao.findById(error
				.getId());
		realError.setErrorDealTime(new Date());
		realError.setErrorStatus(1);
		realError.setErrorDealPerson(((Administrator) ActionContext
				.getContext().getSession().get("admin")).getAdmUsername());
		return true;
	}

	private void changeQuestionAttribute(ExamQuestion real,
			ExamQuestion question) {
		real.setQuestContent(question.getQuestContent());
		real.setQuestAnswer(question.getQuestAnswer());
		real.setQuestAnalysis(question.getQuestAnalysis());
		real.setQuestOptionNum(question.getQuestOptionNum());
		real.setQuestMd5code(question.getQuestMd5code());
	}

	public ExamQuestion findQuestionById(int questId) throws Exception {
		// TODO Auto-generated method
		return examQuestionDao.findById(questId);
	}
}
