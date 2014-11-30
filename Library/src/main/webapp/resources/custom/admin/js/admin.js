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
    			 $('#userlookuperror').text("User Could Not Be Found");
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
    		 $('#userlookuperror').text("User Could Not Be Found");
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
		validation = false
		$('#userChangeError').text("First Name Cannot Be Blank");

	}
	if ($('#userLastName').val() === ""){
		validation = false
		$('#userChangeError').text("Last Name Cannot Be Blank");
	}
	if ($('#userEmail').val() === ""){
			validation = false
			$('#userChangeError').text("Email Cannot Be Blank");

	}
	if ($('#userPassword').val() === ""){
			validation = false
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
        			$('#userlookuperror').text("Info Successfuly Changed");
        			$('#myModal').modal('hide');
        			
        	}

        }
    });  
    return false;
}

function banUser(){
	
}