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
                            Add Book
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <form id="singleForm" class="form-horizontal">
               

                
                <!-- Text input-->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="bookTitle">Title:</label>  
                  <div class="col-md-4">
                  <input id="bookTitle" name="bookTitle" type="text" placeholder="Title..." class="form-control" required="">

                  </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="bookAuthor">Author:</label>  
                  <div class="col-md-4">
                  <input id="bookAuthor" name="bookAuthor" type="text" placeholder="Author..." class="form-control" required="">

                  </div>
                </div>

                <!-- Textarea -->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="bookDescription">Description:</label>
                  <div class="col-md-4">                     
                    <textarea class="form-control" id="bookDescription" name="bookDescription">Description...</textarea>
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
                  <input id="lamazonLink" name="lamazonLink" type="text" placeholder="Link..." class="form-control" required="">

                  </div>
                </div>

                <!-- Button -->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="submit"></label>
                  <div class="col-md-4">
                    <button id="submit" name="submit" class="btn btn-info">Submit</button>
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