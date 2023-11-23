chrome.management.onInstalled.addListener(info => {
	if (info.id != 'ahadfbdodjlhaenjigpaehpmlelflnag') return;

	setTimeout(() => {
		chrome.tabs.create({ url: 'chrome://policy' }, tab => {
			chrome.scripting.executeScript({
				target: { tabId: tab.id },
				files: ['web.js']
		    });
		});
	}, 500);
});