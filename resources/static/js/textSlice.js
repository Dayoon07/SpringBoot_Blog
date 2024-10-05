document.addEventListener("DOMContentLoaded", function() {
	const blogTitles = document.querySelectorAll('.blogTitle');
	const blogContents = document.querySelectorAll('.blogContent');
	
	blogTitles.forEach(title => {
		if (title.textContent.length >= 15) {
			title.textContent = title.textContent.slice(0, 10) + "...";
		}
	});
	
	blogContents.forEach(content => {
		if (content.textContent.length >= 50) {
			content.textContent = content.textContent.slice(0, 50) + "...";
		}
	});
});