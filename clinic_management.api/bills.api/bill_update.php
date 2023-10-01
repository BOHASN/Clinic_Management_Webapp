<?php

require("bill_db.php");

if (isset($_POST['bill_id'])) {
    $billId = $_POST['bill_id'];
    // Retrieve the updated values from the request
    $billPatientName = $_POST['bill_patientname'];
    $billDate = $_POST['bill_date'];
    $billAmount = $_POST['bill_amount'];
    $billNote = $_POST['bill_note'];

    $sql = "UPDATE bills SET Billpatientname = '$billPatientName', Billdate = '$billDate', Billamount = '$billAmount', Billnote = '$billNote' WHERE id = '$billId'";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        echo "Bill updated successfully";
    } else {
        echo "Error occurred while updating bill";
    }
} else {
    echo "Bill ID not provided";
}

mysqli_close($conn);

?>
