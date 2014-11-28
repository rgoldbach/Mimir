  function borrowBook(){
  	
        var currentBook = $('#currentBook').val();
        var bookFormat = $('#borrowedBookFormat').val();
        var json = { 
    		  		"whichBook" : currentBook,
    		  		"bookFormat" : bookFormat
    		  	};
      json = JSON.stringify(json);
      console.log(json); 
      $.ajax({
        url: "borrow?whichBook="+currentBook+"&bookFormat="+bookFormat,
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

function returnBook(whichBook, bookFormat){
	if(!confirm("Are you sure you want to return this book?")){
		return;
	}
	console.log(whichBook);
	json = "";
	$.ajax({
		headers: { 
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        'url' : "return?whichBook="+whichBook+"&bookFormat="+bookFormat,
        'type' : "GET",
        'complete' : function(result) {
        	if(result.status === 200){
        		console.log(result.status);
    	    	if(result.status == 200){
    	    		$('#bookshelfBook'+whichBook).remove();
    	    	}
        		
        	}              	              	
        }
	  });	
}

function downloadBook(whichBook, bookFormat){
	console.log(whichBook);
	json = "";
	$.ajax({
		headers: { 
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        'url' : "download?whichBook="+whichBook+"&bookFormat="+bookFormat,
        'type' : "GET",
        'complete' : function(result) {
        	if(result.status === 200 && result.responseText != "Error"){
        		console.log(result.status);	
        		window.location.href = result.responseText;
        	}              	              	
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

function changeUserInfo() {
    var url = "changeUserInfo";
    var json = "";
    json = {
                "libraryCardNumber" : $('#changeLibraryCardNumber').val(),
                "firstName" : $('#changeFirstName').val(),
                "lastName" : $('#changeLastName').val(),
                "email" : $('#changeEmail').val(),
                "currentPassword": $('#changeCurrentPassword').val(),
                "password" : $('#changePassword').val(),
                "passwordConfirm" : $('#changePasswordConfirm').val()
    };
    $.ajax({
        headers: { 
            'Accept': 'application/json',
            'Content-Type': 'application/json' 
        },
        'url' : url,
        'data' : JSON.stringify(json),
        'type' : "POST",
        'complete' : function(result) {
        	console.log(result);
        	if(result.status === 200){
        		if(result.responseText === "failure"){
        			$('#changeInfoError').text("The New Passwords Did Not Match");
        			$('#changeCurrentPassword').val("");
        		}
        		else if(result.responseText === "invalid"){
        			$('#changeInfoError').text("Please Enter Your Correct Current Password");
        			$('#changeCurrentPassword').val("");
        		}
        		else{	
        			$('#changeInfoError').text("Info Successfuly Changed");
        			$('#changeCurrentPassword').val("");
        		}
        	}

        }
    });  
    return false;
}

function changeBookFormatInfo() {
	
	var currentBook = $('#currentBook').val();
    var whichFormat = $('#borrowedBookFormat').val();

    $.ajax({
        headers: { 
            'Accept': 'application/json',
            'Content-Type': 'application/json' 
        },
        'url' : "changeBookFormatInfo?whichBook="+currentBook+"&bookFormat=" + whichFormat,
        'type' : "GET",
        'complete' : function(result) {
        	if(result.status === 200){
        		var json = result.responseText;
        		console.log(json);
        		obj = JSON.parse(json);
        		console.log(obj.remainingCopies);
        		console.log(obj.formats.length);
        		console.log(obj.languages[0]);
        		if(result.responseText === "signoutsuccess"){
        			window.location.replace("/Library/");
        		}
        		else if(result.responseText === "signinfailure"){
        			$('#signInError').text("Invalid login information. Please try again.");
        		}
        		else if(result.responseText === "admin"){
        			window.location.replace("/Library/admin/");
        		}
        		
        	}              	              	
        }
    });  
    return false;
}

function registerUser(){
	validation = true
	var libraryCardNumber = $('#libraryCardNumberReg').val()
	var firstName = $('#firstNameReg').val()
	var lastName =  $('#lastNameReg').val()
	var password = $('#passwordReg').val()
	var confirmPass = $('#passwordConfirmReg').val()
	if(libraryCardNumber.length != 9)
		validation = false
	if(password !== confirmPass)
		validation = false
	if(! /^\d+$/.test(libraryCardNumber))
		validation = false
	if(lastName === "")
		validation = false
	if (firstName === "")
		validation = false
	console.log(/^\d+$/.test(libraryCardNumber))
	console.log(validation)
	console.log(password)	
	console.log(confirmPass)
	var url = "register";
	var json = "";
	json = {
			"libraryCardNumber" : $('#libraryCardNumberReg').val(),
	        "firstName" : $('#firstNameReg').val(),
	        "lastName" : $('#lastNameReg').val(),
	        "email" : $('#emailReg').val(),
	        "password" : password,
	};
	if(validation){
		$.ajax({
			headers: { 
				'Accept': 'application/json',
				'Content-Type': 'application/json' 
			},
			'url' : url,
			'data' : JSON.stringify(json),
			'type' : "POST",
			'complete' : function(result) {
				console.log(result);
				if(result.status === 200){
					if(result.responseText === "success"){
						window.location.replace("/Library/");
					}
				}
				return false;

			}
		});  
		return false;	
	}
}
