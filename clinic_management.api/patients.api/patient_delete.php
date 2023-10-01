<?php

require("patient_db.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $patientId = mysqli_real_escape_string($conn, $_POST['patient_id']); // Sanitize the input

    $sql = "DELETE FROM patients WHERE id = '$patientId'";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        $response = [
            'success' => true,
            'message' => 'Patient deleted successfully'
        ];
        echo json_encode($response);
    } else {
        $response = [
            'success' => false,
            'message' => 'Failed to delete patient'
        ];
        echo json_encode($response);
    }
}

?>
