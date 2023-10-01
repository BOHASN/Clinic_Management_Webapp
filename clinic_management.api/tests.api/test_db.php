<?php

// Enable CORS
header('Access-Control-Allow-Origin: *'); // Set the appropriate origin value instead of '*'
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Requested-With, Authorization');
header('Access-Control-Allow-Credentials: true');
// Add other necessary headers

$conn = new mysqli('localhost', 'root', '', 'clinic_management');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Rest of your code

?>
