import consumer from "./consumer"

const fetchChannel = consumer.subscriptions.create("FetchChannel", {
  connected() {
    console.log('connected')
    fetchChannel.send({ action: 'send_rate' })
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var newDiv = document.createElement("div");
    newDiv.setAttribute("id", "rate");
    newDiv.innerHTML = `<h1>Actual USD Rate: ${data['rate']}</h1>`
    var oldDiv = document.getElementById("rate")
    var parent = oldDiv.parentNode
    parent.replaceChild(newDiv, oldDiv)
  }
});
