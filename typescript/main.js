"use strict";
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
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
function fullName(person) {
    console.log(person.firstName + " " + person.lastName);
}
var p = {
    firstName: "Chris",
    lastName: "Dalla Santa",
    contactInfo: {
        phone: 1234,
        address: "yes",
        email: "email"
    }
};
fullName(p);
var Employee = /** @class */ (function () {
    function Employee(name) {
        this.employeeName = name;
    }
    Employee.prototype.greet = function () {
        console.log("Good morning, " + this.employeeName);
    };
    return Employee;
}());
var bob = new Employee("Bob");
bob.greet();
var Manager = /** @class */ (function (_super) {
    __extends(Manager, _super);
    function Manager(managerName) {
        return _super.call(this, managerName) || this;
    }
    Manager.prototype.delegate = function () {
        console.log(this.employeeName + " delegating tasks");
    };
    return Manager;
}(Employee));
var m1 = new Manager("Steven");
m1.greet();
m1.delegate();
