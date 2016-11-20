
// RELEASE 0
// function that takes an array of words or phrases and 
// returns the longest word or phrase. 
// Steps: create for loop with conditional logic inside
// ==> for loop compares each element within the array to
// ==> each other element.
// output: return longest element

// conditional logic within the for loop
// steps: If var is less than current element reassign var.
// ==> Move on to next element.
// output: return var with stored element

// RELEASE 1
// write a function that takes two objects and checks
// if the objects shair at least one key/value pair
// Steps: create loop with conditional logic inside
// ==> compares each key/value pair within an object based upon
// ==> the first object's keys
// ==> compares to each other key/value pair within another object
// output: return true or false
  // for loop uses keys of only the first object
  // returns true on match
  // else it returns false

// RELEASE 2
// function that takes integer as length to give array of strings
// steps: function takes integer as parameter and outputs
// ==> array with equal length to the integer
// ==> containing only random strings
// output: array of strings of the given length


function elementLength(array) {
  for (var i = 0; i < array.length; i++) {
    var longest = array[0];
    if (longest <= array[i]) {
      longest = array[i];
    } 
  } return longest;
}


var objectMatcher = function (firstObject, secondObject) {
  for (key in firstObject) {
    if (firstObject[key] == secondObject[key]) {
      return true; 
    } 
  } return false;
}


var gibberishDispenser = function (integer) {
  var gibberishArray = [];
  var gibberish = ''
  var possibleLetters = 'abcdefghijklmnopqrstuvwxyz';
    for (var i = 0; i < integer; i++) {
      gibberish += (possibleLetters.charAt(Math.floor(Math.random() * 26)));
      gibberishArray.push(gibberish);
    }
  return gibberishArray;
}

var deskItems = ['Mouse', 'Keyboard', 'Clock', 'Computer',
'Memo Book', 'Candle', 'Mousepad', 'Photo of Family'];
var colorShapes = { square: 'red', triangle: 'yellow', circle: 'blue'};
var nasaLogo = { nasaLetters: 'white', circle: 'blue', chevron: 'red', 
stars: 'white', ring: 'white'};
var toilet = { bowl: 'white', tank: 'white', ring: 'white', base: 'white'};



// DRIVER CODE //
console.log(elementLength(deskItems));
// ==> Photo of Family

console.log(objectMatcher(colorShapes, nasaLogo));
// ==> true
console.log(objectMatcher(colorShapes, toilet));
// ==> false
console.log(objectMatcher(nasaLogo, toilet));
// ==> true

// Printed arrays fed through 'longest word' function
console.log(elementLength(gibberishDispenser(3)));
// ==>
console.log(elementLength(gibberishDispenser(4)));
// ==>
console.log(elementLength(gibberishDispenser(5)));
// ==>
console.log(elementLength(gibberishDispenser(6)));
// ==>
console.log(elementLength(gibberishDispenser(7)));
// ==>
console.log(elementLength(gibberishDispenser(8)));
// ==>
console.log(elementLength(gibberishDispenser(9)));
// ==>
console.log(elementLength(gibberishDispenser(10)));
// ==>
console.log(elementLength(gibberishDispenser(10)));
// ==>
console.log(elementLength(gibberishDispenser(10)));