package com.mimir.library.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mimir.library.model.AdvancedSearchForm;

@Controller
@RequestMapping(value = "/test")
public class TestPageController {
	@RequestMapping(method = RequestMethod.GET)
	public String initForm(Model model) {
		AdvancedSearchForm advancedSearchForm = new AdvancedSearchForm();
		model.addAttribute("advancedSearchForm", advancedSearchForm);
		initModelLists(model);
		return "/test/index";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String submitForm(Model model, AdvancedSearchForm advancedSearchForm, BindingResult result){
		model.addAttribute("advancedSearchForm", advancedSearchForm);
		return "/test/success";
	}
	
	// this should somehow be done by the database
	private void initModelLists(Model model) {
		List<String> genreList = new ArrayList<String>();
			genreList.add("genre test 1");
			genreList.add("genre test 2");
			genreList.add("genre test 3");
			genreList.add("genre test 4");
			
		List<String> languageList = new ArrayList<String>();
			languageList.add("language test 1");
			languageList.add("language test 2");
			languageList.add("language test 3");
			languageList.add("language test 4");
			
		List<String> publisherList = new ArrayList<String>();
			publisherList.add("publisher test 1");
			publisherList.add("publisher test 2");
			publisherList.add("publisher test 3");
			publisherList.add("publisher test 4");
			
		List<String> awardList = new ArrayList<String>();
			awardList.add("award test 1");
			awardList.add("award test 2");
			awardList.add("award test 3");
			awardList.add("award test 4");
		
		List<String> addedList = new ArrayList<String>();
			addedList.add("added test 1");
			addedList.add("added test 2");
			addedList.add("added test 3");
			addedList.add("added test 4");
			
		List<String> formatList = new ArrayList<String>();
			formatList.add("format test 1");
			formatList.add("format test 2");
			formatList.add("format test 3");
			formatList.add("format test 4");
			
		model.addAttribute("genres", genreList);
		model.addAttribute("languages", languageList);
		model.addAttribute("publishers", publisherList);
		model.addAttribute("awards", awardList);
		model.addAttribute("addeds", addedList);
		model.addAttribute("formats", formatList);
	}
}
