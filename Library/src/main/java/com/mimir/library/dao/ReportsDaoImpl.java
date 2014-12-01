package com.mimir.library.dao;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.joda.time.DateTimeConstants;
import org.joda.time.LocalDate;
import org.springframework.stereotype.Repository;

import com.mimir.library.analysis.ChartResult;
import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.BorrowedAudioBook;
import com.mimir.library.model.BorrowedEBook;

@Repository("reportsDao")
public class ReportsDaoImpl extends AbstractDao implements ReportsDao{

	@Override
	public ChartResult getAnalyzedDataForCharts() {
		ChartResult results = new ChartResult();
		int[] weeklyEBooks = getWeeklyBookAnalysis(GlobalConstants.EBOOK.toString());
		int[] weeklyAudioBooks = getWeeklyBookAnalysis(GlobalConstants.AUDIOBOOK.toString());
		int[] monthEBooks = getMonthBorrowedCount(GlobalConstants.EBOOK.toString());
		int[] monthAudioBooks = getMonthBorrowedCount(GlobalConstants.AUDIOBOOK.toString());
		int[] yearlyEBooks = getYearlyBorrowedCount(GlobalConstants.EBOOK.toString());
		int[] yearlyAudioBooks = getYearlyBorrowedCount(GlobalConstants.AUDIOBOOK.toString());
		results.setWeeklyBorrowedReportEBook(weeklyEBooks);
		results.setWeeklyBorrowedReportAudioBook(weeklyAudioBooks);
		results.setMonthBorrowedReportEBook(monthEBooks);
		results.setMonthBorrowedReportAudioBook(monthAudioBooks);
		results.setYearlyBorrowedReportEBook(yearlyEBooks);
		results.setYearlyBorrowedReportAudioBook(yearlyAudioBooks);
		return results;
	}

	private int[] getWeeklyBookAnalysis(String whichClass){
		int[] weeklyResults = new int[7];
		LocalDate today = new LocalDate();
		LocalDate startDay = today.withDayOfWeek(DateTimeConstants.MONDAY);
		LocalDate date = startDay.plusDays(GlobalConstants.BORROW_BOOK_LENGTH);
		weeklyResults[0] = getBorrowedCountForSpecificDay(date, whichClass);;
		weeklyResults[1] = getBorrowedCountForSpecificDay(date.plusDays(1), whichClass);;
		weeklyResults[2] = getBorrowedCountForSpecificDay(date.plusDays(2), whichClass);;
		weeklyResults[3] = getBorrowedCountForSpecificDay(date.plusDays(3), whichClass);;
		weeklyResults[4] = getBorrowedCountForSpecificDay(date.plusDays(4), whichClass);;
		weeklyResults[5] = getBorrowedCountForSpecificDay(date.plusDays(5), whichClass);;
		weeklyResults[6] = getBorrowedCountForSpecificDay(date.plusDays(6), whichClass);;
		return weeklyResults;
	}
	
	private int getBorrowedCountForSpecificDay(LocalDate date, String whichClass) {
		Criteria crit = null;
		if(whichClass.equalsIgnoreCase(GlobalConstants.EBOOK)){
			crit = getSession().createCriteria(BorrowedEBook.class);
			crit.add(Restrictions.eq("dateExpires", date));
			crit.setProjection(Projections.rowCount());
			return ((Long) crit.uniqueResult()).intValue();
		}
		else if(whichClass.equalsIgnoreCase(GlobalConstants.AUDIOBOOK)){
			crit =  getSession().createCriteria(BorrowedAudioBook.class);
			crit.add(Restrictions.eq("dateExpires", date));
			crit.setProjection(Projections.rowCount());
			return ((Long) crit.uniqueResult()).intValue();
		}
		return 0;
	}
	
