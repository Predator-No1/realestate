<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
<style>
  
  

  /* Overlay for blur effect */
  .overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    backdrop-filter: blur(6px);
    background: rgba(0, 0, 0, 0.3);
    display: none;
    justify-content: center;
    align-items: center;
    z-index: 100;
  }

  /* Chat popup */
  .chat-popup {
    position: relative;
    width: 450px;
    height: 500px;
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 25px rgba(0,0,0,0.2);
    overflow: hidden;
    animation: fadeIn 0.3s ease;
  }

  /* Animation */
  @keyframes fadeIn {
    from { transform: scale(0.9); opacity: 0; }
    to { transform: scale(1); opacity: 1; }
  }

  /* Close (X) button */
  .close-btn {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 22px;
    color: #333;
    cursor: pointer;
    z-index: 10;
  }

  .close-btn:hover {
    color: red;
  }

  iframe {
    width: 100%;
    height: 100%;
    border: none;
  }
</style>
</head>
<body>
  <div class="dashboard">
    <h1>Welcome to Your Dashboard</h1>
    <a href="#" class="discuss-link" onclick="openChat(event)">Discuss</a>
  </div>

  <!-- Floating chat popup -->
  <div class="overlay" id="chatOverlay">
    <div class="chat-popup">
      <span class="close-btn" onclick="closeChat()">&times;</span>
      <iframe src="chat.php"></iframe>
    </div>
  </div>

  <script>
    function openChat(event) {
      event.preventDefault();
      document.getElementById('chatOverlay').style.display = 'flex';
    }

    function closeChat() {
      document.getElementById('chatOverlay').style.display = 'none';
    }
  </script>
</body>
</html>
