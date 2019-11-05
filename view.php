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
        $dbname="pihpi";

        $conn=mysqli_connect($server,$user,$password,$dbname);

        if(!$conn){
         	die("Connection to the database could not be established") ;
		}else{
		 	echo "";
        }	
        
        $sql_query="SELECT * from users";

        $res=mysqli_query($conn,$sql_query);
        
        $str="";

        while($row=mysqli_fetch_array($res)){
            $str.="<form method=\"POST\" action=\"\" ><h3>".$row['sap_id']."</h3><p>".$row['name']."</p><p>".$row['branch']."</p><p>".$row['score']."</p><br/><button type=\"submit\" name=\"delete\" value=".$row['sap_id'].">Delete</button></form>";
        }
        echo "$str";

        echo "<form action=\"new.php\">
		<button type=\"Submit\">goto add Users</button>
	</form>";

        if(!empty($_POST['delete'])){

            $sql_del_query="DELETE FROM users WHERE sap_id=".$_POST['delete'];

            $res=mysqli_query($conn,$sql_del_query);

            header('location:view.php');
        }


	?>
</body>
</html>