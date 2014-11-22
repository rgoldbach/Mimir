function borrowBook(){
	
      var currentBook = $('#currentBook').val();
      var json = { 
    		  		"whichBook" : currentBook
    		  	};
      json = JSON.stringify(json);
      console.log(json); 
      $.ajax({
        url: "borrow?whichBook="+currentBook,
        data: json,
        type: "GET",
         
        beforeSend: function(xhr) {
            xhr.setRequestHeader("Accept", "application/json");
            xhr.setRequestHeader("Content-Type", "application/json");
        },
        complete: function(result) {
        	$('#borrowBookButton').prop('disabled', true);
        	$('#borrowBookButton').html("In Bookshelf");
        	console.log("TEST");
        }
    });	
}

function wishlistBook(){
	
    var currentBook = $('#currentBook').val();
    var json = { 
  		  		"whichBook" : currentBook
  		  	};
    json = JSON.stringify(json);
    console.log(json); 
    $.ajax({
      url: "wishlist?whichBook="+currentBook,
      data: json,
      type: "GET",
       
      beforeSend: function(xhr) {
          xhr.setRequestHeader("Accept", "application/json");
          xhr.setRequestHeader("Content-Type", "application/json");
      },
      complete: function(result) {
    	console.log(result);
    		$('#wishlistBookButton').prop('disabled', true);
          	$('#wishlistBookButton').html("In Wishlist");    	  
      
    	
      }
  });	
}

function waitlistBook(){
	
    var currentBook = $('#currentBook').val();
    var json = { 
  		  		"whichBook" : currentBook
  		  	};
    json = JSON.stringify(json);
    console.log(json); 
    $.ajax({
      url: "waitlist?whichBook="+currentBook,
      data: json,
      type: "GET",
       
      beforeSend: function(xhr) {
          xhr.setRequestHeader("Accept", "application/json");
          xhr.setRequestHeader("Content-Type", "application/json");
      },
      success: function() {
                   
      }
  });	
}

function rateBook(){
	
    var currentBook = $('#currentBook').val();
    var rating = $('#input-21b').val;
    var json = { 
  		  		"whichBook" : currentBook
  		  	};
    json = JSON.stringify(json);
    console.log(json); 
    $.ajax({
      url: "rate?whichBook="+currentBook+"&rating="+rating,
      data: json,
      type: "GET",
       
      beforeSend: function(xhr) {
          xhr.setRequestHeader("Accept", "application/json");
          xhr.setRequestHeader("Content-Type", "application/json");
      },
      success: function() {
                   
      }
  });	
}

function signInOrOut() {
	
    var url = $('.determineRole').attr('name');
    var json = "";
    if(url ===  "signin"){
    	json = {
                "email" : $('#email').val(),
                "password" : $('#password').val()
        };
    }
    else{
    	json = "";
    }
    $.ajax({
        headers: { 
            'Accept': 'application/json',
            'Content-Type': 'application/json' 
        },
        'url' : url,
        'data' : JSON.stringify(json),
        'type' : "POST",
        'complete' : function(result) {
        	if(result.status === 200){
        		if(result.responseText === "signoutsuccess"){
        			window.location.replace("/Library/");
        		}
        		else if(result.responseText === "signinfailure"){
        			$('#signInError').text("Invalid login information. Please try again.");
        		}
        		else if(result.responseText === "admin"){
        			window.location.replace("/Library/admin/");
        		}
        		else{
        			location.reload();  
        		}
        		
        	}              	              	
        }
    });  
    return false;
}

function returnBook(whichBook){
	console.log(whichBook);
	json = "";
	$.ajax({
	      url: "return?whichBook="+whichBook,
	      data: json,
	      type: "GET",
	       
	      beforeSend: function(xhr) {
	          xhr.setRequestHeader("Accept", "application/json");
	          xhr.setRequestHeader("Content-Type", "application/json");
	      },
	      complete: function(result) {
	    	//removes book gui	 
	    	// if successful
	    	$('#bookshelfBook'+whichBook).remove();

	      }
	  });	
}

function removeFromWishlist(whichBook){
	console.log(whichBook);
	json = "";
	$.ajax({
	      url: "removeFromWishlist?whichBook="+whichBook,
	      data: json,
	      type: "GET",
	       
	      beforeSend: function(xhr) {
	          xhr.setRequestHeader("Accept", "application/json");
	          xhr.setRequestHeader("Content-Type", "application/json");
	      },
	      complete: function(result) {
	    	//removes book gui	
	    	//if successful
	    	 console.log("wishlistBook"+whichBook);
	    	$('#wishlistBook'+whichBook).remove();
	      }
	  });	
	
	
}