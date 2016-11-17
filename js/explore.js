// Take a string as a parameter and then reverse the string
  // for each letter in the string print the letter behind it
// Steps: Take string into function as argument. 
//   In the function make the beginning variable the (string.length - 1)
//   stop iterating when the variable is greater than or equal to 0
//   increment down by 1
// output: log each iteration to the screen

var myString = 'sdrawkcab detnirp saw siht';

function reverseIt(string) {
  for (var i = (string.length -1); i >= 0; i--) {
    console.log(string[i]);
  }
}

reverseIt(myString);
// ==> 'this was printed backwards'

if (true === true) {
  var technicallyNotAPalindrome = 'race car ';
  reverseIt(technicallyNotAPalindrome);
} else {
  console.log('If this printed the world is torn in two');
}
//==> 'rac ecar'