<?php

require("test_db.php");
$sql = "SELECT * FROM tests";
$results = mysqli_query($conn,  $sql);
$records = [];
while($rows = mysqli_fetch_assoc($results)){
    $records[] = $rows;
}

echo json_encode($records);



?>