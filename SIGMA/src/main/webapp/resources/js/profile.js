function openDropModal() {
	const modal = document.getElementById("dropAccountModal");
	modal.classList.remove("hidden");

	const form = document.getElementById("dropAccountForm");
	form.classList.remove("hidden");
}
document.addEventListener("keydown", (e) => {
	if (e.key === "Escape") {
		document.getElementById("dropAccountModal").classList.add("hidden");
		document.getElementById("dropAccountForm").classList.add("hidden");
	}
});
document.getElementById("dropAccountModal").addEventListener("click", () => {
	document.getElementById("dropAccountModal").classList.add("hidden");
	document.getElementById("dropAccountForm").classList.add("hidden");
});
function cancelDropAccount() {
	document.getElementById("dropAccountModal").classList.add("hidden");
	document.getElementById("dropAccountForm").classList.add("hidden");
}