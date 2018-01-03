<?php 
session_start();
error_reporting(0);
include('includes/config.php');
$id=intval($_GET['id']);
require_once 'dompdf/autoload.inc.php';

use Dompdf\Dompdf;

$dompdf = new Dompdf();

//$ret=mysql_query("select * from desease");
$query=mysql_query("SELECT * FROM desease WHERE id=$id");
while ($row=mysql_fetch_array($query)) 
{
	$name = htmlentities($row['DeseaseName']);
	$des = htmlentities($row['DeseaselongDescription']);
	$remedy = htmlentities($row['Deseaseremedy']);
}
$html="
<div id=\"page-wrapper\">
        <div class=\"container-fluid\">
            <hr/>
            
            <div class=\"row\">
                <div class=\"col-lg-12\">
                    <h1 style='color: #0d6aad'>Online Agriculture System</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class=\"panel-body\">
                <dl>
                    <dt style='font-weight: bold'>$name</dt>
                    <dd></dd>
                </dl>
                <dl>
                    <dt>$des</dt>
                    <dd></dd>
                </dl>      
				<dl>
                    <dt>$remedy</dt>
                    <dd></dd>
                </dl> 
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>

";

$dompdf->loadHtml($html);

// (Optional) Setup the paper size and orientation
$dompdf->setPaper('A4', 'landscape');

// Render the HTML as PDF
$dompdf->render();

// Output the generated PDF to Browser
$dompdf->stream();
?>