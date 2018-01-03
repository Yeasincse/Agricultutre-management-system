<?php
session_start();
include('include/config.php');
if (strlen($_SESSION['alogin']) == 0) {
    header('location:index.php');
} else {
	$id=intval($_GET['id']);
    if (isset($_POST['submit'])) {
        $deseaseName = $_POST['DeseaseName'];
		$d_category = $_POST['category'];
		$d_subCategory = $_POST['subcategory'];		
        $deseaseShortDescription = $_POST['DeseaseshortDescription'];
        $deseaseLongDescription = $_POST['DeseaselongDescription'];
		$d_remady = $_POST['Deseaseremedy'];		
        $sql = mysql_query("update desease set DeseaseName='$deseaseName',category_id='$d_category',sub_cat_id='$d_subCategory',DeseaseshortDescription='$deseaseShortDescription',DeseaselongDescription='$deseaseLongDescription',Deseaseremedy='$d_remady' where id='$id'");
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
<?php

//$query=mysql_query("select * from desease where id='$id'");

$query=mysql_query("select desease.*,category.categoryName as catname,category.id as cid,subcategory.subcategory as subcatname,subcategory.id as subcatid from desease 
	join category on category.id=desease.category_id 
	join subcategory on subcategory.id=desease.sub_cat_id 
	where desease.id='$id'");


while($row=mysql_fetch_array($query))
{
?>	
                                        <form class="form-horizontal row-fluid" name="insertproduct" method="post" enctype="multipart/form-data">
                               
                                            <div class="control-group">
                                                <label class="control-label" for="basicinput">Name of the Desease</label>
                                                <div class="controls">
                                                    <input type="text" value="<?php echo  htmlentities($row['DeseaseName']);?>"   name="DeseaseName"  placeholder="Enter Desease Name" class="span8 tip" readonly>
                                                </div>
                                            </div>


<div class="control-group">
<label class="control-label" for="basicinput">Category</label>
<div class="controls">
<select name="category" class="span8 tip" onChange="getSubcat(this.value);"  required>
<option value="<?php echo htmlentities($row['cid']);?>"><?php echo htmlentities($row['catname']);?></option> 
<?php $query=mysql_query("select * from category");
while($rw=mysql_fetch_array($query))
{
	if($row['catname']==$rw['categoryName'])
	{
		continue;
	}
	else{
	?>

<option value="<?php echo $rw['id'];?>"><?php echo $rw['categoryName'];?></option>
<?php }} ?>
</select>
</div>
</div>
<div class="control-group">
<label class="control-label" for="basicinput">Sub Category</label>
<div class="controls">

<select   name="subcategory"  id="subcategory" class="span8 tip" required>
<option value="<?php echo htmlentities($row['subcatid']);?>"><?php echo htmlentities($row['subcatname']);?></option>
</select>
</div>
</div>

                                            <div class="control-group">
                                                <label class="control-label" for="basicinput">Desease Short Description</label>
                                                <div class="controls">
                                                    <textarea  name="DeseaseshortDescription"  placeholder="Enter Desease Description" rows="6" class="span8 tip">
													<?php echo htmlentities($row['DeseaseshortDescription']);?>
                                                    </textarea>  
                                                </div>
                                            </div>
                                             <div class="control-group">
                                                <label class="control-label" for="basicinput">Desease Long Description</label>
                                                <div class="controls">
                                                    <textarea  name="DeseaselongDescription" placeholder="Enter Desease Description" rows="6" class="span8 tip">
													<?php echo htmlentities($row['DeseaselongDescription']);?>
                                                    </textarea>  
                                                </div>
                                            </div>
<div class="control-group">
                                                <label class="control-label" for="basicinput">Desease Remady</label>
                                                <div class="controls">
                                                    <textarea  name="Deseaseremedy"  placeholder="Enter Desease Description" rows="6" class="span8 tip">
                                                   <?php echo htmlentities($row['Deseaseremedy']);?>
												   </textarea>  
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label" for="basicinput">Desease Image1</label>
                                               <div class="controls">
<img src="deseaseimages/<?php echo htmlentities($row['DeseaseName']);?>/<?php echo htmlentities($row['Deseaseimage1']);?>" width="200" height="100"> <a href="update-des-image1.php?id=<?php echo $row['id'];?>">Change Image</a>
</div>
</div>
                                          

                                            <div class="control-group">
                                                <label class="control-label" for="basicinput">Desease Image2</label>
                                                <div class="controls">
<img src="deseaseimages/<?php echo htmlentities($row['DeseaseName']);?>/<?php echo htmlentities($row['Deseaseimage2']);?>" width="200" height="100"> <a href="update-des-image2.php?id=<?php echo $row['id'];?>">Change Image</a>
</div>
</div>
                                          

                                            <div class="control-group">
                                                <div class="controls">
                                                    <button type="submit" name="submit" class="btn">Update</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>


<?php } ?>


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