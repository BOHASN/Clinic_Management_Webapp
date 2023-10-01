<?php
require("appointment_db.php");

if (isset($_POST['appointment_id'])) {
    $appointmentId = $_POST['appointment_id'];

    $sql = "DELETE FROM appointments WHERE id = '$appointmentId'";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        echo "Appointment deleted successfully";
    } else {
        echo "Error occurred while deleting appointment";
    }
} else {
    echo "Appointment ID not provided";
}

mysqli_close($conn);
?>
