<?php

require("test_db.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $testId = mysqli_real_escape_string($conn, $_POST['test_id']); // Sanitize the input

    $sql = "DELETE FROM tests WHERE id = '$testId'";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        $response = [
            'success' => true,
            'message' => 'Test deleted successfully'
        ];
        echo json_encode($response);
    } else {
        $response = [
            'success' => false,
            'message' => 'Failed to delete test'
        ];
        echo json_encode($response);
    }
}

?>
