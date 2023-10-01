<?php
require("patient_db.php");

$sql = "SELECT * FROM patients";
$results = mysqli_query($conn, $sql);
$patients = [];

while($rows = mysqli_fetch_assoc($results)){
    $records[] = $rows;
}

echo json_encode($records);


?>