<?php 
session_start();
error_reporting(0);
include('includes/config.php');
$id=intval($_GET['oid']);
?>
<!DOCTYPE html> <!-- The new doctype -->

<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>Desease Informatins Details</title>

    <link rel="stylesheet" type="text/css" href="css/styles.css" />

    <!-- Internet Explorer HTML5 enabling script: -->

    <!--[if IE]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <style type="text/css">

            .clear {
                zoom: 1;
                display: block;
            }

        </style>

    <![endif]-->
<script language="javascript" type="text/javascript">
function f2()
{
window.close();
}ser
function f3()
{
window.print(); 
}
</script>
</head>
<body>

    <section id="page"> <!-- Defining the #page section with the section tag -->

	    <!-- Article 1 start -->

    <div class="line"></div>  <!-- Dividing line -->
<?php 
$ret=mysql_query("select * from desease where id='$id'");
while($row=mysql_fetch_array($ret))
{

?>
    <article id="article1"> <!-- The new article tag. The id is supplied so it can be scrolled into view. -->

        <h2><?php echo $row['DeseaseName'];?> </h2>

        <div class="line"></div>

        <div class="articleBody clear">

            <figure> <!-- The figure tag marks data (usually an image) that is part of the article -->

			<img src="admin/deseaseimages/<?php echo $row['DeseaseName'];?>/<?php echo $row['Deseaseimage1'];?>" alt=""  width="100%" height="100%" />
            </figure>

            <p><?php echo $row['DeseaselongDescription'];?> </p>

            <p><?php echo $row['Deseaseremedy'];?></p>

        </div>

    </article>
<input name="Submit2" type="submit" class="txtbox4" value="Close this Window " onClick="return f2();" style="cursor: pointer;"  /></td>
			 <br/></br/>
			  <input name="Submit2" type="submit" class="txtbox4" value="Print this Window " onClick="return f3();" style="cursor: pointer;"  /></td>
			  </br/><br/>
    <!-- Article 1 end -->
	        <footer> <!-- Marking the footer section -->

           
            
			 
			  <a href="genratepdf.php?id=<?php echo $row['id'];?>" class="by">Generate PDF</a>
<?php } ?>
        </footer>

    </section> <!-- Closing the #page section -->

    <!-- JavaScript Includes -->

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script src="jquery.scrollTo-1.4.2/jquery.scrollTo-min.js"></script>
    <script src="script.js"></script>

    </body>

</html>