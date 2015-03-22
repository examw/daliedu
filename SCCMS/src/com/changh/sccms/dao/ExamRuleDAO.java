package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.ExamRule;

public interface ExamRuleDAO {
		//保存大题
		public void save(ExamRule rule)throws Exception;
		//findbyId
		public ExamRule findById(int ruleId)throws Exception;
		//修改大题
		public void update(ExamRule paper)throws Exception;
		//分页查询某试卷下的所有大题
		public List<ExamRule> findPageByExamId(int paperId,int page,int pagesize,String sortname,String sortorder)throws Exception;
		public long findTotalByExamId(int paperId)throws Exception;
		//删除大题
		public void delete(ExamRule rule)throws Exception;
		public void deleteAll(List<ExamRule> rules)throws Exception;
		//保存or更新
		public void saveOrUpdate(List<ExamRule> rules)throws Exception;
}
