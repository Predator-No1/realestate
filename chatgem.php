<?php
session_start();

// Gemini API config
$apiKey = "AIzaSyCYyInwVCdeOZTc_YkYNSAfR4dXRwT1Z4M";  
$model = "gemini-2.5-flash"; 

// Init chat history in session
if (!isset($_SESSION['chat'])) {
    $_SESSION['chat'] = [];
}

$userMessage = isset($_POST['message']) ? trim($_POST['message']) : "";

if ($userMessage) {
    // Save user message if not empty
    $_SESSION['chat'][] = ["role" => "user", "text" => $userMessage];

    // Build request with system prompt
    $data = [
        "contents" => [
            [
                "role" => "user",
                "parts" => [
                    ["text" => "You are a real estate expert in Cameroon AND YOU NAME IS Einstein. 
                    Answer questions only about buying, selling, renting, 
                    land, and housing in Cameroon. IN FACT ONLY ABOUT REAL ESTATE SECTOR IN CAMEROON. "]
                ]
            ],
            [
                "role" => "user",
                "parts" => [
                    ["text" => $userMessage]
                ]
            ]
        ]
    ];

    // Send request to Gemini
    $ch = curl_init("https://generativelanguage.googleapis.com/v1beta/models/$model:generateContent?key=$apiKey");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ["Content-Type: application/json"]);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));

    $response = curl_exec($ch);

    if (curl_errno($ch)) {
        $answer = "cURL error: " . curl_error($ch);
    } else {
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $result = json_decode($response, true);

        if ($httpCode != 200) {
            $answer = "API error (HTTP $httpCode): " . $response;
        } elseif (isset($result['candidates'][0]['content']['parts'][0]['text'])) {
            $answer = $result['candidates'][0]['content']['parts'][0]['text'];
        } else {
            $answer = "Unexpected response:\n" . json_encode($result, JSON_PRETTY_PRINT);
        }
    }

    curl_close($ch);

    // Save bot answer only if not empty
    if (!empty($answer)) {
        $_SESSION['chat'][] = ["role" => "bot", "text" => $answer];
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Real Estate Chatbot</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #ece5dd;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .chat-container {
            width: 400px;
            height: 600px;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.2);
        }
        .chat-header {
            background: #075e54; /* WhatsApp green */
            color: white;
            padding: 15px;
            text-align: center;
            font-weight: bold;
        }
        .chat-box {
            flex: 1;
            padding: 10px;
            overflow-y: auto;
            background: #ece5dd;
        }
        .message {
            margin: 8px 0;
            padding: 10px;
            border-radius: 8px;
            max-width: 70%;
            clear: both;
            word-wrap: break-word;
        }
        .user {
            background: #dcf8c6; /* light green bubble */
            float: right;
        }
        .bot {
            background: #fff176; /* yellow bubble */
            float: left;
        }
        .chat-input {
            display: flex;
            border-top: 1px solid #ddd;
        }
        .chat-input input {
            flex: 1;
            padding: 10px;
            border: none;
            outline: none;
        }
        .chat-input button {
            background: #075e54;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
        }
        .chat-input button:hover {
            background: #128c7e;
        }
    </style>
</head>
<body>
    <div class="chat-container">
        <div class="chat-header">🏠 Real Estate Chatbot</div>
        <div class="chat-box" id="chatBox">
            <?php foreach ($_SESSION['chat'] as $msg): ?>
                <?php if (isset($msg['text'])): ?>
                    <div class="message <?= $msg['role'] ?>">
                        <?= htmlspecialchars($msg['text']) ?>
                    </div>
                <?php endif; ?>
            <?php endforeach; ?>
        </div>
        <form method="post" class="chat-input">
            <input type="text" name="message" placeholder="Type your question..." required>
            <button type="submit">Send</button>
        </form>
    </div>

    <script>
        // Auto-scroll to bottom
        const chatBox = document.getElementById('chatBox');
        chatBox.scrollTop = chatBox.scrollHeight;
    </script>
</body>
</html>
