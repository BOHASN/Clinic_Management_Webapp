<?php

require("user_db.php");

$userName = $_POST['user_name'];
$userPassword = $_POST['user_password'];

$sql = "INSERT INTO users (Username, Userpassword) VALUES ('$userName', '$userPassword')";
$results = mysqli_query($conn, $sql);

if ($results) {
    echo "Success";
} else {
    echo "Error occurred while adding user";
}

mysqli_close($conn);

?>
