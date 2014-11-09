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
                                Support Tickets
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Username</th>
                                                <th>Issue</th>
                                                <th>Date</th>
                                                <th>Time</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>TimIsCool93</td>
                                                <td>I forgot my password!</td>
                                                <td>10/09/14</td>
                                                <td class="center">3:50PM</td>
                                                <td class="center"><button type="button" class="btn-sm btn-info" data-toggle="modal" data-target="#myModal">Unresolved</button></td>
                                            </tr>
                                            <tr>
                                                <td>TimIsCool93</td>
                                                <td>I can't download Harry Potter!</td>
                                                <td>10/10/14</td>
                                                <td class="center">3:50PM</td>
                                                <td class="center"><button type="button" class="btn-sm btn-info" data-toggle="modal" data-target="#myModal">Unresolved</button></td>
                                            </tr>
                                            <tr>
                                                <td>TimIsCool93</td>
                                                <td>Your site is ugly...</td>
                                                <td>10/09/14</td>
                                                <td class="center">3:50PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>TimIsCool93</td>
                                                <td>I'm lonely!</td>
                                                <td>10/09/14</td>
                                                <td class="center">3:50PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>TimIsCool93</td>
                                                <td>I can't return a book.</td>
                                                <td>10/12/14</td>
                                                <td class="center">3:50PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>TimIsCool93</td>
                                                <td>I can't logout.</td>
                                                <td>10/12/14</td>
                                                <td class="center">3:50PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>I can't return a book.</td>
                                                <td>10/09/14</td>
                                                <td class="center">9:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>Writing fake support tickets is boring! :)</td>
                                                <td>10/12/14</td>
                                                <td class="center">1:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>Writing fake support tickets is boring! :)</td>
                                                <td>10/09/14</td>
                                                <td class="center">1:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>Writing fake support tickets is boring! :)</td>
                                                <td>10/12/14</td>
                                                <td class="center">5:30PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>Writing fake support tickets is boring! :)</td>
                                                <td>10/12/14</td>
                                                <td class="center">1:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>Writing fake support tickets is boring! :)</td>
                                                <td>10/12/14</td>
                                                <td class="center">1:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>I can't return a book.</td>
                                                <td>10/12/14</td>
                                                <td class="center">9:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>Writing fake support tickets is boring! :)</td>
                                                <td>10/09/14</td>
                                                <td class="center">9:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>Writing fake support tickets is boring! :)</td>
                                                <td>10/09/14</td>
                                                <td class="center">1:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>Writing fake support tickets is boring! :)</td>
                                                <td>10/12/14</td>
                                                <td class="center">7:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>Writing fake support tickets is boring! :)</td>
                                                <td>10/12/14</td>
                                                <td class="center">5:30PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>Writing fake support tickets is boring! :)</td>
                                                <td>10/09/14</td>
                                                <td class="center">5:30PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>Writing fake support tickets is boring! :)</td>
                                                <td>10/12/14</td>
                                                <td class="center">5:30PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>I miss the disco.</td>
                                                <td>10/09/14</td>
                                                <td class="center">5:30PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>Just try to fix this bug!</td>
                                                <td>10/12/14</td>
                                                <td class="center">5:30PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>I can't return a book.</td>
                                                <td>10/12/14</td>
                                                <td class="center">5:30PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>Just try to fix this bug!</td>
                                                <td>10/09/14</td>
                                                <td class="center">9:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>Your site is ugly...</td>
                                                <td>10/09/14</td>
                                                <td class="center">1:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>Just try to fix this bug!</td>
                                                <td>10/01/14</td>
                                                <td class="center">1:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>GDawg7</td>
                                                <td>I can't download Harry Potter!</td>
                                                <td>10/04/14</td>
                                                <td class="center">1:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>WixyTrixy</td>
                                                <td>Just try to fix this bug!</td>
                                                <td>10/09/14</td>
                                                <td class="center">1:30PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>WixyTrixy</td>
                                                <td>Your site is ugly...</td>
                                                <td>10/09/14</td>
                                                <td class="center">1:30PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>WixyTrixy</td>
                                                <td>Your site is ugly...</td>
                                                <td>10/09/14</td>
                                                <td class="center">1:30PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>WixyTrixy</td>
                                                <td>Bow chicka bow wow</td>
                                                <td>10/04/14</td>
                                                <td class="center">1:30PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>WixyTrixy</td>
                                                <td>I can't download Harry Potter!</td>
                                                <td>10/09/14</td>
                                                <td class="center">1:30PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>WixyTrixy</td>
                                                <td>Bow chicka bow wow</td>
                                                <td>10/09/14</td>
                                                <td class="center">1:30PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>WixyTrixy</td>
                                                <td>Your site is ugly...</td>
                                                <td>10/08/14</td>
                                                <td class="center">2:20PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>PatLovesCats</td>
                                                <td>Your site is ugly...</td>
                                                <td>10/09/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>PatLovesCats</td>
                                                <td>When's the midterm for this class?</td>
                                                <td>10/08/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>PatLovesCats</td>
                                                <td>Bow chicka bow wow</td>
                                                <td>10/08/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>PatLovesCats</td>
                                                <td>I can't download Harry Potter!</td>
                                                <td>10/09/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>PatLovesCats</td>
                                                <td>Mimir is an awesome name for a site.</td>
                                                <td>10/09/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>PatLovesCats</td>
                                                <td>Your site is ugly...</td>
                                                <td>10/13/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>PatLovesCats</td>
                                                <td>I can't download Harry Potter!</td>
                                                <td>10/08/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>PatLovesCats</td>
                                                <td>Chickens?</td>
                                                <td>10/09/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>PatLovesCats</td>
                                                <td>Debugdebugdebug</td>
                                                <td>10/09/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>PatLovesCats</td>
                                                <td>Mimir is an awesome name for a site.</td>
                                                <td>10/09/14</td>
                                                <td class="center">2:20PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr class="gradeC">
                                                <td>KookieKali</td>
                                                <td>I love to dance.</td>
                                                <td>10/09/14</td>
                                                <td class="center">2:20PM</td>
                                                <td class="center"><button type="button" class="btn-sm btn-info" data-toggle="modal" data-target="#myModal">Unresolved</button></td>
                                            </tr>
                                            <tr>
                                                <td>KookieKali</td>
                                                <td>Your site is ugly...</td>
                                                <td>10/08/14</td>
                                                <td class="center">2:20PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr>
                                                <td>KookieKali</td>
                                                <td>I can't download Harry Potter!</td>
                                                <td>10/08/14</td>
                                                <td class="center">2:20PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr class="gradeX">
                                                <td>TommysTunes</td>
                                                <td>Your site is ugly...</td>
                                                <td>10/13/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center"><button type="button" class="btn-sm btn-info" data-toggle="modal" data-target="#myModal">Unresolved</button></td>
                                            </tr>
                                            <tr class="gradeC">
                                                <td>TommysTunes</td>
                                                <td>Mimir is an awesome name for a site.</td>
                                                <td>10/13/14</td>
                                                <td class="center">7:00PM</td>
                                                <td class="center"><button type="button" class="btn-sm btn-info" data-toggle="modal" data-target="#myModal">Unresolved</button></td>
                                            </tr>
                                            <tr class="gradeC">
                                                <td>TommysTunes</td>
                                                <td>I miss the disco.</td>
                                                <td>10/13/14</td>
                                                <td class="center">7:00PM</td>
                                                <td class="center"><button type="button" class="btn-sm btn-info" data-toggle="modal" data-target="#myModal">Unresolved</button></td>
                                            </tr>
                                            <tr>
                                                <td>Guest</td>
                                                <td>Your site is ugly...</td>
                                                <td>10/13/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center"><button type="button" class="btn-sm btn-info" data-toggle="modal" data-target="#myModal">Unresolved</button></td>
                                            </tr>
                                            <tr>
                                                <td>Guest</td>
                                                <td>Hello class :D</td>
                                                <td>10/11/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center">Resolved</td>
                                            </tr>
                                            <tr class="gradeX">
                                                <td>Guest</td>
                                                <td>I miss the disco.</td>
                                                <td>10/13/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center"><button type="button" class="btn-sm btn-info" data-toggle="modal" data-target="#myModal">Unresolved</button></td>
                                            </tr>
                                            <tr class="gradeX">
                                                <td>Guest</td>
                                                <td>Your site is horrible!</td>
                                                <td>10/11/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center"><button type="button" class="btn-sm btn-info" data-toggle="modal" data-target="#myModal">Unresolved</button></td>
                                            </tr>
                                            <tr class="gradeX">
                                                <td>Guest</td>
                                                <td>I love your site!</td>
                                                <td>10/11/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center"><button type="button" class="btn-sm btn-info" data-toggle="modal" data-target="#myModal">Unresolved</button></td>
                                            </tr>
                                            <tr class="gradeC">
                                                <td>Guest</td>
                                                <td>I miss the disco.</td>
                                                <td>10/11/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center"><button type="button" class="btn-sm btn-info" data-toggle="modal" data-target="#myModal">Unresolved</button></td>
                                            </tr>
                                            <tr class="gradeC">
                                                <td>Guest</td>
                                                <td>Mimir is an awesome name for a site.</td>
                                                <td>10/08/14</td>
                                                <td class="center">2:00PM</td>
                                                <td class="center"><button type="button" class="btn-sm btn-info" data-toggle="modal" data-target="#myModal">Unresolved</button></td>
                                            </tr>
                                            <tr class="gradeC">
                                                <td>TommysTunes</td>
                                                <td>I can't download Harry Potter!</td>
                                                <td>10/08/14</td>
                                                <td class="center">7:00PM</td>
                                                <td class="center"><button type="button" class="btn-sm btn-info" data-toggle="modal" data-target="#myModal">Unresolved</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                                <!-- Modal -->
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalLabel">Username's Issue</h4>
                                            </div>
                                            <div class="modal-body">
                                                <!-- Start Modal -->
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="panel panel-info">
                                                            <div class="panel-heading">
                                                                 From 0:00PM on 01/01/01
                                                            </div>
                                                            <!-- /.panel-heading -->
                                                            <div class="panel-body">
                                                                <p>Sample Issue Text, Sample Issue Text, Sample Issue Text, Sample Issue Text, Sample Issue Text, Sample Issue Text, Sample Issue Text, Sample Issue Text, Sample Issue Text, Sample Issue Text, Sample Issue Text, Sample Issue Text, Sample Issue Text.</p>
                                                            </div>
                                                            <!-- /.panel-body -->
                                                        </div>
                                                        <!-- /.panel -->
                                                    </div>
                                                    <!-- /.col-lg-6 (nested) -->
                                                </div>
                                                <!-- /.row (nested) -->

                                                <!-- End Modal -->
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-success" data-dismiss="modal">Mark Resolved</button>
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
	
<!-- DataTables JavaScript -->
	<script src="<c:url value="/resources/dataTables/js/jquery.dataTables.js" />"></script>
	<script src="<c:url value="/resources/dataTables/js/dataTables.bootstrap.js" />"></script>
	
	<script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
</body>
</html>