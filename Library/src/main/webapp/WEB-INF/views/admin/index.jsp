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
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            Yearly Book Report
                        </div>
                        <!-- /.panel-heading -->
                        <div id = "yearlyReport" class="panel-body graph-container" style = " float: left; width:67%; height:400px;">
                            
                        </div>
                        <div id = "popularChart" class="panel-body graph-container" style = "float: right; width:27%; height:400px;">
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            
			</div>
            
           
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            Monthly Book Report
                        </div>
                        <!-- /.panel-heading -->
                        <div id = "monthlyReport" class="panel-body graph-container" style = " float: left; width:67%; height:400px;">
                            
                        </div>
                        <div id = "popularChart2" class="panel-body graph-container" style = "float: right; width:27%; height:400px;">
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
			</div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            Weekly Book Report
                        </div>
                        <!-- /.panel-heading -->
                        <div id = "weeklyReport" class="panel-body graph-container" style = " float: left; width:67%; height:400px;">
                            
                        </div>
                        <div id = "popularChart3" class="panel-body graph-container" style = "float: right; width:27%; height:400px;">
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
       
        </div>

    </div>
    
<!-- JS -->
	<%@ include file="/WEB-INF/views/admin/include/jsSources.jsp" %>

		<script src="<c:url value="/resources/ajax/charts.js" />"></script>

	
</body>
</html>