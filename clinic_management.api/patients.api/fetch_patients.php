<?php

require("patient_db.php");

// Query to fetch patient names
$sql = "SELECT Patientname FROM patients";
$result = mysqli_query($conn, $sql);

if ($result) {
    $patients = array();

    while ($row = mysqli_fetch_assoc($result)) {
        $patients[] = $row['Patientname'];
    }

    // Return JSON response
    header('Content-Type: application/json');
    echo json_encode($patients);
} else {
    // Handle query error
    echo "Error: " . mysqli_error($conn);
}

mysqli_close($conn);

?>
