<!-- JS -->
	<!-- jQuery -->
	<script src="<c:url value="/resources/jquery/js/jquery-2.1.1.js" />"></script>

	<!-- Bootstrap -->
	<script src="<c:url value="/resources/bootstrap/js/bootstrap.js" />"></script>

	<!-- Bootstrap-Select -->
	<script src="<c:url value="/resources/bootstrap-select/js/bootstrap-select.js" />"></script>

	<!-- Intro -->
	<script src="<c:url value="/resources/intro/js/intro.js" />"></script>
	
	<!-- bootstrapValidator -->
	<script src="<c:url value="/resources/bootstrapValidator/js/bootstrapValidator.js" />"></script>
	
	<!-- Star-Rating -->
	<script src="<c:url value="/resources/star-rating/js/star-rating.js"/>"></script>
	
	<!-- Custom Library -->
	<!-- <script src="<c:url value="/resources/custom/library/js/library.js" />"></script> -->
	
	<script src="<c:url value="/resources/ajax/libraryAjax.js" />"></script>
	
	
	<script src="<c:url value="/resources/ajax/rating.js" />"></script>
	<script src="<c:url value="/resources/ajax/admin.js" />"></script>
	
	
	<script>
		$(document).ready(function() {
    		$('#registerForm').bootstrapValidator();
    		 $('.selectpicker').selectpicker('.selectpicker'); 
    		 
    		// Clears the quicksearch form, disables/enables the quicksearch, changes from quicksearch/advancedsearch
    		$('#toggleSearch').click(function(){
    			$('#quickSearchInput').val('');
    			$('#quickSearchInput').prop('disabled',!$('#quickSearchInput').prop('disabled'));
    			$('#quickSearchButton').prop('disabled',!$('#quickSearchButton').prop('disabled'));
   			});
		});
	</script>
	