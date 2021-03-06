function bookModal(id, type){
	var url = "bookModalTest?whichBook="+id+"&bookFormat="+type;
	var json = {
			"whichBook" : id,
			"bookFormat" : type
	}
	
	json = JSON.stringify(json)
	$.ajax({
        url: url,
        data: json,
        type: "GET",
         
        beforeSend: function(xhr) {
            xhr.setRequestHeader("Accept", "application/json");
            xhr.setRequestHeader("Content-Type", "application/json");
        },
        complete: function(result) {
        	if(result.status === 200){
        	    $('#bookModal').modal('show');
        	    var book = result.responseJSON;
        	    console.log(book);
        	    $('#bookModalImage').html( "<img class='img-responsive' src='"+book.imageFilePath+"'  alt=''>");
        	    $('#bookModalTitle').html(book.title);
        	    $('#bookModalDescription').html(book.description);
        	    $('#bookModalPublisher').html(book.publisher);
        	    $('#bookModalPublisher').attr('href','search?query='+book.publisher);
        	    $('#currentBook').val(book.id);
        	    $('#borrowedBookFormat').val(book.type);
        	    $('#bookModalISBN').html('ISBN: ' + book.isbn + '<span id = "bookModalGenre" style="float: right"> Genres: </span>');
        
        	    $('#bookModalAuthor').html('by <span id = "bookModalFormat" style="float: right"> Available Languages: </span>')
        	    for(author in book.authors){
        	    	$('#bookModalAuthor').append("<a href ='search?query="+book.authors[author]+"']>"+book.authors[author]+"   </a>");
        	    }
        	    $('#bookModalFormat').html('Available Formats: ')
        	    for (format in book.formatTypes){
        	    	$('#bookModalFormat').append("<a href = 'search?query="+book.formatTypes[format]+"'>"+book.formatTypes[format]+"   </a>");
        	    }
        	    $('#bookModalLangauge').html('Available Languages: ')
        	    for (i in book.languages){
        	    	$('#bookModalLangauge').append("<a href = 'search?query="+book.languages[i]+"'>"+book.languages[i]+"   </a>");

        	    }
        	    for (i in book.genres){
        	    	$('#bookModalGenre').append("<a href = 'search?query="+book.genres[i]+"'>"+book.genres[i]+"    </a>")
        	    }
        	    $("#bookModalControls").html('');
        	    $("#bookModalControlsTwo").html('');
        	    $("#bookModalControls").append("<h4>User Rating</h4>");
    	    	//$("#bookModalControls").append("<input onclick='rateBook()' id='input-21b' value='" + book.rating + "' type='number' class='rating' min=0 max=5 step=0.5 data-symbol='&#xF379' data-default-caption='{rating} helmets' data-star-captions='{}' data-size='sm'>");
    	    	$("#bookModalControls").append("<input id='input-21' value='"+book.rating+"' type='number' class='rating' min=0 max=5 step=0.5 data-symbol='&#xF379' disabled = 'true' data-default-caption='{rating} helmets' data-star-captions='{}' data-size='sm'>");
    	    	$("#input-21").rating();
        	    if(book.loggedIn){
        	    	
        	    	if(book.available){
            	    	$("#bookModalImage").append("<br>");
        	    		if(book.inBookshelf){
                	    	$("#bookModalImage").append("<button onclick = 'borrowBook()' disabled = 'disabled' id='borrowBookButton' class='bg-primary btn-lg'>In Bookshelf</button>");
        	    		}
                	    else{
                	    	$("#bookModalImage").append("<button onclick = 'borrowBook()' id='borrowBookButton' class='bg-primary btn-lg'>Borrow</button>");
                	    }
        	    	}
        	    	else{
            	    	$("#bookModalImage").append("<button onclick = 'holdBook()' id='holdBookButton' class='bg-primary btn-lg'>Hold</button>");
        	    	}
        	    	if(book.inWishlist){
            	    	$("#bookModalImage").append("<button onclick= 'wishlistBook()' disabled = 'disabled' id = 'wishlistBookButton' class='bg-info btn-sm'>In Wishlist</button>");
        	    	}
        	    	else{
            	    	$("#bookModalImage").append("<button onclick= 'wishlistBook()' id = 'wishlistBookButton' class='bg-info btn-sm'>Wishlist</button>");
        	    	}
                	    	
        	    	
        	    
        	    }
        	}
        }
    });
}  

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
    var bookFormat = $('#borrowedBookFormat').val();
    var json = { 
  		  		"whichBook" : currentBook
  		  	};
    json = JSON.stringify(json);
    console.log(json); 
    $.ajax({
      url: "wishlist?whichBook="+currentBook+"&bookFormat="+bookFormat,
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
        			window.location.replace("/Library/admin");
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
	
	swal({   title: "Are you sure you want to return this book?",   
		text: "You still have time remaining.",   
		type: "warning",   
		showCancelButton: true,   
		confirmButtonColor: "#DD6B55",   
		confirmButtonText: "Yes, return it.",   
		closeOnConfirm: false }, 
		function(){    
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
		    	    		$('#bookshelf'+bookFormat+''+whichBook).remove();
		    	    		console.log($('#recentlyAddedFormat'+bookFormat+''+whichBook).text());
		    	    		console.log(bookFormat);
		    	    		if($('#recentlyAddedFormat'+bookFormat+''+whichBook).text() == bookFormat){
		    	    			$('#recentlyAdded'+bookFormat+''+whichBook).remove();
		    	    			var a = parseInt($('#recentlyAddedSize').text()) - 1;
		    	    			$('#recentlyAddedSize').text(a);
		    	    			changeRecentlyAddedSizeColor();
		    	    		}
		    	    		swal("Book Returned", "", "success");
		    	    	}
		        		
		        	} 
		        	else{
		        		swal("There was a problem on our end.", "Just keep the book for now.", "error");
		        	}
		        }
			  });	
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

