<?php
require("bill_db.php");

if(isset($_POST['bill_id'])){
    $billId = $_POST['bill_id'];

    $sql = "DELETE FROM bills WHERE id = '$billId'";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        echo "Bill deleted successfully";
    } else {
        echo "Error occurred while deleting bill";
    }
} else {
    echo "Bill ID not provided";
}

mysqli_close($conn);


?>
