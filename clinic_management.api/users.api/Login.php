<?php

require("user_db.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    $sql = "SELECT * FROM users WHERE Username = '$username'";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        $user = mysqli_fetch_assoc($result);

        if ($user && password_verify($password, $user['Userpassword'])) {
            $response = [
                'success' => true,
                'message' => 'Login successful',
            ];
            echo json_encode($response);
        } else {
            $response = [
                'success' => false,
                'message' => 'Invalid username or password',
            ];
            echo json_encode($response);
        }
    } else {
        $response = [
            'success' => false,
            'message' => 'Error occurred while logging in',
        ];
        echo json_encode($response);
    }
}

mysqli_close($conn);
?>
