<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<!-- Head -->
	<%@ include file="/WEB-INF/views/admin/include/head.jsp" %>

<body>

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
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            Add Books
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
             
            <form id="multForm" class="form-inline" method="POST" action="uploadFile" enctype="multipart/form-data">

                <!-- File Button --> 
                <div class="form-group">
                  <label class="col-md-4 control-label" for="filebutton"></label>
                  <div class="col-md-4">
                    <input id="filebutton" name="file" type="file" class="btn">
                    <input type="text" class="hidden" name="name">
                  </div>
                </div>
                
                <!-- Button -->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="submit"></label>
                  <div class="col-md-4">
                    <button id="orderSubmit" name="submit" value="Upload" class="btn btn-info">Upload</button>
                  </div>
                </div>

            </form>
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