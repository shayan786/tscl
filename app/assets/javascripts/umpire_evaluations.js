function handleUmpireEvals () {
	const year = $('#year');
	const overFormat = $('#overFormat');

	year.change(() => {
		window.location.pathname = `/game/umpire-evaluations/${year.val()}/${overFormat.val()}`
	});

	overFormat.change(() => {
		window.location.pathname = `/game/umpire-evaluations/${year.val()}/${overFormat.val()}`
	})
}