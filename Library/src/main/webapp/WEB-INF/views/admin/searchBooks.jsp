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
                                                <th>Genres</th>
                                                <th>More</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>3-43-020652-1</td>
                                                <td>Harry Potter and the Philosopher's Stone</td>
                                                <td>J. K. Rowling</td>
                                                <td class="center">Fantasy, young-adult fiction, mystery, thriller, bildungsroman, magical realism</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>1-44-234523-3</td>
                                                <td>Harry Potter and the Chamber of Secrets</td>
                                                <td>J. K. Rowling</td>
                                                <td class="center">Fantasy, young-adult fiction, mystery, thriller, bildungsroman, magical realism</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>2-12-123533-3</td>
                                                <td>Harry Potter and the Prisoner of Azkaban</td>
                                                <td>J. K. Rowling</td>
                                                <td class="center">Fantasy, young-adult fiction, mystery, thriller, bildungsroman, magical realism</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>3-43-234345-4</td>
                                                <td>Harry Potter and the Goblet of Fire</td>
                                                <td>J. K. Rowling</td>
                                                <td class="center">Fantasy, young-adult fiction, mystery, thriller, bildungsroman, magical realism</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>4-54-876534-5</td>
                                                <td>Harry Potter and the Order of the Phoenix</td>
                                                <td>J. K. Rowling</td>
                                                <td class="center">Fantasy, young-adult fiction, mystery, thriller, bildungsroman, magical realism</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>3-34-324563-3</td>
                                                <td>Harry Potter and the Half-Blood Prince</td>
                                                <td>J. K. Rowling</td>
                                                <td class="center">Fantasy, young-adult fiction, mystery, thriller, bildungsroman, magical realism</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>1-44-324632-4</td>
                                                <td>Harry Potter and the Deathly Hallows</td>
                                                <td>J. K. Rowling</td>
                                                <td class="center">Fantasy, young-adult fiction, mystery, thriller, bildungsroman, magical realism</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>0-34-324524-4</td>
                                                <td>A Game of Thrones</td>
                                                <td>George R. R. Martin</td>
                                                <td class="center">Epic fantasy</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>4-43-034552-5</td>
                                                <td>A Clash of Kings</td>
                                                <td>George R. R. Martin</td>
                                                <td class="center">Epic fantasy</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>5-34-023432-2</td>
                                                <td>A Storm of Swords</td>
                                                <td>George R. R. Martin</td>
                                                <td class="center">Epic fantasy</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>5-34-020652-5</td>
                                                <td>A Feast for Crows</td>
                                                <td>George R. R. Martin</td>
                                                <td class="center">Epic fantasy</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>2-76-345675-6</td>
                                                <td>A Dance with Dragons</td>
                                                <td>George R. R. Martin</td>
                                                <td class="center">Epic fantasy</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>5-34-444452-5</td>
                                                <td>The Winds of Winter</td>
                                                <td>George R. R. Martin</td>
                                                <td class="center">Epic fantasy</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>1-34-111111-3</td>
                                                <td>A Dream of Spring</td>
                                                <td>George R. R. Martin</td>
                                                <td class="center">Epic fantasy</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>5-77-123451-6</td>
                                                <td>Twilight</td>
                                                <td>Stephenie Meyer</td>
                                                <td class="center">Romance, horrible, fantasy, young-adult fiction</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>6-11-999999-1</td>
                                                <td>New Moon</td>
                                                <td>Stephenie Meyer</td>
                                                <td class="center">Romance, horrible, fantasy, young-adult fiction</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>1-44-133311-3</td>
                                                <td>Eclipse</td>
                                                <td>Stephenie Meyer</td>
                                                <td class="center">Romance, horrible, fantasy, young-adult fiction</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                            <tr>
                                                <td>5-55-555555-5</td>
                                                <td>Breaking Dawn</td>
                                                <td>Stephenie Meyer</td>
                                                <td class="center">Romance, horrible, fantasy, young-adult fiction</td>
                                                <td class="center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Info</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->

                                <!-- Modal -->
                                <div class="modal fade" id="myModal" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalLabel">View Book #ISBNGOESHERE</h4>
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
                                                                    <input id="bookTitle" name="bookTitle" type="text" placeholder="Current Title..." class="form-control" required="">

                                                                </div>
                                                            </div>

                                                            <!-- Text input-->
                                                            <div class="form-group">
                                                                <label class="col-md-4 control-label" for="bookAuthor">Author:</label>  
                                                                <div class="col-md-4">
                                                                    <input id="bookAuthor" name="bookAuthor" type="text" placeholder="Current Author..." class="form-control" required="">

                                                                </div>
                                                            </div>

                                                            <!-- Textarea -->
                                                            <div class="form-group">
                                                                <label class="col-md-4 control-label" for="bookDescription">Description:</label>
                                                                <div class="col-md-4">                     
                                                                    <textarea class="form-control" id="bookDescription" name="bookDescription">Current Description...</textarea>
                                                                </div>
                                                            </div>

                                                            <!-- Multiple Checkboxes -->
                                                            <div class="form-group">
                                                                <label class="col-md-4 control-label" for="bookFormats">Book Format(s)</label>
                                                                <div class="col-md-4">
                                                                    <div class="checkbox">
                                                                        <label for="bookFormats-0">
                                                                            <input type="checkbox" name="bookFormats" id="bookFormats-0" value="ePub">
                                                                            ePub
                                                                        </label>
                                                                    </div>
                                                                    <div class="checkbox">
                                                                        <label for="bookFormats-1">
                                                                            <input type="checkbox" name="bookFormats" id="bookFormats-1" value="pdf">
                                                                            .pdf
                                                                        </label>
                                                                    </div>
                                                                    <div class="checkbox">
                                                                        <label for="bookFormats-2">
                                                                            <input type="checkbox" name="bookFormats" id="bookFormats-2" value="html">
                                                                            .html
                                                                        </label>
                                                                    </div>
                                                                    <div class="checkbox">
                                                                        <label for="bookFormats-3">
                                                                            <input type="checkbox" name="bookFormats" id="bookFormats-3" value="kindle">
                                                                            Kindle
                                                                        </label>
                                                                    </div>
                                                                    <div class="checkbox">
                                                                        <label for="bookFormats-4">
                                                                            <input type="checkbox" name="bookFormats" id="bookFormats-4" value="audio">
                                                                            Audio
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- Text input-->
                                                            <div class="form-group">
                                                                <label class="col-md-4 control-label" for="lamazonLink">Lamazon Link: </label>  
                                                                <div class="col-md-4">
                                                                    <input id="lamazonLink" name="lamazonLink" type="text" placeholder="Current Link..." class="form-control" required="">

                                                                </div>
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