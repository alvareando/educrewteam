
function scrollLastMessageIntoView() {
  // const messages = document.querySelectorAll('.message');
  // const lastMessage = messages[messages.length - 1];
  // if (lastMessage) {
  //   lastMessage.scrollIntoView(false);
  // }

  var messagesContainer = document.querySelector(".messages");
  messagesContainer.scrollTop = messagesContainer.scrollHeight;
}

