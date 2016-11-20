
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
    } else {
      return false;
    }
  }
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