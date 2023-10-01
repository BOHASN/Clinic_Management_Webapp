<?php

require("medicine_db.php");
$sql = "SELECT * FROM medicines";
$results = mysqli_query($conn,  $sql);
$records = [];
while($rows = mysqli_fetch_assoc($results)){
    $records[] = $rows;
}

echo json_encode($records);



?>