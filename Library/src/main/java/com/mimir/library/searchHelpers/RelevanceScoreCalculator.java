package com.mimir.library.searchHelpers;

import java.util.List;

import com.mimir.library.model.Author;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookGenre;

public class RelevanceScoreCalculator {

	public static int calculateRelevanceScore(Book book, List<String> keywords){
		int score = 0;
		for(String keyword : keywords){
			if(book.getBookDisplay().getTitle().toLowerCase().contains(keyword.toLowerCase())){
				score += keyword.length();
			}
			for(Author a : book.getAuthors()){
				if(a.getName().toLowerCase().contains(keyword.toLowerCase())){
					score += keyword.length();
				}
			}
			for(BookGenre bg : book.getGenres()){
				if(bg.getGenre().getGenre().toLowerCase().contains(keyword.toLowerCase())){
					score += keyword.length();
				}
			}
		}
		// System.out.println("DEBUG - Relevance Score for " + book.getBookDisplay().getTitle() + " is " + score  + ".");
		return score;
	}
	
}
