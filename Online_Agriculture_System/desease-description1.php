<?php 
session_start();
error_reporting(0);
include('includes/config.php');
$id=intval($_GET['oid']);
$ret=mysql_query("select DeseaseName,DeseaselongDescription,Deseaseremedy from desease where id='$id'");
/*
require('fpdf/fpdf.php');
$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);

while($row=mysql_fetch_array($ret))
{

$pdf->Cell(40,10,"{$row['DeseaseName']}",0,1,'C');
$pdf->Cell(40,10,"{$row['DeseaselongDescription']}",0,1,'C');
$pdf->Cell(40,10,"{$row['Deseaseremedy']}",0,1,'C');
}
$pdf->output(); 

*/
/*
require_once 'dompdf/autoload.inc.php';
use Dompdf\Dompdf;
$dompdf = new Dompdf();
while($row=mysql_fetch_array($ret))
{
	$text= "$row['DeseaseName']";
$dompdf->loadHtml('<h1>this is .'$text'.how what is this to know what</h1>');
}
$dompdf->setPaper('A4','landscope');
$dompdf->render();
$dompdf->stream('jonayied',array('Attachment'=>0));*/

set_include_path(get_include_path() . PATH_SEPARATOR . "dompdf");

require_once "dompdf/autoload.inc.php";

$dompdf = new DOMPDF();

$html = <<<'ENDHTML'
<html>
 <body>
  <h1>Hello Dompdf</h1>
 </body>
</html>
ENDHTML;

$dompdf->load_html($html);
$dompdf->render();

$dompdf->stream("hello.pdf");


?>
