<script>
$(document).ready(function() {
		    $('.determineRole').click(
		        function(event) {
		            event.preventDefault();
		            var url = $('.determineRole').attr('name');
		            var json = "";
		            if(url ===  "signin"){
		            	json = {
				                "username" : $('#email').val(),
				                "password" : $('#password').val()
				        }
		            }
		            else{
		            	json = "";
		            }
		            var jsona = JSON.stringify(json);
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
		                			window.location.replace("index.jsp");
		                		}
		                		else{
		                			location.reload();  
		                		}
		                		
		                	}              	              	
		                }
		            });
		        return false;
		    });
		});
</script>