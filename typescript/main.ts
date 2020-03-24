export {}

let message: string = 'Welcome Back';
console.log(message);

let name: string = "Chris"
let sentence: string = `My name is ${name}.
I am a beginner`;
console.log(sentence);


function add(num1: number, num2: number): number {
  return num1 + num2;
}

function addFiveOrN(num1: number, num2:number = 5): number {
  return num1 + num2;
}

console.log(addFiveOrN(10));