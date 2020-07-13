$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});

function setYearAndOverFormat (year, overFormat) {
	const yearSelect = $('#year');
	const overFormatSelect = $('#overFormat');

	yearSelect.val(year)
	overFormatSelect.val(overFormat)
}