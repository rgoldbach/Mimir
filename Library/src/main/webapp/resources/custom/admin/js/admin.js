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
    		 $('#userLibraryCard').val(user.libraryCardNumber);
    		 $('#userEmail').val(user.email);
    		 $('#userFirstName').val(user.firstName);
    		 $('#userLastName').val(user.lastName);
    		 $('#userPassword').val(user.password);
    		 
    	 }
    	 console.log(result);
     }
 });	
}