<?php
// Connect to MySQL
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "myDB";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the email and password from the form
$email = $_POST["email"];
$password = $_POST["password"];

// Check if the email and password match a user in the database
$sql = "SELECT * FROM users WHERE email='$email' AND password='$password'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Login successful
    session_start();
    $_SESSION["logged_in"] = true;
    $_SESSION["email"] = $email;
    header("Location: home.php");
} else {
    // Login failed
    header("Location: login.html");
}
$conn->close();
?>
