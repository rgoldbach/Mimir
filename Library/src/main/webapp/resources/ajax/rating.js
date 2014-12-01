$(".rating").change(function() {
  console.log( $( this ).attr('value'));
  console.log( $( this ).attr('bookid') );
  console.log ($( this ).attr('formattype') );
  
  var rating = $(this).attr('value');
  var id = $( this ).attr('bookId');
  var formatType = $( this ).attr('formatType');
  rateBook(id, rating, formatType)
});

function rateBook(id, rating, formatType){
	console.log(rating);
    var currentBook = $('#currentBook').val();
    var rating = $('#input-21b').val();
    var json = { 
  		  		"whichBook" : id,
  		  		"rating" : rating,
  		  		"formatType" : formatType
  		  	};
    json = JSON.stringify(json);
    console.log(json); 
    $.ajax({
		headers: { 
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        'url' : "ratebook?whichBook="+id+"&formatType="+formatType+"&rating="+rating,
        'type' : "GET",
        'complete' : function(result) {
        		console.log(result)          	              	
        }
	  });	
}