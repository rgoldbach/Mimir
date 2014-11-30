package com.mimir.library.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AdvancedSearchForm;
import com.mimir.library.service.SearchService;

@ControllerAdvice 
public class PageHeaderController {

	@Autowired
	SearchService searchService;

	@ModelAttribute
	public void myMethod(Model model) {
		AdvancedSearchForm advancedSearchForm = new AdvancedSearchForm();
		model.addAttribute("advancedSearchForm", advancedSearchForm);
		initModelLists(model);
	}
	
	private void initModelLists(Model model) {
		List<String> genreList = searchService.getAllGenresAsStrings();
		List<String> languageList = searchService.getAllLanguagesAsStrings();
		List<String> publisherList = searchService.getAllPublishersAsStrings();
		List<String> awardList = searchService.getAllAwardsAsStrings();
		List<String> formatList = searchService.getAllFormatsAsStrings();
		List<String> addedList = new ArrayList<String>();
		for(int i = 0; i < GlobalConstants.DATE_ADDED_FOR_SEARCH.length; i++){
			addedList.add(GlobalConstants.DATE_ADDED_FOR_SEARCH[i]);
		}
			
		model.addAttribute("genres", genreList);
		model.addAttribute("languages", languageList);
		model.addAttribute("publishers", publisherList);
		model.addAttribute("awards", awardList);
		model.addAttribute("addeds", addedList);
		model.addAttribute("formats", formatList);
	}
}