function removeFromWishlist(whichBook, bookFormat){
	if(!confirm("Are you sure you want to delete this from your wishlist?")){
		return;
	}
	console.log(whichBook);
	$.ajax({
	      url: "removeFromWishlist?whichBook="+whichBook+"&bookFormat="+bookFormat,
	      type: "GET",
	       
	      beforeSend: function(xhr) {
	          xhr.setRequestHeader("Accept", "application/json");
	          xhr.setRequestHeader("Content-Type", "application/json");
	      },
	      complete: function(result) {
	    	 console.log('#wishlist'+bookFormat+''+whichBook);
	    	 if(result.responseText == "Success"){
		    	 $('#wishlist'+bookFormat+''+whichBook).remove(); 
	    	 }
	    	 else{
	    		 alert(result.responseText);
	    	 }
	      }
	  });	
	
	
}
function holdBook(whichBook, bookFormat){
	var currentBook = $('#currentBook').val();
    var bookFormat = $('#borrowedBookFormat').val();
	console.log(whichBook);
	json = "";
	$.ajax({
		headers: { 
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        'url' : "holdBook?whichBook="+currentBook+"&bookFormat="+bookFormat,
        'type' : "GET",
        'complete' : function(result) {
        	if(result.status === 200){
    			if(result.responseText == "Success"){
    				$('#holdBookButton').prop('disabled', true);
    	        	$('#holdBookButton').html("Book On Hold");
    			}
        			
        	}              	              	
        }
	  });	
}
function removeHold(whichBook, bookFormat){
	if(!confirm("Are you sure you want to delete this hold?")){
		return;
	}
	console.log(whichBook);
	json = "";
	$.ajax({
		headers: { 
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        'url' : "removeFromHolds?whichBook="+whichBook+"&bookFormat="+bookFormat,
        'type' : "GET",
        'complete' : function(result) {
        	if(result.status === 200){
        			if(result.responseText == "Success"){
    	    			$('#pending'+bookFormat+''+whichBook).remove();	
        			}
        			else if(result.responseText == "library/error"){
        				window.location.replace("/library/error");
        			}
        			else{
        				alert("Error: " + result.responseText);
        			}
        	}              	              	
        }
	  });	
}

function changeUserInfo() {
    var controller = true;
    var firstName = $('#changeFirstName').val();
    var lastName = $('#changeLastName').val();
    var email = $('#changeEmail').val();
	var oldEmail =  $('#oldemail').val();
    console.log(oldEmail);
    if(lastName === ''){
    	controller = false;
		$('#changeInfoError').text("Last Name Cannot Be Empty");
		
    }
    if(firstName === ''){
    	controller = false;
		$('#changeInfoError').text("First Name Cannot Be Empty");
		
    }
    if(email === ''){
    	controller = false;
		$('#changeInfoError').text("Email Cannot Be Empty");
		
    }
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if (! re.test(email)){
		controller = false;
		$('#changeInfoError').text("Not A Valid Email");

	}
	var url = "changeUserInfo";
    var json = "";
    json = {
                "libraryCardNumber" : $('#changeLibraryCardNumber').val(),
                "firstName" : $('#changeFirstName').val(),
                "lastName" : $('#changeLastName').val(),
                "email" : $('#changeEmail').val(),
                "currentPassword": $('#changeCurrentPassword').val(),
                "password" : $('#changePassword').val(),
                "passwordConfirm" : $('#changePasswordConfirm').val(),
                "oldEmail" : oldEmail
    };
    if(controller){
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
            		else if (result.responseText === "email"){
            			$('#changeInfoError').text("The Email You Entered Is Already In Use");
            			$('#changeCurrentPassword').val("");
            		}
            		else{	
	    	    		swal("Success", "Information Updated", "success");
            			$('#changeInfoError').text("");
            			$('#changeCurrentPassword').val("");
            			$('#oldemail').val($('#changeEmail').val());
            		}
            	}

            }
        });
    }
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
	$('#regerror').text("");
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
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if (! re.test($('#emailReg').val()))
		validation = false;
	console.log("idk " +  validation)
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
					else if(result.responseText === "email"){
						$('#regerror').text("That Email Is Already In Use.");
					}
					
					else if(result.responseText === "card"){
						$('#regerror').text("That Library Card Number Is Already In Use.");
					}
					else{
						$('#regerror').text("There Was An Unexpected Error");

					}
				}
				return false;

			}
		});  
		return false;	
	}
}
