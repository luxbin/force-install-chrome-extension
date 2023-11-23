addEventListener('load', () => {
	if (location.host !== 'policy') return;

	const reload = () => {
		const button = document.querySelector('#reload-policies');

		if (button) {
			button.click();
			setTimeout(close, 200);
		} else {
			setTimeout(reload, 200);
		}
	}

	reload();
});