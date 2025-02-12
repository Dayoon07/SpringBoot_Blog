let isUsernameAvailable = true;

// username 입력란에 대한 이벤트 리스너
document.getElementById('username').addEventListener('input', function() {
	var username = document.getElementById('username').value;

	// 사용자 이름 중복 여부를 체크
	fetch(`/check-username?username=${username}`)
		.then(response => response.json())
		.then(data => {
			isUsernameAvailable = data; // 중복 여부 상태 업데이트

			if (isUsernameAvailable) {
				document.getElementById('username-feedback').innerText = "사용 가능한 이름입니다.";
				document.getElementById('username-feedback').style.color = "green";
			} else {
				document.getElementById('username-feedback').innerText = "이미 사용 중인 이름입니다.";
				document.getElementById('username-feedback').style.color = "red";
			}
			if (document.getElementById('username').value == "") {
				document.getElementById('username-feedback').innerText = "이름을 입력해주세요.";
				document.getElementById('username-feedback').style.color = "red";
			}

		});
});

// 회원가입 폼 제출 시 중복된 이름이 있을 경우 제출을 막는 함수
document.querySelector('form').addEventListener('submit', function(event) {
	// 이름 중복 확인이 안 된 상태에서 폼을 제출하면 안 됨
	if (!isUsernameAvailable) {
		event.preventDefault(); // 폼 제출을 막음
		alert("이미 사용 중인 이름입니다. 다른 이름을 사용해주세요.");
	} else if (document.getElementById('username').value == "") {
		event.preventDefault();
		alert("이름을 입력해주세요.");
	} else if (document.getElementById('username').value.includes(' ')) {
		event.preventDefault();
		alert("이름에는 공백이 들어갈 수 없습니다.");
	}
});

function imgChk(event) {
	const file = event.target.files[0];
	const AllowedList = [".jpeg", ".jpg", ".png", ".tiff", ".webp"];
	const maxSize = 3 * 1024 * 1024; // 3MB

	if (file) {
		const fileExtension = file.name.substring(file.name.lastIndexOf('.')).toLowerCase();
		if (!AllowedList.includes(fileExtension)) {
			alert("허용되지 않은 이미지 형식입니다. (jpeg, jpg, png, tiff, webp만 가능)");
			event.target.value = "";
			return;
		}

		if (file.size > maxSize) {
			alert("이미지 업로드 최대는 3MB 입니다.");
			event.target.value = "";
			return;
		}
	}
}
