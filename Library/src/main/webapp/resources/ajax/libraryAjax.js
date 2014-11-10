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
        success: function() {
                     
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
      success: function() {
                   
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