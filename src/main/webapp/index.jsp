<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Google Movies Booking</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

<!-- Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>
    body {
        margin: 0;
        font-family: 'Roboto', sans-serif;
        background: #f1f3f4;
    }

    /* Navbar */
    .navbar {
        background: #1a73e8;
        color: white;
        padding: 14px 25px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        font-size: 18px;
        font-weight: 500;
    }

    .navbar .left {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .material-icons {
        vertical-align: middle;
    }

    .container {
        max-width: 1100px;
        margin: 25px auto;
        padding: 20px;
    }

    /* Movie Grid */
    .movie-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 20px;
    }

    .movie-card {
        background: white;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        cursor: pointer;
        transition: 0.2s;
    }

    .movie-card:hover {
        transform: scale(1.03);
    }

    .movie-card img {
        width: 100%;
        height: 300px;
        object-fit: cover;
    }

    .movie-info {
        padding: 12px;
    }

    .movie-title {
        font-weight: 500;
        margin: 0;
        color: #202124;
    }

    .movie-tag {
        font-size: 12px;
        color: #5f6368;
        margin-top: 5px;
    }

    /* Booking Card */
    .card {
        background: white;
        padding: 20px;
        margin-top: 25px;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    }

    select {
        width: 100%;
        padding: 12px;
        margin-top: 8px;
        margin-bottom: 15px;
        border-radius: 8px;
        border: 1px solid #dadce0;
        font-size: 14px;
    }

    /* Seats */
    .seats {
        display: grid;
        grid-template-columns: repeat(8, 1fr);
        gap: 10px;
        margin-top: 10px;
    }

    .seat {
        background: #e8eaed;
        padding: 10px;
        text-align: center;
        border-radius: 6px;
        cursor: pointer;
        font-size: 12px;
    }

    .seat.selected {
        background: #1a73e8;
        color: white;
    }

    .btn {
        background: #1a73e8;
        color: white;
        padding: 12px;
        border: none;
        width: 100%;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
    }

    .summary {
        font-size: 14px;
        color: #3c4043;
        line-height: 1.6;
    }
</style>
</head>

<body>

<div class="navbar">
    <div class="left">
        <span class="material-icons">movie</span>
        Google Movies
    </div>
    <div>
        <span class="material-icons">confirmation_number</span>
        Book Tickets
    </div>
</div>

<div class="container">

    <!-- Movies -->
    <h2>Now Showing</h2>
    <div class="movie-grid">

        <div class="movie-card" onclick="selectMovie('Avengers: Endgame')">
            <img src="https://m.media-amazon.com/images/I/81ExhpBEbHL._AC_SL1500_.jpg">
            <div class="movie-info">
                <p class="movie-title">Avengers: Endgame</p>
                <p class="movie-tag">Action • Marvel</p>
            </div>
        </div>

        <div class="movie-card" onclick="selectMovie('Inception')">
            <img src="https://m.media-amazon.com/images/I/51s+z7kQ6GL._AC_.jpg">
            <div class="movie-info">
                <p class="movie-title">Inception</p>
                <p class="movie-tag">Sci-Fi • Thriller</p>
            </div>
        </div>

        <div class="movie-card" onclick="selectMovie('Interstellar')">
            <img src="https://m.media-amazon.com/images/I/71n58hO7J1L._AC_SL1178_.jpg">
            <div class="movie-info">
                <p class="movie-title">Interstellar</p>
                <p class="movie-tag">Sci-Fi • Drama</p>
            </div>
        </div>

        <div class="movie-card" onclick="selectMovie('Spider-Man')">
            <img src="https://m.media-amazon.com/images/I/71niXI3lxlL._AC_SL1024_.jpg">
            <div class="movie-info">
                <p class="movie-title">Spider-Man</p>
                <p class="movie-tag">Action • Marvel</p>
            </div>
        </div>

    </div>

    <!-- Booking -->
    <div class="card">
        <h2><span class="material-icons">event_seat</span> Book Tickets</h2>

        <label>Selected Movie</label>
        <select id="movie"></select>

        <label>Show Time</label>
        <select id="time">
            <option>10:00 AM</option>
            <option>1:30 PM</option>
            <option>6:00 PM</option>
            <option>9:30 PM</option>
        </select>

        <h3>Select Seats</h3>
        <div class="seats" id="seatContainer"></div>
    </div>

    <!-- Summary -->
    <div class="card">
        <h2><span class="material-icons">receipt</span> Summary</h2>
        <div class="summary" id="summary">No booking yet</div>
        <br>
        <button class="btn" onclick="bookTickets()">
            <span class="material-icons">check_circle</span> Book Now
        </button>
    </div>

</div>

<script>
    const seatContainer = document.getElementById("seatContainer");
    const summary = document.getElementById("summary");
    const movieSelect = document.getElementById("movie");

    let selectedSeats = [];
    let currentMovie = "Avengers: Endgame";

    function selectMovie(name) {
        currentMovie = name;
        movieSelect.innerHTML = `<option>${name}</option>`;
        updateSummary();
    }

    // default movie
    selectMovie(currentMovie);

    // create seats
    for (let i = 1; i <= 40; i++) {
        let seat = document.createElement("div");
        seat.classList.add("seat");
        seat.innerText = i;

        seat.addEventListener("click", () => {
            if (selectedSeats.includes(i)) {
                selectedSeats = selectedSeats.filter(s => s !== i);
                seat.classList.remove("selected");
            } else {
                selectedSeats.push(i);
                seat.classList.add("selected");
            }
            updateSummary();
        });

        seatContainer.appendChild(seat);
    }

    function updateSummary() {
        if (selectedSeats.length === 0) {
            summary.innerText = "No seats selected";
            return;
        }

        summary.innerHTML = `
            🎬 Movie: ${currentMovie} <br>
            ⏰ Time: ${document.getElementById("time").value} <br>
            💺 Seats: ${selectedSeats.join(", ")} <br>
            💰 Total: ₹${selectedSeats.length * 150}
        `;
    }

    function bookTickets() {
        if (selectedSeats.length === 0) {
            alert("Please select seats first!");
            return;
        }

        alert("Booking Confirmed 🎉 Enjoy your movie!");

        selectedSeats = [];
        document.querySelectorAll(".seat").forEach(s => s.classList.remove("selected"));
        updateSummary();
    }
</script>

</body>
</html>
