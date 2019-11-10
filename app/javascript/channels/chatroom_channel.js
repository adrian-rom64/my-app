import consumer from "./consumer"
import $ from 'jquery'

const scrollBottom = () => {
  const messages = document.getElementById('messages')
  messages.scrollTop = messages.scrollHeight
}

consumer.subscriptions.create("ChatroomChannel", {
  connected() {

  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data.content)
    $('#messages').append(data.content)
    $('#message-input').val('')
    scrollBottom()
  }
});
