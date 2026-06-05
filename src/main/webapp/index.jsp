<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Movie Ticket Booking</title>

<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

<style>
    body {
        margin: 0;
        font-family: 'Roboto', sans-serif;
        background: #f1f3f4;
    }

    /* Top Bar */
    .navbar {
        background: #1a73e8;
        color: white;
        padding: 15px 25px;
        font-size: 20px;
        font-weight: 500;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .container {
        max-width: 1000px;
        margin: 30px auto;
        padding: 20px;
    }

    /* Card UI */
    .card {
        background: white;
        border-radius: 12px;
        padding: 20px;
        margin-bottom: 20px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    }

    h2 {
        margin-top: 0;
        color: #202124;
    }

    select, input {
        width: 100%;
        padding: 12px;
        margin-top: 8px;
        margin-bottom: 15px;
        border-radius: 8px;
        border: 1px solid #dadce0;
        outline: none;
        font-size: 14px;
    }

    select:focus, input:focus {
        border-color: #1a73e8;
    }

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
        transition: 0.2s;
    }

    .btn:hover {
        background: #1558c0;
    }

    .summary {
        font-size: 14px;
        color: #3c4043;
    }
</style>
</head>

<body>

<div class="navbar">
    🎬 Google Movies
    <div>Book Tickets</div>
</div>

<div class="container">

    <!-- Movie Selection -->
    <div class="card">
        <h2>Select Movie</h2>
        <select id="movie">
            <option>Avengers: Endgame</option>
            <option>Spider-Man: No Way Home</option>
            <option>Interstellar</option>
            <option>Inception</option>
        </select>

        <h2>Select Time</h2>
        <select id="time">
            <option>10:00 AM</option>
            <option>1:30 PM</option>
            <option>6:00 PM</option>
            <option>9:30 PM</option>
        </select>
    </div>

    <!-- Seat Selection -->
    <div class="card">
        <h2>Select Seats</h2>
        <div class="seats" id="seatContainer"></div>
    </div>

    <!-- Booking Summary -->
    <div class="card">
        <h2>Summary</h2>
        <div class="summary" id="summary">
            No seats selected
        </div>
        <br>
        <button class="btn" onclick="bookTickets()">Book Now</button>
    </div>

</div>

<script>
    const seatContainer = document.getElementById("seatContainer");
    const summary = document.getElementById("summary");

    let selectedSeats = [];

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
            Movie: ${document.getElementById("movie").value} <br>
            Time: ${document.getElementById("time").value} <br>
            Seats: ${selectedSeats.join(", ")} <br>
            Total: ₹${selectedSeats.length * 150}
        `;
    }

    function bookTickets() {
        if (selectedSeats.length === 0) {
            alert("Please select seats first!");
            return;
        }

        alert("Booking Confirmed! Enjoy your movie 🎉");
        selectedSeats = [];
        document.querySelectorAll(".seat").forEach(s => s.classList.remove("selected"));
        updateSummary();
    }
</script>

</body>
</html>
