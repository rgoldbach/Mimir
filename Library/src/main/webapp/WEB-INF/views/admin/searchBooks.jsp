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
                                Search Books
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>ISBN</th>
                                                <th>Title</th>
                                                <th>Author</th>
                                                <th>Formats</th>
                                                <th>Available Copies</th>
                                                <th>Number of holds</th>
                                                <th>More</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${adminBooks}" var="element">
											<tr>
                                                <td>${element.isbn}</td>
                                                <td>${element.bookTitle}</td>
                                                <td>${element.author}</td>
                                                <td class="center">${element.formats}</td>
                                                <td>${element.availableCopies}</td>
                                                <td>${element.numberOfHolds}</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#adminModal" onclick="adminBookMoreInfo(${element.formatId}, '${element.formatType}');">Info</button></td>
                                            </tr>
										</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->

                                <!-- Modal -->
                                <div class="modal fade" id="adminModal" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="adminModalHeader">ISBN</h4>
                                            </div>
                                            <div class="modal-body">
                                                <!-- Start Modal -->
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <form id="singleForm" class="form-horizontal">
                                                            <!-- Text input-->
                                                            <div class="form-group">
                                                                <label class="col-md-4 control-label" for="bookTitle">Title:</label>  
                                                                <div class="col-md-4">
                                                                    <input id="modalBookTitle" name="bookTitle" type="text" placeholder="Current Title..." class="form-control" required>
                                                                </div>
                                                            </div>
                                                            <!-- Text input-->
                                                            <div class="form-group">
                                                                <label class="col-md-4 control-label" for="bookAuthor">Author:</label>  
                                                                <div class="col-md-4">
                                                                    <input id="modalBookAuthor" name="bookAuthor" type="text" placeholder="Current Author..." class="form-control" required>
                                                                </div>
                                                            </div>
                                                            <!-- Textarea -->
                                                            <!--<div class="form-group">
                                                                <label class="col-md-4 control-label" for="bookDescription">Description:</label>
                                                                <div class="col-md-4">                     
                                                                    <textarea class="form-control" id="bookDescription" name="bookDescription">Current Description...</textarea>
                                                                </div>
                                                            </div>-->
                                                            <!-- Multiple Checkboxes -->
                                                            
                                                            <div class="form-group">
                                                                <label class="col-md-4 control-label" for="bookFormats">Book Format(s)</label>
                                                                <div class="col-md-4">
                                                                    <div class="checkbox">
                                                                        <label for="bookFormats-0">
                                                                            <input type="checkbox" name="bookFormats" id="bookFormats-0" value="kindle">
                                                                            Kindle
                                                                        </label>
                                                                    </div>
                                                                    <div class="checkbox">
                                                                        <label for="bookFormats-1">
                                                                            <input type="checkbox" name="bookFormats" id="bookFormats-1" value="epub">
                                                                            EPub
                                                                        </label>
                                                                    </div>
                                                                    <div class="checkbox">
                                                                        <label for="bookFormats-2">
                                                                            <input type="checkbox" name="bookFormats" id="bookFormats-2" value="mp3">
                                                                            MP3
                                                                        </label>
                                                                    </div>
                                                                    <div class="checkbox">
                                                                        <label for="bookFormats-3">
                                                                            <input type="checkbox" name="bookFormats" id="bookFormats-3" value="wma">
                                                                            WMA
                                                                        </label>
                                                                    </div>
                                                                    <div class="checkbox">
                                                                        <label for="bookFormats-4">
                                                                            <input type="checkbox" name="bookFormats" id="bookFormats-4" value="pdf">
                                                                            PDF
                                                                        </label>
                                                                    </div>
                                                                    <div class="checkbox">
                                                                        <label for="bookFormats-4">
                                                                            <input type="checkbox" name="bookFormats" id="bookFormats-5" value="html">
                                                                            Html
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Text input-->
                                                            <div class="form-group">
                                                                <label class="col-md-4 control-label" for="modalBookTotal">Total Copies:</label>  
                                                                <div class="col-md-4">
                                                                    <input id="modalBookTotal" name="bookTotal" type="text" placeholder="Total..." class="form-control input-sm" style="width: 50px;" required>
                                                                </div>
                                                            </div>
                                                            <!-- Text input-->
                                                            <!--<div class="form-group">
                                                                <label class="col-md-4 control-label" for="lamazonLink">Lamazon Link: </label>  
                                                                <div class="col-md-4">
                                                                    <input id="lamazonLink" name="lamazonLink" type="text" placeholder="Current Link..." class="form-control" required="">
                                                                </div>
                                                            </div>-->
                                                        </form>
                                                    </div>
                                                    <!-- /.col-lg-6 (nested) -->
                                                </div>
                                                <!-- /.row (nested) -->
                                                <!-- End Modal -->
                                            </div>
                                            <div class="modal-footer">
                                            	<input type="hidden" id="modalBookId">
                                            	<input type="hidden" id="modalBookFormat">
                                                <button type="button" class="btn btn-success" data-dismiss="modal">Save Changes</button>
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Delete Book</button>
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