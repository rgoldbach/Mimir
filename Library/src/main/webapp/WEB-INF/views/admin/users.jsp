<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<!-- Head -->
	<%@ include file="/WEB-INF/views/admin/include/head.jsp" %>
	<%@ include file = "/WEB-INF/views/admin/include/jsSources.jsp" %>

<body>
	<script>

	</script>
<!-- Navigation Bar -->
	<%@ include file="/WEB-INF/views/admin/include/navbar.jsp" %>
		
    <div id="wrapper">

        <!-- Navigation -->
        <div id="page-wrapper">
			            <div class="row">
                <div class="col-lg-12">
                    <br>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            View User
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- THIS ISN'T ACTUALLY A FORM -->

                            <!-- Text input-->
                            
                            <div class="col-md-3">
                            <input id="adminLibraryCard" name="" type="text" placeholder="Enter The Users Library Card Number" class="form-control input-md">
                            </div>
                            
                            <!-- Button trigger modal -->
                            <button onclick = "getUser()" class="btn btn-info" data-toggle="modal" data-target="#myModal">
                                View
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">View Username's Account</h4>
                                        </div>
                                        <div class="modal-body">
                                            <!-- Start Modal -->
                                            <div class="row">
                                <div class="col-lg-6">
                                    <form>
                                        <div class="form-group">
                                            <label>Library Card Number:</label>
                                            <input id ="userLibraryCard" class="form-control" >
                                        </div>
                                        <div class="form-group">
                                            <label>Email:</label>
                                            <input  id ="userEmail" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>First Name:</label>
                                            <input id = "userFirstName" class="form-control" >
                                        </div>
                                        <div class="form-group">
                                            <label>Last Name:</label>
                                            <input id = "userLastName" class="form-control" >
                                        </div>
                                        <div class="form-group">
                                            <label>Password:</label>
                                            <input id = "userPassword" type="password"  class="form-control" >
                                        </div>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                                            
                                            <!-- End Modal -->
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-success" data-dismiss="modal">Save Changes</button>
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Ban User</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>

    </div>
    
<!-- JS -->
	<%@ include file="/WEB-INF/views/admin/include/jsSources.jsp" %>
	
</body>
</html>