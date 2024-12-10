function onPageTop() {
	window.scrollTo({ top : 0 });
}

function onPageBottom() {
	window.scrollTo({ top: document.body.scrollHeight });
}

function a() {
	fetch("http://localhost:9001/path")
	  .then((response) => response.json())
	  .then((data) => console.log(data));
}

const b = () => {
	const abc = [
		{
			"blogid": 5,
			    "title": "제목2",
			    "writer": "작성자2",
			    "content": "내용2",
			    "views": 0,
			    "likes": 0,
			    "category": "없음",
			    "datetime": "2024년 12월 07월 17시 17분"
		}
	];
	const a = [...abc];
	console.log(a.toString());
}