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