<!-- JS -->
	<!-- jQuery -->
	<script src="<c:url value="/resources/jquery/js/jquery-2.1.1.js" />"></script>

	<!-- Bootstrap -->
	<script src="<c:url value="/resources/bootstrap/js/bootstrap.js" />"></script>
	
	<!-- Bootstrap Validator -->
	<script src="<c:url value="/resources/bootstrapValidator/js/bootstrapValidator.js" />"></script>

	<!-- metisMenu -->
	<script src="<c:url value="/resources/metisMenu/js/metisMenu.js" />"></script>
	
	<!-- Charts -->
	<script src="<c:url value="http://d3js.org/d3.v3.min.js" />"></script>
	<script src="<c:url value="/resources/charts/js/c3.min.js" />"></script>
	
	<!-- Custom Admin -->
	<script src="<c:url value="/resources/custom/admin/js/admin.js" />"></script>
	<script src="<c:url value="/resources/ajax/admin.js" />"></script>
	<script src="<c:url value="/resources/sweetalerts/sweet-alert.js" />"></script>
	
	
	<script>
		$(document).ready(function() {
    		$('#registerForm').bootstrapValidator();
    		 
    		// Clears the quicksearch form, disables/enables the quicksearch, changes from quicksearch/advancedsearch
    		$('#toggleSearch').click(function(){
    			$('#quickSearchInput').val('');
    			$('#quickSearchInput').prop('disabled',!$('#quickSearchInput').prop('disabled'));
    			$('#quickSearchButton').prop('disabled',!$('#quickSearchButton').prop('disabled'));
    			$('#quickSearchButton').css('opacity', '1');
   			});
		});
	</script>
	
	