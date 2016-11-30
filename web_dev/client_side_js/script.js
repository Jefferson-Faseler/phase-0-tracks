var arrStrong = document.getElementsByTagName('strong');

for (var i = 0; i < arrStrong.length; i++) {
  arrStrong[i].style.color = 'blue';
}

var getList = document.getElementById('elementstring')
var newListEl = document.createElement('li');
newListEl.appendChild(document.createTextNode('My goldfish is beautiful'));
getList.appendChild(newListEl);


function playDead() {
  var photo = document.getElementById('goldfish-photo');
  photo.setAttribute('class', 'rotated-goldfish');
}

function addRedBorder(event) {
  console.log('clicked it');
  event.target.style.border = '5px solid red';
}


document.getElementById("left").addEventListener("click", function(){
   this.style.backgroundColor = "red";
});