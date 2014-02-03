---
webpack: true
---
/**
 * Entry file for our Webpack suite of files.
 */

// Retrieve the increment function.
var inc = require('./increment').increment;

// Set a value.
var a = 1;

// Increment it.
var i = inc(a);

// Output the incremented value.
var output = 'Increment of 1 is: ' + i.toString();
console.log(output);
document.write(output);

var css = require('css!./mystyle.css');
console.log(css);
