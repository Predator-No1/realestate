<?php
session_start();
require("config.php"); 
if(!isset($_SESSION['auser']))
{
	header("location:index.php");
}
///code
$error="";
$msg="";
if(isset($_POST['insert']))
{
	$sid = $_GET['id'];
	$ustate=$_POST['ustate'];

	$sql="UPDATE state SET sname = '{$ustate}'  WHERE sid = {$sid}";
	$result=mysqli_query($con,$sql);
	if($result)
		{
			$msg="<p class='alert alert-success'>State Updated</p>";
			header("Location:stateadd.php?msg=$msg");
		}
		else
		{
			$msg="<p class='alert alert-warning'>State Not Updated</p>";
			header("Location:stateadd.php?msg=$msg");
		}	
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Ventura - Data Tables</title>
		
		
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
		
		
		<link rel="stylesheet" href="assets/plugins/datatables/dataTables.bootstrap4.min.css">
		<link rel="stylesheet" href="assets/plugins/datatables/responsive.bootstrap4.min.css">
		<link rel="stylesheet" href="assets/plugins/datatables/select.bootstrap4.min.css">
		<link rel="stylesheet" href="assets/plugins/datatables/buttons.bootstrap4.min.css">
		
		
        <link rel="stylesheet" href="assets/css/style.css">
		
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
    </head>
    <body>
	
		

		
			
			<?php include("header.php");?>	
			
			
			
            <div class="page-wrapper">
                <div class="content container-fluid">

					
					<div class="page-header">
						<div class="row">
							<div class="col">
								<h3 class="page-title">State</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
									<li class="breadcrumb-item active">State</li>
								</ul>
							</div>
						</div>
					</div>
					
					
				 
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h1 class="card-title">Add State</h1>
									
								</div>
								<?php 
								$sid = $_GET['id'];
								$sql = "SELECT * FROM state where sid = {$sid}";
								$result = mysqli_query($con, $sql);
								while($row = mysqli_fetch_row($result))
								{
								?>
								<form method="post">
									<div class="card-body">
											<div class="row">
												<div class="col-xl-6">
													<h5 class="card-title">State Details</h5>
													<div class="form-group row">
														<label class="col-lg-3 col-form-label">State Name</label>
														<div class="col-lg-9">
															<input type="text" class="form-control" name="ustate" value="<?php echo $row['1']; ?>">
														</div>
													</div>
												</div>
											</div>
											<div class="text-left">
												<input type="submit" class="btn btn-primary"  value="Submit" name="insert" style="margin-left:200px;">
											</div>
									</div>
								</form>
								<?php } ?>
							</div>
						</div>
					</div>
				<!----End state add section  --->
				</div>			
			</div>
			

		
        <script src="assets/js/jquery-3.2.1.min.js"></script>
		
		
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		
		
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		
		
		
		<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="assets/plugins/datatables/dataTables.bootstrap4.min.js"></script>
		<script src="assets/plugins/datatables/dataTables.responsive.min.js"></script>
		<script src="assets/plugins/datatables/responsive.bootstrap4.min.js"></script>
		
		<script src="assets/plugins/datatables/dataTables.select.min.js"></script>
		
		<script src="assets/plugins/datatables/dataTables.buttons.min.js"></script>
		<script src="assets/plugins/datatables/buttons.bootstrap4.min.js"></script>
		<script src="assets/plugins/datatables/buttons.html5.min.js"></script>
		<script src="assets/plugins/datatables/buttons.flash.min.js"></script>
		<script src="assets/plugins/datatables/buttons.print.min.js"></script>
		
		
		<script  src="assets/js/script.js"></script>
		
    </body>
</html>
