<?php

require("appointment_db.php");

$appointmentPatientname = $_POST['appointment_patientname'];
$appointmentDate = $_POST['appointment_date'];
$appointmentTimeslot = $_POST['appointment_timeslot'];
$reasonForvisit = $_POST['reason_forvisit'];

$sql = "INSERT INTO appointments (Appointmentpatientname, Appointmentdate,	Appointmenttimeslot,	Reasonforvisit) VALUES ('$appointmentPatientname', '$appointmentDate', '$appointmentTimeslot', '$reasonForvisit')";
$results = mysqli_query($conn, $sql);

if ($results) {
    echo "Success";
} else {
    echo "Error occurred while adding appointment";
}

mysqli_close($conn);

?>
