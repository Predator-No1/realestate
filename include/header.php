<style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      transition: filter 0.3s ease;
    }

    body.modal-active #dashboard-content {
      filter: blur(5px);
    }

    #chatbot-modal {
      position: fixed;
      top: 0; left: 0;
      width: 100vw;
      height: 100vh;
      background: rgba(0, 0, 0, 0.4);
      display: none;
      justify-content: center;
      align-items: center;
      z-index: 9999;
    }

    #chatbot-box {
      width: 400px;
      height: 600px;
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(0,0,0,0.3);
      position: relative;
      overflow: hidden;
    }

    #close-btn {
      position: absolute;
      top: 10px;
      right: 15px;
      font-size: 24px;
      cursor: pointer;
      z-index: 1;
    }

    iframe {
      width: 100%;
      height: 100%;
      border: none;
    }

    a.discuss-link {
      color: #007bff;
      text-decoration: none;
      font-weight: bold;
      cursor: pointer;
    }



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

  </style>
<header id="header" class="transparent-header-modern fixed-header-bg-white w-100">
            <div class="top-header bg-secondary">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <ul class="top-contact list-text-white  d-table">
                                <li><a href="#"><i class="fas fa-phone-alt text-success mr-1"></i>+237 698 73 35 50</a></li>
                                <li><a href="#"><i class="fas fa-envelope text-success mr-1"></i>merliss-iai-dev@gmail.com</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <div class="top-contact float-right">
                                <ul class="list-text-white d-table">
								<li><i class="fas fa-user text-success mr-1"></i>
								<?php  if(isset($_SESSION['uemail']))
								{ ?>
								<a href="logout.php">Logout</a>&nbsp;&nbsp;<?php } else { ?>
								<a href="login.php">Login</a>&nbsp;&nbsp;
								
								| </li>
								<li><i class="fas fa-user-plus text-success mr-1"></i><a href="register.php"> Register</li><?php } ?>
								</ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-nav secondary-nav hover-success-nav py-2">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <nav class="navbar navbar-expand-lg navbar-light p-0"> <a class="navbar-brand position-relative" href="index.php"><img class="nav-logo" src="images/logo/restatelg.png" alt=""></a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item dropdown"> <a class="nav-link" href="index.php" role="button" aria-haspopup="true" aria-expanded="false">Home</a></li>
										
										<li class="nav-item"> <a class="nav-link" href="about.php">About</a> </li>
										
                                        <li class="nav-item"> <a class="nav-link" href="contact.php">Contact</a> </li>										
										
                                        <li class="nav-item"> <a class="nav-link" href="property.php">Properties</a> </li>
                                        
                                        <li class="nav-item"> <a class="nav-link" href="agent.php">Agent</a> </li>
                                        <?php 
                                        if (isset($_SESSION['uid'])) {?>
                                            <li class="nav-item"> <a href="#" class="nav-link"  onclick="openChatbot(event)" >chatbot</a> </li>

                                        <li class="nav-item"> <a class="nav-link" href="chat.php" onclick="openChat(event)" >Discussion</a> </li>
                                       <?php
                                           
                                        }?>


                                        
                                       

										
										<?php  if(isset($_SESSION['uemail']))
										{ ?>
										<li class="nav-item dropdown">
											<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My Account</a>
											<ul class="dropdown-menu">
												<li class="nav-item"> <a class="nav-link" href="profile.php">Profile</a> </li>
                                                
												<!-- <li class="nav-item"> <a class="nav-link" href="request.php">Property Request</a> </li> -->
												<li class="nav-item"> <a class="nav-link" href="feature.php">Your Property</a> </li>
												<li class="nav-item"> <a class="nav-link" href="logout.php">Logout</a> </li>	
											</ul>
                                        </li>
										<?php } else { ?>
										<li class="nav-item"> <a class="nav-link" href="login.php">Login/Register</a> </li>
										<?php } ?>
										
                                    </ul>
                                    
									
									<a class="btn btn-success d-none d-xl-block" style="border-radius:30px;" href="submitproperty.php">Submit Peoperty</a> 
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            



<script>
document.getElementById('open-chat').addEventListener('click', function(){
    const chatList = document.getElementById('chat-list');
    chatList.style.display = 'block';
    fetch('get_chat_list.php')
        .then(response => response.text())
        .then(data => {
            chatList.innerHTML = data;
        });
});


//addd
function openChatbot(e) {
    e.preventDefault(); // prevent link navigation
    document.getElementById('chatbot-modal').style.display = 'flex';
    document.body.classList.add('modal-active');
  }

  function closeChatbot() {
    document.getElementById('chatbot-modal').style.display = 'none';
    document.body.classList.remove('modal-active');
  }



   function openChat(event) {
      event.preventDefault();
      document.getElementById('chatOverlay').style.display = 'flex';
    }

    function closeChat() {
      document.getElementById('chatOverlay').style.display = 'none';
    }
</script>

<!-- addd-->
 
<div id="chatbot-modal">
  <div id="chatbot-box">
    <div id="close-btn" onclick="closeChatbot()">×</div>
    <iframe src="chatbot.php"></iframe>
  </div>
</div>

 <!-- Floating chat popup -->
  <div class="overlay" id="chatOverlay">
    <div class="chat-popup">
      <span class="close-btn" onclick="closeChat()">&times;</span>
      <iframe src="chat.php"></iframe>
    </div>
  </div>


</header>