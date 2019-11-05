<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
	<?php
        $server="localhost";
        $user="root";
        $password="";
		$dname="pihpi";
        $conn=mysqli_connect($server,$user,$password,$dname);

        if(!$conn){
         	die("Connection to the database could not be established") ;
		}else{
		 	echo "Connected succesfully";
		}	

		if(!empty($_POST['sap_id'])&&!empty($_POST['name'])&&!empty($_POST['branch'])&&!empty($_POST['score'])){
			echo "iside snlsns";
			$sap=$_POST['sap_id'];
			$name=$_POST['name'];
			$branch=$_POST['branch'];
			$score=$_POST['score'];
			$resp=mysqli_query($conn,"INSERT INTO users VALUES('".$sap."','".$name."','".$branch."','".$score."')");
			if ($resp) {
				echo "<script>alert('New record created successfully')</script>";
			} else {
				echo "<script>alert('Error: <br>" . mysqli_error($conn)."')</script>";
			}
			header('location: new.php');

			
		}
		
	?>

	<h3> ADD USER </h3>
	
	<?php	include "add.php"	?>
	
	
	<h3> VIEW USERs </h3>
	
	<form action="view.php">
		<button type="Submit">View Users</button>
	</form>

</body>
</html>