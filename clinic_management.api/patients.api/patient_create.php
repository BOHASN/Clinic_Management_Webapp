<?php

require("patient_db.php");

$patientName = $_POST['patient_name'];
$patientEmail = $_POST['patient_email'];
$patientAddress = $_POST['patient_address'];
$patientPhonenumber = $_POST['patient_phonenumber'];
$patientBirthdate = $_POST['patient_birthdate'];
$patientBloodgroup = $_POST['patient_bloodgroup'];
$patientGender = $_POST['patient_gender'];
$patientCon = $_POST['patient_con'];
$patientSpecialneeds = $_POST['patient_specialneeds'];

$sql = "INSERT INTO patients (Patientname, Patientemail, Patientaddress, Patientphonenumber, Patientbirthdate, Patientbloodgroup, Patientgender, Patientcon, Patientspecialneeds) 
VALUES ('$patientName', '$patientEmail', '$patientAddress', '$patientPhonenumber', '$patientBirthdate', '$patientBloodgroup', '$patientGender', '$patientCon', '$patientSpecialneeds')";

$results = mysqli_query($conn, $sql);

if ($results) {
    echo json_encode("Success");
} else {
    echo json_encode("Error occured while adding patient");
}

mysqli_close($conn);

?>
