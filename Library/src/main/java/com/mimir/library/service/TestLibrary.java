package com.mimir.library.service;

import java.util.ArrayList;

import com.mimir.library.model.Author;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookDisplayableInformation;

/**
 * Holds dummy data until book persistance service is done and book data is loaded into the db
 * @author Jesse
 *
 */
public class TestLibrary {

	private ArrayList<Book> library;
	private Book goneGirl;
	private Book faultInOurStars;
	private Book gameOfThrones;
	private Book theGiver;
	private Book divergent;
	private Book harryPotter;
	private Book unlucky13;
	private Book topSecret;
	private Book lasVegas;
	
	public TestLibrary(){
		//instatiates test books
		library = new ArrayList<Book>();
		//gonegirl
		goneGirl = new Book();
		BookDisplayableInformation goneGirldbi = new BookDisplayableInformation();
		goneGirl.setBookId(1);
		ArrayList<Author> goneGirlAuth = new ArrayList<Author>();
		Author gillian = new Author();
		gillian.setName("Gillian Flynn");
		goneGirlAuth.add(gillian);
		goneGirl.setAuthors(goneGirlAuth);
		goneGirldbi.setTitle("Gone Girl");
		goneGirldbi.setDescription("Marriage can be a real killer. One of the most critically acclaimed suspense writers of our time, New York Times bestseller Gillian Flynn takes that statement to its darkest place in this unputdownable masterpiece about a marriage gone terribly, terribly wrong. The Chicago Tribune proclaimed that her work “draws you in and keeps you reading with the force of a pure but nasty addiction.” Gone Girl’s toxic mix of sharp-edged wit and deliciously chilling prose creates a nerve-fraying thriller that confounds you at every turn. On a warm summer morning in North Carthage, Missouri, it is Nick and Amy Dunne’s fifth wedding anniversary. Presents are being wrapped and reservations are being m");
		goneGirldbi.setImageFilePath("resources/img/TestImg8.jpg");
		goneGirldbi.setBookDisplayId(1);
		goneGirl.setBookDisplay(goneGirldbi);
		library.add(goneGirl);
		//faultInOurStars
		faultInOurStars = new Book();
		BookDisplayableInformation faultInOurStarsdbi = new BookDisplayableInformation();
		faultInOurStars.setBookId(2);
		ArrayList<Author> faultInOurStarsAuth = new ArrayList<Author>();
		Author green = new Author();
		green.setName("John Green");
		faultInOurStarsAuth.add(green);
		faultInOurStars.setAuthors(faultInOurStarsAuth);
		faultInOurStarsdbi.setTitle("The Fault In Our Stars");
		faultInOurStarsdbi.setDescription("Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters suddenly appears at Cancer Kid Support Group, Hazel’s story is about to be completely rewritten.");
		faultInOurStarsdbi.setImageFilePath("resources/img/TestImg7.jpg");
		faultInOurStarsdbi.setBookDisplayId(2);
		faultInOurStars.setBookDisplay(faultInOurStarsdbi);
		library.add(faultInOurStars);
		//gameOfThrones
		gameOfThrones = new Book();
		BookDisplayableInformation gameOfThronesdbi = new BookDisplayableInformation();
		gameOfThrones.setBookId(3);
		ArrayList<Author> gameOfThronesAuth = new ArrayList<Author>();
		Author martin = new Author();
		martin.setName("George R.R. Martin");
		gameOfThronesAuth.add(martin);
		gameOfThrones.setAuthors(gameOfThronesAuth);
		gameOfThronesdbi.setTitle("Game of Thrones");
		gameOfThronesdbi.setDescription("Long ago, in a time forgotten, a preternatural event threw the seasons out of balance. In a land where summers can last decades and winters a lifetime, trouble is brewing. The cold is returning, and in the frozen wastes to the north of Winterfell, sinister and supernatural forces are massing beyond the kingdom’s protective Wall. At the center of the conflict lie the Starks of Winterfell, a family as harsh and unyielding as the land they were born to. Sweeping from a land of brutal cold to a distant summertime kingdom of epicurean plenty, here is a tale of lords and ladies, soldiers and sorcerers, assassins and bastards, who come together in a time of grim omens.");
		gameOfThronesdbi.setImageFilePath("resources/img/TestImg3.jpg");
		gameOfThronesdbi.setBookDisplayId(3);
		gameOfThrones.setBookDisplay(gameOfThronesdbi);
		library.add(gameOfThrones);
		
		theGiver = new Book();
		BookDisplayableInformation theGiverdbi = new BookDisplayableInformation();
		theGiver.setBookId(4);
		ArrayList<Author> theGiverAuth = new ArrayList<Author>();
		Author lowry = new Author();
		lowry.setName("Lois Lowry");
		theGiverAuth.add(lowry);
		theGiver.setAuthors(theGiverAuth);
		theGiverdbi.setTitle("The Giver");
		theGiverdbi.setDescription("Soon to be a major motion picture, The Giver, the 1994 Newbery Medal winner, has become one of the most influential novels of our time. The haunting story centers on twelve-year-old Jonas, who lives in a seemingly ideal, if colorless, world of conformity and contentment. Not until he is given his life assignment as the Receiver of Memory does he begin to understand the dark, complex secrets behind his fragile community. Lois Lowry has written three companion novels to The Giver, including Gathering Blue, Messenger, and Son.");
		theGiverdbi.setImageFilePath("resources/img/TestImg2.jpg");
		theGiverdbi.setBookDisplayId(4);
		theGiver.setBookDisplay(theGiverdbi);
		library.add(theGiver);
		
		divergent = new Book();
		BookDisplayableInformation divergentdbi = new BookDisplayableInformation();
		divergent.setBookId(5);
		ArrayList<Author> divergentAuth = new ArrayList<Author>();
		Author roth = new Author();
		roth.setName("Veronica Roth");
		divergentAuth.add(roth);
		divergent.setAuthors(divergentAuth);
		divergentdbi.setTitle("Divergent");
		divergentdbi.setDescription("This first book in Veronica Roth's #1 New York Times bestselling Divergent trilogy is the novel that inspired the major motion picture starring Shailene Woodley, Theo James, and Kate Winslet. This dystopian series set in a futuristic Chicago has captured the hearts of millions of teen and adult readers. Perfect for fans of the Hunger Games and Maze Runner series, Divergent and its sequels, Insurgent and Allegiant—plus Four: A Divergent Collection, four stories told from the perspective of the character Tobias—are the gripping story of a dystopian world transformed by courage, self-sacrifice, and love. Fans of the Divergent movie will find the book packed with just as much emotional depth and exhilarating action as the film, all told in beautiful, rich language.");
		divergentdbi.setImageFilePath("resources/img/TestImg9.jpg");
		divergentdbi.setBookDisplayId(5);
		divergent.setBookDisplay(divergentdbi);
		library.add(divergent);
		
		harryPotter = new Book();
		BookDisplayableInformation harryPotterdbi = new BookDisplayableInformation();
		harryPotter.setBookId(6);
		ArrayList<Author> harryPotterAuth = new ArrayList<Author>();
		Author rolling = new Author();
		rolling.setName("J.K. Rolling");
		harryPotterAuth.add(rolling);
		harryPotter.setAuthors(harryPotterAuth);
		harryPotterdbi.setTitle("Harry Potter and the Sorcerer's Stone");
		harryPotterdbi.setDescription("Harry Potter has never played a sport while flying on a broomstick. He's never worn a cloak of invisibility, befriended a giant, or helped hatch a dragon. All Harry knows is a miserable life with the Dursleys, his horrible aunt and uncle, and their abominable son, Dudley. Harry's room is a tiny closet at the foot of the stairs, and he hasn't had a birthday party in eleven years.But all that is about to change when a mysterious letter arrives by owl messenger: a letter with an invitation to a wonderful place he never dreamed existed. There he finds not only friends, aerial sports, and magic around every corner, but a great destiny that's been waiting for him...if Harry can survive the encounter.");
		harryPotterdbi.setImageFilePath("resources/img/TestImg4.jpg");
		harryPotterdbi.setBookDisplayId(6);
		harryPotter.setBookDisplay(harryPotterdbi);
		library.add(harryPotter);
		
		unlucky13 = new Book();
		BookDisplayableInformation unlucky13dbi = new BookDisplayableInformation();
		unlucky13.setBookId(7);
		ArrayList<Author> unlucky13Auth = new ArrayList<Author>();
		Author patterson= new Author();
		patterson.setName("James Patterson");
		unlucky13Auth.add(patterson);
		unlucky13.setAuthors(unlucky13Auth);
		unlucky13dbi.setTitle("Unlucky 13");
		unlucky13dbi.setDescription("San Francisco Detective Lindsay Boxer is loving her life as a new mother. With an attentive husband, a job she loves, plus best friends who can talk about anything from sex to murder, things couldn't be better. Then the FBI sends Lindsay a photo of a killer from her past, and her happy world is shattered. The picture captures a beautiful woman at a stoplight. But all Lindsay sees is the psychopath behind those seductive eyes: Mackie Morales, the most deranged and dangerous mind the Women's Murder Club has ever encountered.");
		unlucky13dbi.setImageFilePath("resources/img/TestAudioImg4.jpg");
		unlucky13dbi.setBookDisplayId(7);
		unlucky13.setBookDisplay(unlucky13dbi);
		library.add(unlucky13);
		
		
	
	}
	
