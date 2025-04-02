$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});

function setYearAndOverFormat (year, overFormat) {
	const yearSelect = $('#year');
	const overFormatSelect = $('#overFormat');

	yearSelect.val(year)
	overFormatSelect.val(overFormat)
}

function adminMenuToggle () {
	const adminItem = $('#admin')
	const items = $('.actions__items')

	adminItem.click((e) => {
		e.preventDefault();
		items.fadeToggle();
		items.css('display', 'flex');
		items.css('background-color', '#121212');
	})
}

function showCurrentTime () {
	updateTime()
	setInterval(() => {
		updateTime()
	}, 15000)
}

function updateTime () {
	const currentTime = new Date().toLocaleTimeString();
	const timeEl = $('.currentTime');
	timeEl.html(currentTime);
}

function loadLiveScore () {
	$('#liveScore').load('https://cricclubs.com/TSCL1 #resultsDiv');
}