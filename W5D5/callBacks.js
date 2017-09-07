// setTimeout(function() {alert('Hello');}, 3000)

window.setTimeout(function() {alert('HAMMERTIME');}, 5000)

const hammerTime = function hammerTime(time) {
  window.setTimeout(function() {
    alert('${time} id hammertime!');
  })
};