	public Book getBookById(int id){
		return library.get(id-1);
	}
	
	public Book getGoneGirl() {
		return goneGirl;
	}

	public Book getFaultInOurStars() {
		return faultInOurStars;
	}

	public Book getGameOfThrones() {
		return gameOfThrones;
	}

	public Book getTheGiver() {
		return theGiver;
	}

	public Book getDivergent() {
		return divergent;
	}

	public Book getHarryPotter() {
		return harryPotter;
	}

	public Book getUnlucky13() {
		return unlucky13;
	}

	public Book getTopSecret() {
		return topSecret;
	}

	public Book getLasVegas() {
		return lasVegas;
	}

	public ArrayList<BookDisplayableInformation> getNewBooks(){
		ArrayList<BookDisplayableInformation> newBooks = new ArrayList<BookDisplayableInformation>();
		newBooks.add(gameOfThrones.getBookDisplay());
		newBooks.add(faultInOurStars.getBookDisplay());
		newBooks.add(goneGirl.getBookDisplay());
		newBooks.add(theGiver.getBookDisplay());
		newBooks.add(divergent.getBookDisplay());
		newBooks.add(harryPotter.getBookDisplay());
		newBooks.add(unlucky13.getBookDisplay());
		newBooks.add(faultInOurStars.getBookDisplay());
	
		return newBooks;
	}
	
