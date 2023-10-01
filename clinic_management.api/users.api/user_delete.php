<?php

require("user_db.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $userId = mysqli_real_escape_string($conn, $_POST['user_id']); // Sanitize the input

    $sql = "DELETE FROM users WHERE id = '$userId'";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        $response = [
            'success' => true,
            'message' => 'User deleted successfully'
        ];
        echo json_encode($response);
    } else {
        $response = [
            'success' => false,
            'message' => 'Failed to delete user'
        ];
        echo json_encode($response);
    }
}

?>
