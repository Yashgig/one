<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>System Alert</title>
  <style>
    body {
      background-color: black;
      color: red;
      font-family: 'Courier New', Courier, monospace;
      text-align: center;
      padding-top: 20%;
      animation: flicker 1s infinite alternate;
    }

    h1 {
      font-size: 3rem;
      animation: blink 0.5s infinite;
    }

    @keyframes blink {
      0% { opacity: 1; }
      50% { opacity: 0.2; }
      100% { opacity: 1; }
    }

    @keyframes flicker {
      0% { text-shadow: 0 0 5px red; }
      100% { text-shadow: 0 0 20px red; }
    }
  </style>
</head>
<body>
  <h1>⚠️ Your Device is Being Hacked ⚠️</h1>
  <script>
    setTimeout(() => {
      alert("Security Breach Detected!");
    }, 2000);

    setTimeout(() => {
      document.body.innerHTML += "<h2>Transferring Data...</h2>";
    }, 4000);

    setTimeout(() => {
      document.body.innerHTML += "<h2>System Failure Imminent!</h2>";
    }, 6000);
  </script>
</body>
</html>
