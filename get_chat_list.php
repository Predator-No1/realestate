<?php
session_start();
include 'config.php';

$me = $_SESSION['uid'];
$role = $_SESSION['utype']; // 'user' or 'agent'

if ($role == 'user') {
    $sql = "SELECT uid, uname FROM user WHERE utype='agent'";
} else {
    $sql = "SELECT uid, uname FROM user WHERE utype='user'";
}

$result = $con->query($sql);

echo "<ul>";
while($row = $result->fetch_assoc()){
    echo "<li><a href='chat.php?with=".$row['uid']."'>".$row['uname']."</a></li>";
}
echo "</ul>";
