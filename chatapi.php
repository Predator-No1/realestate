<?php
// Gemini chatbot in PHP with error handling

$apiKey = "AIzaSyCYyInwVCdeOZTc_YkYNSAfR4dXRwT1Z4M";  // replace with your Gemini API key
$model = "gemini-2.5-flash";
// Get user input
$userMessage = isset($_POST['message']) ? trim($_POST['message']) : "";

if ($userMessage) {
    // Build request data
    $data = [
        "contents" => [
            [
                "role"  => "user",
                "parts" => [
                    ["text" => $userMessage]
                ]
            ]
        ]
    ];

    // Send request to Gemini API
    $ch = curl_init("https://generativelanguage.googleapis.com/v1beta/models/$model:generateContent?key=$apiKey");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ["Content-Type: application/json"]);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));

    $response = curl_exec($ch);

    if (curl_errno($ch)) {
        // Show cURL errors (network issues)
        $answer = "cURL error: " . curl_error($ch);
    } else {
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $result = json_decode($response, true);

        if ($httpCode != 200) {
            // Show API error clearly
            $answer = "API error (HTTP $httpCode): " . $response;
        } elseif (isset($result['candidates'][0]['content']['parts'][0]['text'])) {
            // Normal response
            $answer = $result['candidates'][0]['content']['parts'][0]['text'];
        } else {
            // Show raw response if structure is unexpected
            $answer = "Unexpected response:\n" . json_encode($result, JSON_PRETTY_PRINT);
        }
    }

    curl_close($ch);
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Gemini Chatbot Debug</title>
</head>
<body>
    <h1>Gemini Chatbot (Debug Mode)</h1>

    <form method="post">
        <label>Ask something:</label><br>
        <input type="text" name="message" size="60" value="<?= htmlspecialchars($userMessage ?? '') ?>" required>
        <button type="submit">Send</button>
    </form>

    <?php if (!empty($answer)): ?>
        <h2>Answer:</h2>
        <pre><?= htmlspecialchars($answer) ?></pre>
    <?php endif; ?>
</body>
</html>
