<?php

require("appointment_db.php");
$sql = "SELECT * FROM appointments";
$results = mysqli_query($conn,  $sql);
$records = [];
while($rows = mysqli_fetch_assoc($results)){
    $records[] = $rows;
}

echo json_encode($records);



?>