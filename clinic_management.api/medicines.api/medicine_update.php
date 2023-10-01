<?php

require("medicine_db.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $medicineId = $_POST['medicine_id'];
    $medicineName = $_POST['medicine_name'];
    $medicineGeneric = $_POST['medicine_generic'];
    $medicineUse = $_POST['medicine_use'];

    $sql = "UPDATE medicines SET
            medicine_name = '$medicineName',
            medicine_generic = '$medicineGeneric',
            medicine_use = '$medicineUse'
            WHERE id = '$medicineId'";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        $response = [
            'success' => true,
            'message' => 'Medicine updated successfully'
        ];
        echo json_encode($response);
    } else {
        $response = [
            'success' => false,
            'message' => 'Failed to update medicine'
        ];
        echo json_encode($response);
    }
}

?>
