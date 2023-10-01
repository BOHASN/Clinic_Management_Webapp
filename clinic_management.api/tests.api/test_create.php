<?php

require("test_db.php");

$testName = $_POST['test_name'];
$testDescription = $_POST['test_description'];
$testNote = $_POST['test_note'];

$sql = "INSERT INTO tests (Testname, Testdescription, Testnote) VALUES ('$testName', '$testDescription', '$testNote')";
$results = mysqli_query($conn, $sql);

if ($results) {
    echo "Success";
} else {
    echo "Error occurred while adding test";
}

mysqli_close($conn);

?>
