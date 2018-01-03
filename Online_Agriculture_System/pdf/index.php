<?php
include("config.php");
?>
<html>
<head>
<title>How Genrate PDF From MYSQL Usig PHP</title>
</head>
<body>
<p><a href="genratepdf.php" target="_blank">Generate PDF</a></p>
<table border="1">
<tr>
<td style="font-weight:bold;">EmpId</td>
<td style="font-weight:bold;">EmpName</td>
<td style="font-weight:bold;">EmpDepartment</td>
<td style="font-weight:bold;">EmpRegDate</td>
</tr>
<?php 
$sql = "SELECT * from  tblemployee";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $row) 
	{ ?>

<tr>
<td><?php echo htmlentities($row->EmpId);?></td>
<td><?php echo htmlentities($row->EmpName);?></td>
<td><?php echo htmlentities($row->EmpDepartment);?></td>
<td><?php echo htmlentities($row->EmpRegDate);?></td>
</tr>

<?php } }
?>
</table>
</body>
</html>