-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2023 at 05:05 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `Appointmentpatientname` text NOT NULL,
  `Appointmentdate` text NOT NULL,
  `Appointmenttimeslot` text NOT NULL,
  `Reasonforvisit` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `Appointmentpatientname`, `Appointmentdate`, `Appointmenttimeslot`, `Reasonforvisit`) VALUES
(1, 'Hassan Mansour', 'Wednesday, June 21, 2023', '13:30-14:00', 'Virus infection'),
(2, 'Ahmad Hassan', 'Friday, June 23, 2023', '15:00-15:30', 'General health check-up'),
(3, 'Fatima Khalid', 'Saturday, June 24, 2023', '08:30-09:00', 'Gastrointestinal issues'),
(4, 'Noura Khalil', 'Monday, June 26, 2023', '10:30-11:00', 'kidney issues'),
(9, 'Fatima Khalid', 'Tuesday, June 6, 2023', '10:00-10:30', 'CHECKUP');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(11) NOT NULL,
  `Billpatientname` text NOT NULL,
  `Billdate` text NOT NULL,
  `Billamount` text NOT NULL,
  `Billnote` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `Billpatientname`, `Billdate`, `Billamount`, `Billnote`) VALUES
(1, 'Ahmad Hassan', 'Monday, June 5, 2023', '120$', 'Cash'),
(2, 'Layla Abbas', 'Thursday, June 8, 2023', '130$', 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `id` int(11) NOT NULL,
  `Medicinename` text NOT NULL,
  `Medicinegeneric` text NOT NULL,
  `Medicineuse` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`id`, `Medicinename`, `Medicinegeneric`, `Medicineuse`) VALUES
(1, 'Acetaminophen', 'Paracetamol', 'Relieve pain and reduce fever'),
(2, 'Aspirin', 'Acetylsalicylic acid', 'As a blood thinner'),
(3, 'Metformin', 'Metalisc acid', 'Manage blood sugar levels'),
(4, 'Lisinopril', 'ACE', 'Manage high blood pressure');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `Patientname` text NOT NULL,
  `Patientemail` text NOT NULL,
  `Patientphonenumber` text NOT NULL,
  `Patientbirthdate` text NOT NULL,
  `Patientbloodgroup` text NOT NULL,
  `Patientgender` text NOT NULL,
  `Patientaddress` text NOT NULL,
  `Patientcon` text NOT NULL,
  `Patientspecialneeds` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `Patientname`, `Patientemail`, `Patientphonenumber`, `Patientbirthdate`, `Patientbloodgroup`, `Patientgender`, `Patientaddress`, `Patientcon`, `Patientspecialneeds`) VALUES
(1, 'Fatima Khalid', 'fatima.khalid@gmail.com', '70182718', 'February 10, 1985', 'A+', 'Female', 'Beirut, Lebanon', 'Recovering from surgery', 'Post-operative care instructions'),
(2, 'Ahmad Hassan', 'ahmad.hassan@gmail.com', '71987654', 'November 5, 1978 ', 'O-', 'Male ', 'Tripoli, Lebanon', 'Diabetes', 'Blood sugar monitoring equipment'),
(3, 'Aisha Said', 'aisha.said@gmail.com', '76246813', 'July 15, 1992', 'B+', 'Female', 'Sidon, Lebanon', 'Hypertension', 'Blood pressure monitoring equipment'),
(4, 'Ali Farhat', 'ali.farhat@gmail.com', '70369258', 'January 22, 1980', 'AB-', 'Male', 'Tyre, Lebanon', 'Arthritis', 'Mobility aids'),
(5, 'Layla Abbas', 'layla.abbas@gmail.com', '76824615', 'September 8, 1975', 'A-', 'Female', 'Baalbek, Lebanon', 'Migraines', 'Quiet environment'),
(6, 'Omar Saad', 'omar.saad@gmail.com', '70741258', 'May 25, 1990', 'O+', 'Male', 'Barja, Lebanon', 'Asthma', 'Inhaler availability'),
(7, 'Noura Khalil', 'noura.khalil@gmail.com', '71630975', 'April 18, 1982', 'AB+', 'Female', 'Kfartbneit, Lebanon', 'Allergies', 'Epinephrine auto-injector'),
(9, 'Leen AL Zahran', 'leenalzahran@gmail.com', '71170949', 'July 3, 2008', 'B+', 'Female', 'Dawhet Chouifet , Zahran street', 'High Depression', 'Carefully handing, Emotional damage');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `Prescriptionid` int(11) NOT NULL,
  `Patientname` text NOT NULL,
  `Content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` int(11) NOT NULL,
  `Testname` text DEFAULT NULL,
  `Testdescription` text DEFAULT NULL,
  `Testnote` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `Testname`, `Testdescription`, `Testnote`) VALUES
(1, 'X-rays', 'X-rays use low levels of radiation', 'Not allowed in pregnancy'),
(2, 'Complete Blood Count', 'Blood cell analysis', 'Hematology assessment'),
(3, 'Electrocardiogram', 'Heart electrical activity', 'Cardiac rhythm monitoring'),
(4, 'Blood Glucose Test', 'Blood sugar measurement', ' Glycemic level evaluation'),
(5, 'Electroencephalogram', 'Brain electrical activity', 'Neurological wave recording'),
(6, 'C-Reactive Protein', 'Inflammation marker', 'Systemic inflammation');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Userpassword` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `Username`, `Userpassword`) VALUES
(2, 'Siraj AL Zahran', 'Siraj12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`Prescriptionid`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `Prescriptionid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
