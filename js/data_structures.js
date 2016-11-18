var horseColors = ['blue', 'green', 'red', 'yellow'];
var horseNames = ['Ed', 'Ned', 'Ted', 'Jed'];
var horses = {};

horseColors.push('#A93768');
horseNames.push('Fred');

// console.log(colors);
// console.log(names);

// Keys are horse names
// Values are colors
// Create variable of horse object

// Only create horses with function if the color and name arrays are the same length
// Steps: Use an if statement to compare the two arrays
// output: true or false

// Steps: assign horse object
// ==> use a for loop to add the names as keys and values as colors
// ==> loop based upon length of array
// output: horse key/value pairs

var horseCreator = function creator(names, colors) {
  for (var n = 0; n < names.length; n++) {
    horses[names[n]] = colors[n];
  }
  return horses;
}

if (horseColors.length === horseNames.length) {
  console.log(horseCreator(horseNames, horseColors));
} else {
  console.log('The arrays are not the same length');
}