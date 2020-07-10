function handleFixtures () {
	const year = $('#year');
	const overFormat = $('#overFormat');

	year.change(() => {
		window.location.pathname = `/game-zone/fixtures/${year.val()}/${overFormat.val()}`
	});

	overFormat.change(() => {
		window.location.pathname = `/game-zone/fixtures/${year.val()}/${overFormat.val()}`
	})
}