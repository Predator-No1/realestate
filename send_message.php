<?php
session_start();
include 'config.php';

if (!isset($_SESSION['uid'])) {
    die("You are not logged in.");
}

$sender_id = $_SESSION['uid'];
$receiver_id = $_POST['receiver_id'] ?? null;
$message = $_POST['message'] ?? null;

if (!$receiver_id || !$message) {
    die("Invalid input: receiver_id or message missing.");
}

// Insert message
$stmt = $con->prepare("INSERT INTO messages (sender_id, receiver_id, message) VALUES (?,?,?)");
$stmt->bind_param("iis", $sender_id, $receiver_id, $message);
$stmt->execute();

// Redirect back to the chat
header("Location: chat.php?with=$receiver_id");
