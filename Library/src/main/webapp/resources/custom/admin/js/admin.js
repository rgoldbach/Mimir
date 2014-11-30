$(function() {

    $('#side-menu').metisMenu();

});

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
$(function() {
    $(window).bind("load resize", function() {
        topOffset = 50;
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.navbar-collapse').addClass('collapse')
            topOffset = 100; // 2-row-menu
        } else {
            $('div.navbar-collapse').removeClass('collapse')
        }

        height = (this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height;
        height = height - topOffset;
        if (height < 1) height = 1;
        if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height) + "px");
        }
    })
});


function getUser(){
	var id = $('#adminLibraryCard').val();
     
    
	$.ajax({
		url: "getUserAdmin?number="+id,
		type: "GET",
      
		beforeSend: function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
     },
     complete: function(result) {
    	 if(result.status === 200){
    		 
    		 var user = result.responseJSON
    		 if(user.libraryCardNumber ===""){
        		 sweetAlert("Oops...", "User Could Not Be Found, Are You Sure That Was The Right Library Card Number", "error");
    		 }
    		 else{
    			 $('#userLibraryCard').val(user.libraryCardNumber);
    		 	$('#userEmail').val(user.email);
    		 	$('#userFirstName').val(user.firstName);
    		 	$('#userLastName').val(user.lastName);
    		 	$('#userPassword').val(user.password);
    		 	$('#userlookuperror').text("");
    		 	$('#myModal').modal('show');
    		 }
    	}
    	 else{
    		 sweetAlert("Oops...", "User Could Not Be Found, Are You Sure That Was The Right Library Card Number", "error");
    	 }
    	 console.log(result);
     }
 });	
}

function saveUserChanges(){
	var controller = true;
	var libraryCardNumber = $('#userLibraryCard').val();
	if(libraryCardNumber.length != 9){
		controller = false;
		$('#userChangeError').text("Library Card Must Be 9 Digits Long");
	}
	if(! /^\d+$/.test(libraryCardNumber)){
		controller = false	
		$('#userChangeError').text("Library Card Can Only Contain Digits");
	}
	if($('#userFirstName').val() === ""){
		controller = false
		$('#userChangeError').text("First Name Cannot Be Blank");

	}
	if ($('#userLastName').val() === ""){
		controller = false
		$('#userChangeError').text("Last Name Cannot Be Blank");
	}
	if ($('#userEmail').val() === ""){
		controller = false
		$('#userChangeError').text("Email Cannot Be Blank");

	}
	if ($('#userPassword').val() === ""){
		controller = false
		$('#userChangeError').text("Password Cannot Be Blank");

	}
				
	var url = "editUserAdmin";
    var json = "";
    json = {
                "libraryCardNumber" : $('#userLibraryCard').val(),
                "firstName" : $('#userFirstName').val(),
                "lastName" : $('#userLastName').val(),
                "email" : $('#userEmail').val(),
                "currentPassword": $('#userPassword').val(),
                "password" : $('#userPassword').val(),
                "passwordConfirm" : $('#userPassword').val()
    };
    console.log(json)
    
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
        				$('#userlookuperror').text("");
        				$('#myModal').modal('hide');
        				swal("Success",  $('#userFirstName').val() + "'s Account Successfully Updated.", "success")
        			
        		}

        	}
    	}); 
    }
    return false;
}

function banUser(){
	$('#myModal').modal('hide');
	var libraryCardNum = $('#userLibraryCard').val();
	var url = "banUser";
	swal({   title: "Are you sure you want to remove this account?",   
		text: "This will remove the user account forever.",   
		type: "warning",   
		showCancelButton: true,   
		confirmButtonColor: "#DD6B55",   
		confirmButtonText: "Yep",   
		closeOnConfirm: false }, 
		function(){    
			$.ajax({
		    	headers: { 
		        	'Accept': 'application/json',
		        	'Content-Type': 'application/json' 
		    	},
		    	'url' : "banUser?libraryCard="+libraryCardNum,
		    	'type' : "GET",
		    	'complete' : function(result) {
		    		console.log(result);
		    		if(result.status === 200){	
		    			swal("Account Removed", "", "success");
		    			
		    		}

		    	}
			}); 
			
		});
	
}