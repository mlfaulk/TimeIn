count = 60;

function appearNextButton() {
	console.log("in appear fn");
	var btn = document.getElementById("chillPageNextBtn");
	var testbtn = document.getElementById("timer");
	
	testbtn.style.visibility="hidden";
	btn.style.visibility = "visible";
	
}

function updateTimer() {
	console.log("in update fn");
	var timer = document.getElementById("timer");
	count--;
	console.log("count: " + count);
	var min = Math.floor(count/60);
	var sec = count-(min*60);
	console.log("min: " + min);
	console.log("sec: " + sec);
	if (sec < 10) {
		timer.innerHTML=min+":0"+sec;
	} else {
		timer.innerHTML=min+":"+sec;
	}
	if (count==0) {
		clearInterval(token);
	}
}