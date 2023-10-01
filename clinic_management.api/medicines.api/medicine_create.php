<?php

require("medicine_db.php");

$medicineName = $_POST['medicine_name'];
$medicineGeneric = $_POST['medicine_generic'];
$medicineUse = $_POST['medicine_use'];

$sql = "INSERT INTO medicines (Medicinename, Medicinegeneric, Medicineuse) VALUES ('$medicineName', '$medicineGeneric', '$medicineUse')";
$results = mysqli_query($conn, $sql);

if ($results) {
    echo "Success";
} else {
    echo "Error occurred while adding medicine";
}

mysqli_close($conn);

?>
