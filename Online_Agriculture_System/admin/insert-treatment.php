
<?php
session_start();
include('include/config.php');
if (strlen($_SESSION['alogin']) == 0) {
    header('location:index.php');
} else {
    if (isset($_POST['submit'])) {

        $deseaseName = $_POST['DeseaseName'];
		$d_category = $_POST['category'];
		$d_subCategory = $_POST['subcategory'];
        $deseaseShortDescription = $_POST['DeseaseshortDescription'];
        $deseaseLongDescription = $_POST['DeseaselongDescription'];
		$d_remady = $_POST['Deseaseremedy'];
        $Deseaseimage1 = $_FILES["Deseaseimage1"]["name"];
        $Deseaseimage2 = $_FILES["Deseaseimage2"]["name"];
        $dir = "deseaseimages/$deseaseName";
        mkdir($dir); // directory creation for product images
        move_uploaded_file($_FILES["Deseaseimage1"]["tmp_name"], "deseaseimages/$deseaseName/" . $_FILES["Deseaseimage1"]["name"]);
        move_uploaded_file($_FILES["Deseaseimage2"]["tmp_name"], "deseaseimages/$deseaseName/" . $_FILES["Deseaseimage2"]["name"]);
        $sql = mysql_query("insert into desease(DeseaseName,category_id,sub_cat_id,DeseaseshortDescription,DeseaselongDescription,Deseaseremedy,Deseaseimage1,Deseaseimage2) values('$deseaseName','$d_category','$d_subCategory','$deseaseShortDescription','$deseaseLongDescription','$d_remady','$Deseaseimage1','$Deseaseimage2')");
        $_SESSION['msg'] = "Deseasess Inserted Successfully !!";
    }
    ?>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Admin| Insert Desease</title>
            <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
            <link type="text/css" href="css/theme.css" rel="stylesheet">
            <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
            <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
            <script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
            <script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>	

   <script>
function getSubcat(val) {
	$.ajax({
	type: "POST",
	url: "get_subcat.php",
	data:'cat_id='+val,
	success: function(data){
		$("#subcategory").html(data);
	}
	});
}
function selectCountry(val) {
$("#search-box").val(val);
$("#suggesstion-box").hide();
}
</script>	
        </head>
        <body>
    <?php include('include/header.php'); ?>

            <div class="wrapper">
                <div class="container">
                    <div class="row">
            <?php include('include/sidebar.php'); ?>				
                        <div class="span9">
                            <div class="content">

                                <div class="module">
                                    <div class="module-head">
                                        <h3>Insert Desease</h3>
                                    </div>
                                    <div class="module-body">

    <?php if (isset($_POST['submit'])) {
        ?>
                                            <div class="alert alert-success">
                                                <button type="button" class="close" data-dismiss="alert">×</button>
                                                <strong>Well done!</strong>	<?php echo htmlentities($_SESSION['msg']); ?><?php echo htmlentities($_SESSION['msg'] = ""); ?>
                                            </div>
                                        <?php } ?>


    <?php if (isset($_GET['del'])) {
        ?>
                                            <div class="alert alert-error">
                                                <button type="button" class="close" data-dismiss="alert">×</button>
                                                <strong>Oh snap!</strong> 	<?php echo htmlentities($_SESSION['delmsg']); ?><?php echo htmlentities($_SESSION['delmsg'] = ""); ?>
                                            </div>
                                        <?php } ?>

                                        <br />

                                        <form class="form-horizontal row-fluid" name="insertproduct" method="post" enctype="multipart/form-data">
                               
                                            <div class="control-group">
                                                <label class="control-label" for="basicinput">Name of the Desease</label>
                                                <div class="controls">
                                                    <input type="text"    name="DeseaseName"  placeholder="Enter Desease Name" class="span8 tip" required>
                                                </div>
                                            </div>
										<div class="control-group">
										<label class="control-label" for="basicinput">Category</label>
										<div class="controls">
										<select name="category" class="span8 tip" onChange="getSubcat(this.value);"  required>
										<option value="">Select Category</option> 
										<?php $query=mysql_query("select * from category");
										while($row=mysql_fetch_array($query))
										{?>

										<option value="<?php echo $row['id'];?>"><?php echo $row['categoryName'];?></option>
										<?php } ?>
										</select>
										</div>
										</div>
<div class="control-group">
<label class="control-label" for="basicinput">Sub Category</label>
<div class="controls">
<select   name="subcategory"  id="subcategory" class="span8 tip" required>
</select>
</div>
</div>

                                            <div class="control-group">
                                                <label class="control-label" for="basicinput">Desease Short Description</label>
                                                <div class="controls">
                                                    <textarea  name="DeseaseshortDescription" id="DeseaseshortDescription" rows="3" class="span8 tip" maxlength="40" type="text"></textarea>
											Please give a short description within <span id="sessionNum_counters">20</span> word 
                                                </div>
                                            </div>
											
											<div class="control-group">
                                                <label class="control-label" for="basicinput">Desease Long Description</label>
                                                <div class="controls">
                                                    <textarea  name="DeseaselongDescription"  placeholder="Enter Desease Description" rows="6" class="span8 tip">
                                                    </textarea>  
                                                </div>
                                            </div>
											<div class="control-group">
                                                <label class="control-label" for="basicinput">Desease Remady</label>
                                                <div class="controls">
                                                    <textarea  name="Deseaseremedy"  placeholder="Enter Desease Description" rows="6" class="span8 tip">
                                                    </textarea>  
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label" for="basicinput">Desease Image1</label>
                                                <div class="controls">
                                                    <input type="file" name="Deseaseimage1" id="Deseaseimage1" value="" class="span8 tip" required>
                                                </div>
                                            </div>


                                            <div class="control-group">
                                                <label class="control-label" for="basicinput">Desease Image2</label>
                                                <div class="controls">
                                                    <input type="file" name="Deseaseimage2"  class="span8 tip" required>
                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <div class="controls">
                                                    <button type="submit" name="submit" class="btn">Insert</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>





                            </div><!--/.content-->
                        </div><!--/.span9-->
                    </div>
                </div><!--/.container-->
            </div><!--/.wrapper-->

    <?php include('include/footer.php'); ?>

            <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
            <script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
            <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
            <script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
            <script src="scripts/datatables/jquery.dataTables.js"></script>
            <script>
        $(document).ready(function () {
            $('.datatable-1').dataTable();
            $('.dataTables_paginate').addClass("btn-group datatable-pagination");
            $('.dataTables_paginate > a').wrapInner('<span />');
            $('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
            $('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
        });
            </script>
        </body>
<?php } ?>