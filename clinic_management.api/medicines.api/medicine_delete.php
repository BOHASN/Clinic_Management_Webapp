<?php

require("medicine_db.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $medicineId = $_POST['medicine_id'];

    $sql = "DELETE FROM medicines WHERE id = '$medicineId'";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        $response = [
            'success' => true,
            'message' => 'Medicine deleted successfully'
        ];
        echo json_encode($response);
    } else {
        $response = [
            'success' => false,
            'message' => 'Failed to delete medicine'
        ];
        echo json_encode($response);
    }
}

?>
