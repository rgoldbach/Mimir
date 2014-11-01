package com.mimir.library.customtags;

import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.RegisteredUser;

public class SignInTagHandler  extends SimpleTagSupport {

	@Override
    public void doTag() throws JspException, IOException{
		
		JspWriter out = getJspContext().getOut();
		PageContext pc = (PageContext) getJspContext();  
        HttpSession session = (HttpSession) pc.getSession(); 	
		RegisteredUser user = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		
		if(user != null){
			out.println("<li><a href='account'>My Account</a></li>");
			out.println("<li><a class='determineRole' name='signout' href='#'>Sign Out</a></li>");
			out.println("<li><a href='#' data-toggle='modal' data-target='#helpModal'>Help</a></li>");
		}
		else{
			out.println("<li><a href='#' data-toggle='modal' data-target='#signInModal'>Sign In</a></li>");
			out.println("<li><a href='#' data-toggle='modal' data-target='#registerModal'>Register</a></li>");
			out.println("<li><a href='#' data-toggle='modal' data-target='#helpModal'>Help</a></li>");
		}
		
    }
	
}
