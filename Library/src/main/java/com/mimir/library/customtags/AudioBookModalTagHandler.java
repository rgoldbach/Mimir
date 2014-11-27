package com.mimir.library.customtags;

import java.io.IOException;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AudioBook;
import com.mimir.library.model.Book;
import com.mimir.library.model.BorrowedAudioBook;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.model.WishlistAudioBook;

public class AudioBookModalTagHandler extends SimpleTagSupport {

	@Override
    public void doTag() throws JspException, IOException{
		
		JspWriter out = getJspContext().getOut();
		PageContext pc = (PageContext) getJspContext();  
        HttpSession session = (HttpSession) pc.getSession(); 	
		RegisteredUser user = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		
		

		if(false){
			Set<BorrowedAudioBook> bookshelf = user.getBorrowedAudioBooks();
			Set<WishlistAudioBook> wishlistBooks = user.getWishlistAudioBooks();
			Book currentBook = (Book)session.getAttribute("viewBook");
			AudioBook currentAudioBook = currentBook.getAudioBook();
			boolean inBookshelf = false;
			boolean inWishlist = false;
			for(BorrowedAudioBook testBook : bookshelf){
				if(testBook.getAudioBook().getBook().getBookId() == currentBook.getBookId())
					inBookshelf = true;
			}
			for(WishlistAudioBook testBook : wishlistBooks){
				if(testBook.getAudioBook().getBook().getBookId() == currentBook.getBookId())
					inWishlist = true;
			}
			/*
			out.println("<h4>Choose Format:</h4>");
			out.println("<div class='col-md-6'>");
			out.println("<select id='borrowedBookFormat' onchange='changeBookFormatInfo()' class='form-control' data-width='100%'>");
			if(currentBook.getEBook() != null)
				out.println("<option selected='selected' value='EBook'>EBook</option>");
      		if(currentBook.getAudioBook() != null){
    			out.println("<option value='AudioBook'>AudioBook</option>");	
      		}
      		out.println("</select>");
			out.println("</div><br/><br/>");
			*/
			out.println("<h4>Rating</h4>");
			out.println("<input onclick='rateBook()' id='input-21b' value='" + currentAudioBook.getBookRating().getRating() + "' type='number' class='rating' min=0 max=5 step=0.5 data-symbol='&#xF379' data-default-caption='{rating} helmets' data-star-captions='{}' data-size='sm'>");
			if(inBookshelf){
				out.println("<button onclick = 'borrowBook()' disabled = 'disabled' id='borrowBookButton' class='bg-primary btn-lg'>In Bookshelf</button>");
			}
			else
				if(currentAudioBook.getRemainingCopies()==0)
					out.println("<button onclick = 'holdBook()' id='holdBookButton' class='bg-primary btn-lg'>Hold</button>");
				else
					out.println("<button onclick = 'borrowBook()' id='borrowBookButton' class='bg-primary btn-lg'>Borrow</button>");
			if(inWishlist)
				out.println("<button onclick= 'wishlistBook()' disabled = 'disabled' id = 'wishlistBookButton' class='bg-info btn-sm'>In Wishlist</button>");
			else
				out.println("<button onclick= 'wishlistBook()' id = 'wishlistBookButton' class='bg-info btn-sm'>Wishlist</button>");
		}
		else{
			out.println("<button data-toggle='modal' data-target='#signInModal' data-dismiss='modal' disabled = 'disabled' class='bg-primary btn-lg'>Log In Or Register To Borrow Book</button>");
		}
		
    }
	
}
