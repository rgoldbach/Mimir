function adminBookMoreInfo(id, type){
	var url = "adminBookMoreInfo?whichBook="+id+"&bookFormat="+type;	
	$.ajax({
        url: url,
        type: "GET",
        beforeSend: function(xhr) {
            xhr.setRequestHeader("Accept", "application/json");
            xhr.setRequestHeader("Content-Type", "application/json");
        },
        complete: function(result) {
        	if(result.status === 200){
        	    var book = result.responseJSON;
        	    console.log(book);
	    		$('#bookFormats-0').prop( "checked", false );
	    		$('#bookFormats-1').prop( "checked", false );
	    		$('#bookFormats-2').prop( "checked", false );
	    		$('#bookFormats-3').prop( "checked", false );
	    		$('#bookFormats-4').prop( "checked", false );
	    		$('#bookFormats-5').prop( "checked", false );
        	    $('#adminModalHeader').html(book.isbn);
        	    $('#modalBookTitle').val(book.bookTitle);
        	    $('#modalBookAuthor').val(book.author);
        	    $('#modalBookId').val(book.formatId);
        	    $('#modalBookFormat').val(book.formatType);
        	    $('#modalBookTotal').val(book.totalCopies);
        	    console.log(book.formats);
        	    var formats = book.formats.split(",");
        	    if(book.formatType === "EBook"){
        	    	$('#bookFormats-0').attr("disabled", true);
    	    		$('#bookFormats-1').attr("disabled", true);
    	    		$('#bookFormats-2').removeAttr("disabled");
    	    		$('#bookFormats-3').removeAttr("disabled");
    	    		$('#bookFormats-4').removeAttr("disabled");
    	    		$('#bookFormats-5').removeAttr("disabled");
        	    }
        	    else{
        	    	$('#bookFormats-0').removeAttr("disabled");
    	    		$('#bookFormats-1').removeAttr("disabled");
    	    		$('#bookFormats-2').attr("disabled", true);
    	    		$('#bookFormats-3').attr("disabled", true);
    	    		$('#bookFormats-4').attr("disabled", true);
    	    		$('#bookFormats-5').attr("disabled", true);
        	    }
        	    for(var i = 0; i < formats.length; i++){
        	    	if(formats[i].trim() === "WMA"){
        	    		$('#bookFormats-0').prop( "checked", true );
        	    	}else if(formats[i].trim() === "MP3"){
        	    		$('#bookFormats-1').prop( "checked", true );
        	    	}else if(formats[i].trim() === "Kindle"){
        	    		$('#bookFormats-2').prop( "checked", true );
        	    	}else if(formats[i].trim() === "EPub"){
        	    		$('#bookFormats-3').prop( "checked", true );
        	    	}else if(formats[i].trim() === "Html"){
        	    		$('#bookFormats-4').prop( "checked", true );
        	    	}else if(formats[i].trim() === "Pdf"){
        	    		$('#bookFormats-5').prop( "checked", true );
        	    	}
        	    }
        	}
        }
    });
}

function adminSaveBookChanges(id, type){
	var url = "adminSaveBookChanges";
	var formats = "";
	if($('#bookFormats-0').prop("checked")){
		formats += "WMA,";
	}if($('#bookFormats-1').prop("checked")){
		formats += "MP3,";
	}if($('#bookFormats-2').prop("checked")){
		formats += "Kindle,";
	}if($('#bookFormats-3').prop("checked")){
		formats += "EPub,";
	}if($('#bookFormats-4').prop("checked")){
		formats += "Html,";
	}if($('#bookFormats-5').prop("checked")){
		formats += "Pdf,";
	}
	console.log(formats);
	formats = formats.substring(0, (formats.length)-1);
    var json = {
                "formatId" : parseInt($('#modalBookId').val()),
                "formatType" : $('#modalBookFormat').val(),
                "isbn" : $('#adminModalHeader').html(),
                "bookTitle" : $('#modalBookTitle').val(),
                "author": $('#modalBookAuthor').val(),
                "formats" : formats,
                "totalCopies" : parseInt($('#modalBookTotal').val()),
                "availableCopies" : 0,
                "numberOfHolds" : 0
    };
    console.log(json);
	$.ajax({
		headers: { 
        	'Accept': 'application/json',
        	'Content-Type': 'application/json' 
    	},
        'url': url,
    	'data' : JSON.stringify(json),
    	'type' : "POST",
        complete: function(result) {
        	if(result.status === 200){
        		var book = result.responseJSON;
        		console.log("#" + book.formatId + "" + book.formatType);
        		$("#" + book.formatId + book.formatType + " .title").html(book.bookTitle);
        		$("#" + book.formatId + book.formatType + " .author").html(book.author);
        		$("#" + book.formatId + book.formatType + " .formats").html(book.formats);
        		$("#" + book.formatId + book.formatType + " .availCopies").html(book.availableCopies);
        	}
        }
    });
}  