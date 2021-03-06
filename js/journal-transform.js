/* Inversion, Justification Switches */
/* Created for One More Voice by way of Livingstone Online by Nigel Banks */

// Wait till document is loaded before executing.
document.addEventListener("DOMContentLoaded", function(event) {
	// Select the button element using it's ID.
	document.querySelector('input#invert')
	// Call this function when the button is clicked.
	.onclick = function () {
		// Find the element with class transcription,
		// and toggle the class 'change-display'.
		document.querySelector('body.transcription')
		.classList
		.toggle('invert-color');
		var input = document.querySelector('input#invert')
		if (input.checked == true) {
			input.setAttribute('aria-checked', 'true');
			input.setAttribute('checked', '');
		} 
		else {
			input.setAttribute('aria-checked', 'false');
			input.removeAttribute('checked', '');
		}
	};
});

// Wait till document is loaded before executing.
document.addEventListener("DOMContentLoaded", function(event) {
	// Select the button element using it's ID.
	document.querySelector('input#remove-justification')
	// Call this function when the button is clicked.
	.onclick = function () {
		// Find the element with class transcription,
		// and toggle the class 'change-display'.
		document.querySelector('body.transcription')
		.classList
		.toggle('unjustify');
		var input = document.querySelector('input#remove-justification')
		if (input.checked == true) {
			input.setAttribute('aria-checked', 'true');
			input.setAttribute('checked', '');
		} 
		else {
			input.setAttribute('aria-checked', 'false');
			input.removeAttribute('checked', '');
		}
	};
});
