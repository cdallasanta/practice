"use strict";
exports.__esModule = true;
var message = 'Welcome Back';
console.log(message);
var name = "Chris";
var sentence = "My name is " + name + ".\nI am a beginner";
console.log(sentence);
function add(num1, num2) {
    return num1 + num2;
}
function addFiveOrN(num1, num2) {
    if (num2 === void 0) { num2 = 5; }
    return num1 + num2;
}
console.log(addFiveOrN(10));
