function handlePointsTable () {
	const year = $('#year');
	const overFormat = $('#overFormat');

	year.change(() => {
		window.location.pathname = `/game-zone/points-table/${year.val()}/${overFormat.val()}`
	});

	overFormat.change(() => {
		window.location.pathname = `/game-zone/points-table/${year.val()}/${overFormat.val()}`
	})
}