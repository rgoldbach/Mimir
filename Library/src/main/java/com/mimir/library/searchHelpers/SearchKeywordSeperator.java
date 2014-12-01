package com.mimir.library.searchHelpers;

import java.util.ArrayList;
import java.util.List;

public class SearchKeywordSeperator {

	public static List<String> seperateKeywords(String searchKeyword){
	    List<String> keywords = new ArrayList<String>();
	    searchKeyword = searchKeyword.trim();
		for(int i = 0; i < searchKeyword.length(); i++){
	            if(searchKeyword.charAt(i) == '"'){
	                int endQuoteIndex = searchKeyword.indexOf("\"", (i+1));
	                if(endQuoteIndex != -1){
	                    keywords.add(searchKeyword.substring((i+1), endQuoteIndex));
	                    i = endQuoteIndex;
	                }
	            }
	            else if(searchKeyword.charAt(i) != ' '){
	                int endIndex = searchKeyword.indexOf(" ", (i+1));
	                if(endIndex == -1){
	                    keywords.add(searchKeyword.substring((i), searchKeyword.length()));
	                    return keywords;
	                }
	                keywords.add(searchKeyword.substring((i), endIndex));
	                i = endIndex;
	            }
	        }
	    return keywords;
	}
	
}
