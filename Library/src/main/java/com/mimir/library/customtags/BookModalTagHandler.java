package com.mimir.library.customtags;

import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.RegisteredUser;

public class BookModalTagHandler extends SimpleTagSupport {

	@Override
    public void doTag() throws JspException, IOException{
		
		JspWriter out = getJspContext().getOut();
		PageContext pc = (PageContext) getJspContext();  
        HttpSession session = (HttpSession) pc.getSession(); 	
		RegisteredUser user = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		
		if(user != null){
			out.println("<h4>Rating</h4>");
			out.println("<input onclick='rateBook()' id='input-21b' value='0' type='number' class='rating' min=0 max=5 step=0.5 data-symbol='&#xF379' data-default-caption='{rating} helmets' data-star-captions='{}' data-size='sm'>");
			out.println("<button onclick = 'borrowBook()' id='borrowBookButton' class='bg-primary btn-lg'>Borrow</button>");
			out.println("<button onclick= 'wishlistBook()' id = 'wishlistBookButton' class='bg-info btn-sm'>Wishlist</button>");
		}
		else{
			out.println("<button data-toggle='modal' data-target='#signInModal' data-dismiss='modal' class='bg-primary btn-lg'>Log In Or Register To Borrow Book</button>");
		}
		
    }
	
}
