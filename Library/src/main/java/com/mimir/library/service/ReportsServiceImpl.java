package com.mimir.library.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mimir.library.analysis.ChartResult;
import com.mimir.library.dao.ReportsDao;

@Service("reportsService")
@Transactional
public class ReportsServiceImpl implements ReportsService{

	@Autowired
	ReportsDao dao;
	
	@Override
	public ChartResult getAnalyzedDataForCharts() {
		return dao.getAnalyzedDataForCharts();
	}

}
