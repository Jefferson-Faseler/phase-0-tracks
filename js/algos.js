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

var itemsOnMyDesk = ['Mouse', 'Keyboard', 'Clock', 'Computer',
'Memo Book', 'Candle', 'Mousepad', 'Photo of Family'];

function elementLength(array) {
  for (var i = 0; i < array.length; i++) {
    var longest = array[0];
    if (longest <= array[i]) {
      longest = array[i];
    } 
  } return longest;
}

console.log(elementLength(itemsOnMyDesk));
// ==> Photo of Family

