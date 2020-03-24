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

function fullName(person: Person) {
  console.log(`${person.firstName} ${person.lastName}`)
}

interface Person {
  firstName: string,
  lastName: string,
  contactInfo?: ContactInfo
}

interface ContactInfo {
  phone: number,
  address: string,
  email: string
}

let p: Person = {
  firstName: "Chris",
  lastName: "Dalla Santa",
  contactInfo: {
    phone: 1234,
    address: "yes",
    email: "email"
  }
}

fullName(p);


class Employee {
  protected employeeName: string;

  constructor(name:string){
    this.employeeName = name;
  }

  greet(){
    console.log(`Good morning, ${this.employeeName}`)
  }
}

let bob: Employee = new Employee("Bob");
bob.greet();

class Manager extends Employee {
  constructor(managerName:string){
    super(managerName);
  }

  delegate(){
    console.log(`${this.employeeName} delegating tasks`);
  }
}

let m1: Manager = new Manager("Steven");
m1.greet();
m1.delegate();