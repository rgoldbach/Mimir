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
        	    $('#adminModalHeader').html(book.isbn);
        	    $('#modalBookTitle').val(book.bookTitle);
        	    $('#modalBookAuthor').val(book.author);
        	    $('#modalBookId').val(book.formatId);
        	    $('#modalBookFormat').val(book.formatType);
        	    $('#modalBookTotal').val(book.totalCopies);
        	}
        }
    });
}  