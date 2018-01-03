<?php 
session_start();
error_reporting(0);
include('includes/config.php');
$id=intval($_GET['id']);
require_once 'dompdf/autoload.inc.php';

use Dompdf\Dompdf;

$dompdf = new Dompdf();


$get_order_info=mysql_query("SELECT * FROM orders WHERE id=$id");

while($row=mysql_fetch_array($get_order_info)){
	$user_id = htmlentities($row['userId']);
	$product_id = htmlentities($row['productId']);
	$p_quantity = htmlentities($row['quantity']);
	$orderDate = htmlentities($row['orderDate']);
	$paymentMethod = htmlentities($row['paymentMethod']);
	$orderStatus = htmlentities($row['orderStatus']);
}

$get_user_info=mysql_query("SELECT * FROM users WHERE id=$user_id");
while($rw=mysql_fetch_array($get_user_info))
{
	$name = htmlentities($rw['name']);
	$email = htmlentities($rw['email']);
	$contact = htmlentities($rw['contactno']);
	$s_address = htmlentities($rw['shippingAddress']);
	$s_city = htmlentities($rw['shippingState']);
	$s_pincode = htmlentities($rw['shippingPincode']);
}

$get_product_info=mysql_query("SELECT * FROM products WHERE id=$product_id");
while($rws=mysql_fetch_array($get_product_info))
{
	$product_name = htmlentities($rws['productName']);
	$p_quantity = htmlentities($rws['quantity']);
	$t_amout = htmlentities($rws['quantity']*$rws['productPrice']+$rws['shippingCharge']);
	//$date = htmlentities($rws['orderDate']);

}
date_default_timezone_set('Asia/Kolkata');// change according timezone
$currentTime = date( 'd-m-Y h:i:s A', time () );
$p_date = $currentTime;



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
                    <dt style='font-weight: bold'>Customer Information</dt>
                    <dd>Customer Name    : $id</dd>
					<dd>Customer Email   : $email</dd>
					<dd>Customer Contact : $contact</dd>
				    <dd></dd>	
                </dl>
                <dl>
                    <dt style='font-weight: bold'>Order Information</dt>
                    <dd>Product Name     : $product_name</dd>
					<dd>Product Quantity : $p_quantity</dd>
					<dd>Delevery Date    : $date</dd>
					<dd>Total Amount     : $t_amout</dd>
                </dl>
                <dl>
                    <dt style='font-weight: bold'>Customer Shipping Information</dt>
                    <dd>Shipping Address : $s_address</dd>
					<dd>Shipping City    : $s_city</dd>
					<dd>City Pincode     : $s_pincode</dd>
				    <dd></dd>	
                </dl>      
			<dl>
                    <dt style='font-weight: bold'></dt>
                    <dd>Delevery Date    : $p_date</dd>	
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