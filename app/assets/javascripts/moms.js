function handleMOMs () {
	const year = $('#year');
	const overFormat = $('#overFormat');

	year.change(() => {
		window.location.pathname = `/game-zone/moms/${year.val()}/${overFormat.val()}`
	});

	overFormat.change(() => {
		window.location.pathname = `/game-zone/moms/${year.val()}/${overFormat.val()}`
	})
}