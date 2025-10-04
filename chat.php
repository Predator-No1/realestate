<?php
session_start();
include 'config.php';

// Check if logged in
if (!isset($_SESSION['uid']) || !isset($_SESSION['utype'])) {
    header("location:login.php");
}


$me = $_SESSION['uid'];
$role = $_SESSION['utype']; // 'user' or 'agent'

// Who to display chat with
$with = $_GET['with'] ?? null;

// Fetch list of people to chat with
if ($role == 'user') {
    $sql_list = "SELECT uid, uname FROM user WHERE utype='agent'";
    $role2="Agent";
} else {
    $sql_list = "SELECT uid, uname FROM user WHERE utype='user'";
    $role2="Customer";
}
$list_result = $con->query($sql_list);

// Fetch messages if $with is set
$messages = [];
if ($with) {
    $sql_msgs = "SELECT * FROM messages 
                 WHERE (sender_id=$me AND receiver_id=$with) 
                    OR (sender_id=$with AND receiver_id=$me)
                 ORDER BY created_at ASC";
    $msg_result = $con->query($sql_msgs);
    if ($msg_result) {
        while($row = $msg_result->fetch_assoc()) {
            $messages[] = $row;
        }
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Chat</title>
    <style>
        body { margin:0; font-family: Arial; background:#f7f7f7; }
        .container { display: flex; height: 90vh; max-width: 1000px; margin:20px auto; border:1px solid #ccc; border-radius:10px; overflow:hidden; background:#fff; }

        /* Chat column */
        .chat-col { flex:3; display:flex; flex-direction:column; border-right:1px solid #ccc; }
        .chat-header { background:#4CAF50; color:#fff; padding:15px; font-weight:bold; text-align:center; }
        #chat-box { flex:1; padding:10px; overflow-y:scroll; background:#e5ddd5; }
        .message { max-width:70%; padding:10px; border-radius:10px; margin:5px 0; word-wrap:break-word; }
        .sent { background:#dcf8c6; margin-left:auto; text-align:right; }
        .received { background:#fff59d; margin-right:auto; text-align:left; }
        .timestamp { font-size:0.7em; color:#555; margin-top:2px; }

        .chat-input { display:flex; padding:10px; border-top:1px solid #ccc; background:#f0f0f0; }
        .chat-input textarea { flex:1; border-radius:20px; padding:10px; border:1px solid #ccc; outline:none; resize:none; font-size:1em; }
        .chat-input button { background:#4CAF50; color:#fff; border:none; padding:10px 15px; margin-left:10px; border-radius:50%; cursor:pointer; font-size:1.2em; }
        .chat-input button:hover { background:#45a049; }

        /* Users list column */
        .users-col { flex:1; border-left:1px solid #ccc; background:#f9f9f9; overflow-y:auto; }
        .users-col h3 { text-align:center; background:#4CAF50; color:#fff; margin:0; padding:10px; }
        .user-item { padding:10px; border-bottom:1px solid #ccc; cursor:pointer; }
        .user-item:hover { background:#d1ffd1; }
        .active { background:#a5d6a7 !important; }
    </style>
</head>
<body>

<div class="container">
    <!-- Chat Column -->
    <div class="chat-col">
        <div class="chat-header">
            
            <?php if($with ){
                $user_name = $con->query("SELECT uname FROM user WHERE uid=$with")->fetch_assoc()['uname'];
                echo " $role2 $user_name";
            } ?>
        </div>

        <div id="chat-box">
            <?php foreach($messages as $msg): ?>
                <div class="message <?php echo ($msg['sender_id']==$me)?'sent':'received'; ?>">
                    <?php echo htmlspecialchars($msg['message']); ?>
                    <div class="timestamp"><?php echo $msg['created_at']; ?></div>
                </div>
            <?php endforeach; ?>
        </div>

        <?php if($with): ?>
        <form method="post" action="send_message.php" class="chat-input">
            <input type="hidden" name="receiver_id" value="<?php echo $with; ?>">
            <textarea name="message" rows="1" placeholder="Type a message..." required></textarea>
            <button type="submit">&#9658;</button>
        </form>
        <?php endif; ?>
    </div>

    <!-- Users List Column -->
    <div class="users-col">
        <h3>People</h3>
        <?php while($user = $list_result->fetch_assoc()): ?>
            <div class="user-item <?php echo ($with==$user['uid'])?'active':''; ?>" 
                 onclick="window.location='chat.php?with=<?php echo $user['uid']; ?>'">
                <?php echo htmlspecialchars($user['uname']); ?>
            </div>
        <?php endwhile; ?>
    </div>
</div>

<script>
const chatBox = document.getElementById('chat-box');
chatBox.scrollTop = chatBox.scrollHeight;
</script>

</body>
</html>
