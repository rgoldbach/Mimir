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
                            Weekly Book Report
                        </div>
                        <!-- /.panel-heading -->
                        <div id = "weeklyReport" class="panel-body graph-container" style = "height:400px;">
                            TODO: SOMEONE ADD GRAPH STUFF PLS 
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
                        <div id = "monthlyReport" class="panel-body graph-container" style = "height:400px;">
                            TODO: THIS ONE TOO
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
                            Site Use Report
                        </div>
                        <!-- /.panel-heading -->
                        <div id = "userReport" class="panel-body graph-container" style = "height:400px;">
                            TODO: I AM NOT GOOD WITH COMPUTER
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

	<script>
        var chart = c3.generate({
                bindto: '#weeklyReport',
                data: {
                x: 'x',
                columns: [
                        ['x', '2013-10-01', '2013-10-02', '2013-10-03', '2013-10-04', '2013-10-05', '2013-10-06', '2013-10-07'],
                        ['pdf', 30, 20, 25, 40, 41, 15, 50],
                        ['epub', 80, 50, 60, 61, 57, 35, 50],
                        ['audiobook', 6, 10, 12, 10, 20, 31, 10],
                ]
                },
                axis: {
                 y: {
                        label: { 
                        text: 'Number Of Downloads',
                        position: 'outer-middle'
                        }
                },
                x: {
                        label: {
                        text: 'Month-Day',
                        positoin: 'outer-middle'
                        },
                        type: 'timeseries',
                        tick: {
                                format: '%m-%d'
                        }
                }
                }
        });
		var chartTwo = c3.generate({
                bindto: '#monthlyReport',
                data: {
                x: 'x',
                columns: [
                        ['x', '2013-10-01', '2013-11-01', '2013-12-01', '2014-01-01', '2014-02-01', '2014-03-01', '2014-04-01', '2014-05-01', '2014-06-01', '2014-07-01', '2014-08-01', '2014-09-01'],
                        ['pdf', 30, 20, 25, 40, 41, 15, 50, 45, 40, 35, 51, 12],
                        ['epub', 80, 50, 60, 61, 57, 35, 50, 55, 70, 40, 55, 60],
                        ['audiobook', 6, 10, 12, 10, 20, 31, 10, 10, 12, 15, 20, 10],
                ]
                },
                axis: {
                 y: {
                        label: { 
                        text: 'Number Of Downloads',
                        position: 'outer-middle'
                        }
                },
                x: {
                        label: {
                        text: 'Month-Year',
                        positoin: 'outer-middle'
                        },
                        type: 'timeseries',
                        tick: {
                                format: '%m-%y'
                        }
                }
                }
        });
		var chartThree = c3.generate({
                bindto: '#userReport',
                data: {
                x: 'x',
                columns: [
                        ['x', '2013-10-01', '2013-11-01', '2013-12-01', '2014-01-01', '2014-02-01', '2014-03-01', '2014-04-01', '2014-05-01', '2014-06-01', '2014-07-01', '2014-08-01', '2014-09-01'],
                        ['Unique Users', 30, 20, 25, 40, 41, 15, 50, 45, 40, 35, 51, 12],
                        ['New Users', 5, 5, 6, 6, 5, 3, 5, 5, 7, 4, 5, 6],
                ]
                },
                axis: {
                 y: {
                        label: { 
                        text: 'Number Of Downloads',
                        position: 'outer-middle'
                        }
                },
                x: {
                        label: {
                        text: 'Month-Year',
                        positoin: 'outer-middle'
                        },
                        type: 'timeseries',
                        tick: {
                                format: '%m-%y'
                        }
                }
                }
        });


        </script>
	
</body>
</html>