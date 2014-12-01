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
	    		$('#bookFormats-0').checked = false;
	    		$('#bookFormats-1').checked = false;
	    		$('#bookFormats-2').checked = false;
	    		$('#bookFormats-3').checked = false;
	    		$('#bookFormats-4').checked = false;
	    		$('#bookFormats-5').checked = false;
        	    $('#adminModalHeader').html(book.isbn);
        	    $('#modalBookTitle').val(book.bookTitle);
        	    $('#modalBookAuthor').val(book.author);
        	    $('#modalBookId').val(book.formatId);
        	    $('#modalBookFormat').val(book.formatType);
        	    $('#modalBookTotal').val(book.totalCopies);
        	    console.log(book.formats);
        	    var formats = book.formats.split(",");
        	    for(format in formats){
        	    	console.log(format);
        	    	if(format.trim() == "WMA"){
        	    		$('#bookFormats-0').checked = true;
        	    	}else if(format.trim() == "MP3"){
        	    		$('#bookFormats-1').checked = true;
        	    	}else if(format.trim() == "Kindle"){
        	    		$('#bookFormats-2').checked = true;
        	    	}else if(format.trim() == "EPub"){
        	    		$('#bookFormats-3').checked = true;
        	    	}else if(format.trim() == "Html"){
        	    		$('#bookFormats-4').checked = true;
        	    	}else if(format.trim() == "Pdf"){
        	    		$('#bookFormats-5').checked = true;
        	    	}
        	    }
        	}
        }
    });
}  