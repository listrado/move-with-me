
const initShowMessageLink = () => {
	const link = document.getElementById('link');
	
	link.addEventListener('click', (event) => {
	    alert('send this link to a friend: ' + window.location.href)
	});
};

export {
  initShowMessageLink
};