	public ArrayList<BookDisplayableInformation> getTopBooks(){
		ArrayList<BookDisplayableInformation> topBooks = new ArrayList<BookDisplayableInformation>();
		topBooks.add(divergent.getBookDisplay());
		topBooks.add(harryPotter.getBookDisplay());
		topBooks.add(unlucky13.getBookDisplay());
		topBooks.add(faultInOurStars.getBookDisplay());
		topBooks.add(goneGirl.getBookDisplay());
		topBooks.add(theGiver.getBookDisplay());
		topBooks.add(faultInOurStars.getBookDisplay());
		topBooks.add(gameOfThrones.getBookDisplay());
	
		return topBooks;
	}
	
	public ArrayList<BookDisplayableInformation> getReccomendedBooks(){
		ArrayList<BookDisplayableInformation> newBooks = new ArrayList<BookDisplayableInformation>();
		
		return newBooks;
	}
	
	public ArrayList<BookDisplayableInformation> getNewAudioBooks(){
		ArrayList<BookDisplayableInformation> newBooks = new ArrayList<BookDisplayableInformation>();
		
		return newBooks;
	}
	
	public ArrayList<BookDisplayableInformation> getTopAudioBooks(){
		ArrayList<BookDisplayableInformation> newBooks = new ArrayList<BookDisplayableInformation>();
		
		return newBooks;
	}
	
}