	private int[] getMonthBorrowedCount(String whichClass){
		//4 weeks
		int[] monthResults = new int[4];
		LocalDate today = new LocalDate();
		LocalDate date = today.withDayOfMonth(1).plusDays(GlobalConstants.BORROW_BOOK_LENGTH);
		monthResults[0] = getBorrowedCountForSpecificWeek(date, whichClass);
		monthResults[1] = getBorrowedCountForSpecificWeek(date.plusDays(7), whichClass);
		monthResults[2] = getBorrowedCountForSpecificWeek(date.plusDays(14), whichClass);
		monthResults[3] = getBorrowedCountForSpecificWeek(date.plusDays(21), whichClass);
		return monthResults;
	}

	private int getBorrowedCountForSpecificWeek(LocalDate date,String whichClass) {
		Criteria crit = null;
		if(whichClass.equalsIgnoreCase(GlobalConstants.EBOOK)){
			crit = getSession().createCriteria(BorrowedEBook.class);
			crit.add(Restrictions.ge("dateExpires", date));
			crit.add(Restrictions.le("dateExpires", date.plusDays(7)));
			crit.setProjection(Projections.rowCount());
			return ((Long) crit.uniqueResult()).intValue();
		}
		else if(whichClass.equalsIgnoreCase(GlobalConstants.AUDIOBOOK)){
			crit =  getSession().createCriteria(BorrowedAudioBook.class);
			crit.add(Restrictions.ge("dateExpires", date));
			crit.add(Restrictions.le("dateExpires", date.plusDays(7)));
			crit.setProjection(Projections.rowCount());
			return ((Long) crit.uniqueResult()).intValue();
		}
		return 0;
	}
	
	private int[] getYearlyBorrowedCount(String whichClass) {
		int[] weeklyResults = new int[12];
		LocalDate today = new LocalDate();
		LocalDate date = today.withDayOfYear(1);
		weeklyResults[0] = getBorrowedCountForSpecificMonth(date, whichClass);;
		weeklyResults[1] = getBorrowedCountForSpecificMonth(date.plusMonths(1), whichClass);;
		weeklyResults[2] = getBorrowedCountForSpecificMonth(date.plusMonths(2), whichClass);;
		weeklyResults[3] = getBorrowedCountForSpecificMonth(date.plusMonths(3), whichClass);;
		weeklyResults[4] = getBorrowedCountForSpecificMonth(date.plusMonths(4), whichClass);;
		weeklyResults[5] = getBorrowedCountForSpecificMonth(date.plusMonths(5), whichClass);;
		weeklyResults[6] = getBorrowedCountForSpecificMonth(date.plusMonths(6), whichClass);;
		weeklyResults[7] = getBorrowedCountForSpecificMonth(date.plusMonths(7), whichClass);;
		weeklyResults[8] = getBorrowedCountForSpecificMonth(date.plusMonths(8), whichClass);;
		weeklyResults[9] = getBorrowedCountForSpecificMonth(date.plusMonths(9), whichClass);;
		weeklyResults[10] = getBorrowedCountForSpecificMonth(date.plusMonths(10), whichClass);;
		weeklyResults[11] = getBorrowedCountForSpecificMonth(date.plusMonths(11), whichClass);;
		return weeklyResults;
	}

	private int getBorrowedCountForSpecificMonth(LocalDate date,String whichClass) {
		Criteria crit = null;
		if(whichClass.equalsIgnoreCase(GlobalConstants.EBOOK)){
			crit = getSession().createCriteria(BorrowedEBook.class);
			crit.add(Restrictions.ge("dateExpires", date));
			crit.add(Restrictions.le("dateExpires", date.plusMonths(1)));
			crit.setProjection(Projections.rowCount());
			return  ((Long)crit.uniqueResult()).intValue();
		}
		else if(whichClass.equalsIgnoreCase(GlobalConstants.AUDIOBOOK)){
			crit =  getSession().createCriteria(BorrowedAudioBook.class);
			crit.add(Restrictions.ge("dateExpires", date));
			crit.add(Restrictions.le("dateExpires", date.plusMonths(1)));
			crit.setProjection(Projections.rowCount());
			return ((Long) crit.uniqueResult()).intValue();
		}
		return 0;
	}
	

}
