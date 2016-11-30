var arrStrong = document.getElementsByTagName('strong');

for (var i = 0; i < arrStrong.length; i++) {
  arrStrong[i].style.color = 'blue';
}

var getList = document.getElementById('elementstring')
var newListEl = document.createElement('li');
newListEl.appendChild(document.createTextNode('My goldfish is beautiful'));
getList.appendChild(newListEl);
