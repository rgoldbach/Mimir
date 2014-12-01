package com.mimir.library.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mimir.library.analysis.ChartResult;
import com.mimir.library.beans.BasicBookInfo;
import com.mimir.library.service.ReportsService;
import com.mimir.library.service.SearchService;

@Controller
public class ReportsController {

	@Autowired
	ReportsService service;
	
	@Autowired
	SearchService search;
	
	
	@RequestMapping(value ="/reports", method = RequestMethod.GET)
	@ResponseBody
	public ChartResult reports(){
		ChartResult cr = service.getAnalyzedDataForCharts();
	
		return service.getAnalyzedDataForCharts();
	}
	
}
