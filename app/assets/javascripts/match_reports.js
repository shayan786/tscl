function handleMatchReports () {
	const year = $('#year');
	const overFormat = $('#overFormat');

	year.change(() => {
		window.location.pathname = `/game/match-reports/${year.val()}/${overFormat.val()}`
	});

	overFormat.change(() => {
		window.location.pathname = `/game/match-reports/${year.val()}/${overFormat.val()}`
	})
}