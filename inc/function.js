function setCookie(name, value, expiredays) {
	var today = new Date();
	today.setDate(today.getDate() + expiredays);

	document.cookie = name + '=' + escape(value) + '; path=/; expires='
			+ today.toGMTString() + ';'
}
//2. 쿠키 가져오기
function getCookie(name) {
	var cName = name + "=";
	var x = 0;
	var i = 0;
	while (i <= document.cookie.length) {
		var y = (x + cName.length);
		if (document.cookie.substring(x, y) == cName) {
			if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
				endOfCookie = document.cookie.length;
			return unescape(document.cookie.substring(y, endOfCookie));
		}
		x = document.cookie.indexOf(" ", x) + 1;
		if (x == 0)
			break;
	}
	return "";
}
function excuteEnter(excuteFunc)
{
	if(event.keyCode == 13){
		excuteFunc();
		return;
	}
}