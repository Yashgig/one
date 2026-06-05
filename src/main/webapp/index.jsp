<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>MovieFlix Booking</title>

<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>
    body {
        margin: 0;
        font-family: 'Roboto', sans-serif;
        background: #0b0b0f;
        color: white;
    }

    /* Top Navbar */
    .navbar {
        position: sticky;
        top: 0;
        background: rgba(0,0,0,0.9);
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 14px 25px;
        z-index: 10;
        border-bottom: 1px solid #222;
    }

    .logo {
        font-size: 22px;
        font-weight: 700;
        color: #e50914;
        letter-spacing: 1px;
    }

    .nav-icons {
        display: flex;
        gap: 15px;
        align-items: center;
    }

    .material-icons {
        cursor: pointer;
        color: #fff;
    }

    /* Hero Banner */
    .hero {
        height: 60vh;
        background: url("https://images.unsplash.com/photo-1524985069026-dd778a71c7b4") center/cover no-repeat;
        display: flex;
        align-items: flex-end;
        padding: 40px;
        position: relative;
    }

    .hero::after {
        content: "";
        position: absolute;
        inset: 0;
        background: linear-gradient(to top, #0b0b0f, rgba(0,0,0,0.2));
    }

    .hero-content {
        position: relative;
        max-width: 500px;
    }

    .hero h1 {
        font-size: 40px;
        margin: 0;
    }

    .hero p {
        color: #ccc;
        font-size: 14px;
    }

    .btn {
        margin-top: 10px;
        background: #e50914;
        border: none;
        padding: 10px 18px;
        color: white;
        font-weight: bold;
        border-radius: 6px;
        cursor: pointer;
    }

    /* Movie Row */
    .section {
        padding: 20px;
    }

    .row-title {
        margin: 10px 0;
        font-size: 18px;
        font-weight: 500;
    }

    .movie-row {
        display: flex;
        overflow-x: auto;
        gap: 15px;
        padding-bottom: 10px;
    }

    .movie-row::-webkit-scrollbar {
        display: none;
    }

    .movie-card {
        min-width: 180px;
        background: #1a1a1f;
        border-radius: 10px;
        overflow: hidden;
        cursor: pointer;
        transition: 0.3s;
    }

    .movie-card:hover {
        transform: scale(1.08);
    }

    .movie-card img {
        width: 100%;
        height: 260px;
        object-fit: cover;
    }

    .movie-info {
        padding: 10px;
    }

    .movie-title {
        font-size: 14px;
        margin: 0;
    }

    .tag {
        font-size: 12px;
        color: #aaa;
    }

    /* Booking Panel */
    .panel {
        background: #141414;
        padding: 20px;
        margin: 20px;
        border-radius: 12px;
    }

    select {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border-radius: 6px;
        border: none;
        background: #222;
        color: white;
    }

    .seats {
        display: grid;
        grid-template-columns: repeat(10, 1fr);
        gap: 8px;
        margin-top: 10px;
    }

    .seat {
        background: #2a2a2a;
        padding: 8px;
        text-align: center;
        border-radius: 5px;
        font-size: 12px;
        cursor: pointer;
    }

    .seat.selected {
        background: #e50914;
    }

    .summary {
        margin-top: 10px;
        color: #ccc;
        font-size: 14px;
    }
</style>
</head>

<body>

<!-- Navbar -->
<div class="navbar">
    <div class="logo">MOVIEFLIX</div>
    <div class="nav-icons">
        <span class="material-icons">search</span>
        <span class="material-icons">person</span>
    </div>
</div>

<!-- Hero -->
<div class="hero">
    <div class="hero-content">
        <h1>Unlimited Movies</h1>
        <p>Book your tickets instantly with premium cinema experience</p>
        <button class="btn" onclick="scrollToBooking()">Book Now</button>
    </div>
</div>

<!-- Movies -->
<div class="section">
    <div class="row-title">🔥 Trending Now</div>

    <div class="movie-row">
        <div class="movie-card" onclick="selectMovie('Avengers Endgame')">
            <img src="https://m.media-amazon.com/images/I/81ExhpBEbHL._AC_SL1500_.jpg">
            <div class="movie-info">
                <p class="movie-title">Avengers</p>
                <p class="tag">Action</p>
            </div>
        </div>

        <div class="movie-card" onclick="selectMovie('Inception')">
            <img src="https://m.media-amazon.com/images/I/51s+z7kQ6GL._AC_.jpg">
            <div class="movie-info">
                <p class="movie-title">Inception</p>
                <p class="tag">Sci-Fi</p>
            </div>
        </div>

        <div class="movie-card" onclick="selectMovie('Interstellar')">
            <img src="https://m.media-amazon.com/images/I/71n58hO7J1L._AC_SL1178_.jpg">
            <div class="movie-info">
                <p class="movie-title">Interstellar</p>
                <p class="tag">Drama</p>
            </div>
        </div>

        <div class="movie-card" onclick="selectMovie('Spider-Man')">
            <img src="https://m.media-amazon.com/images/I/71niXI3lxlL._AC_SL1024_.jpg">
            <div class="movie-info">
                <p class="movie-title">Spider-Man</p>
                <p class="tag">Action</p>
            </div>
        </div>
    </div>
</div>

<!-- Booking -->
<div class="panel" id="booking">
    <h2>🎟 Book Tickets</h2>

    <select id="movie"></select>
    <select id="time">
        <option>10:00 AM</option>
        <option>1:30 PM</option>
        <option>6:00 PM</option>
        <option>9:30 PM</option>
    </select>

    <div class="seats" id="seats"></div>

    <div class="summary" id="summary">No seats selected</div>
</div>

<script>
let selectedSeats = [];
let currentMovie = "Avengers Endgame";

const seatsDiv = document.getElementById("seats");
const summary = document.getElementById("summary");
const movieSelect = document.getElementById("movie");

function scrollToBooking(){
    document.getElementById("booking").scrollIntoView({behavior:"smooth"});
}

function selectMovie(name){
    currentMovie = name;
    movieSelect.innerHTML = `<option>${name}</option>`;
    scrollToBooking();
    updateSummary();
}

selectMovie(currentMovie);

// seats
for(let i=1;i<=50;i++){
    let seat = document.createElement("div");
    seat.className = "seat";
    seat.innerText = i;

    seat.onclick = () => {
        if(selectedSeats.includes(i)){
            selectedSeats = selectedSeats.filter(s => s !== i);
            seat.classList.remove("selected");
        } else {
            selectedSeats.push(i);
            seat.classList.add("selected");
        }
        updateSummary();
    };

    seatsDiv.appendChild(seat);
}

function updateSummary(){
    if(selectedSeats.length === 0){
        summary.innerText = "No seats selected";
        return;
    }

    summary.innerHTML = `
        🎬 ${currentMovie} <br>
        ⏰ ${document.getElementById("time").value} <br>
        💺 Seats: ${selectedSeats.join(", ")} <br>
        💰 Total: ₹${selectedSeats.length * 180}
    `;
}
</script>

</body>
</html>
