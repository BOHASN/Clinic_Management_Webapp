<?php

require("bill_db.php");

$billPatientname = $_POST['bill_patientname'];
$billDate = $_POST['bill_date'];
$billAmount = $_POST['bill_amount'];
$billNote = $_POST['bill_note'];

$sql = "INSERT INTO bills (Billpatientname, Billdate, Billamount, Billnote) VALUES ('$billPatientname', '$billDate', '$billAmount', '$billNote')";
$results = mysqli_query($conn, $sql);

if ($results) {
    echo "Success";
} else {
    echo "Error occurred while adding bill";
}

mysqli_close($conn);

?>
