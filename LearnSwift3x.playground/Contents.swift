//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//****************************** Hashable and Equatable ******************************//

class Dog: Hashable {
    var uid: Int
    var name: String
    var age: Int
    var hashValue: Int {
        return uid.hashValue
    }
    
    init(uid: Int, name: String, age: Int) {
        self.uid = uid
        self.name = name
        self.age = age
    }
    
    static func ==(lhs: Dog, rhs: Dog) -> Bool {
        return lhs.uid == rhs.uid
    }
}

class Cat: Hashable {
    var uid: Int
    var name: String
    var age: Int
    var hashValue: Int {
        return uid.hashValue
    }
    
    init(uid: Int, name: String, age: Int) {
        self.uid = uid
        self.name = name
        self.age = age
    }
    
    static func ==(lhs: Cat, rhs: Cat) -> Bool {
        return lhs.uid == rhs.uid
    }
}

let cat1 = Cat(uid: 2, name: "MC", age: 6)

let dog1 = Dog(uid: 1, name: "Doggee1", age: 9)
let dog2 = Dog(uid: 2, name: "Doggee2", age: 9)

var dogArray: [Dog: String] = [ dog1: "Woff Woff",
                                dog2: "Wooooof"]

var dogs: Set<Dog> = [dog1, dog2]

print(dog1.hashValue)
print(dog2.hashValue)

if dog1.age >= dog2.age{
    print("big dog")
}









//****************************** Absrtact Class ******************************//

protocol Employee {
    var annualSalary: Int {get}
}

extension Employee {
    var biweeklySalary: Int {
        return self.annualSalary / 26
    }
    
    func logSalary() {
        print("$\(self.annualSalary) per year or $\(self.biweeklySalary) biweekly")
    }
}

struct SoftwareEngineer: Employee {
    var annualSalary: Int
    
    func logSalary() {
        print("overridden")
    }
}

let sarah = SoftwareEngineer(annualSalary: 1000000)
sarah.logSalary() // prints: overridden
(sarah as Employee).logSalary() // prints: $100000 per year or $3846 biweekly










//****************************** Static vs Class Functions ******************************//

class Simple {
    
    init() {
        print("init method called in base")
    }
    
    class func one() {
        print("class - one()")
    }
    
    class func two() {
        print("class - two()")
    }
    
    static func staticOne() {
        print("staticOne()")
    }
    
    static func staticTwo() {
        print("staticTwo()")
    }
    
    final func yesFinal() {
        print("yesFinal()")
    }
    
    func normalFunc1() {
        print("normalFunc1()")
    }
    
    func normalFunc2() {
        print("normalFunc2()")
    }
    
    //Class stored properties not yet supported in classes; did you mean 'static'?
    //    class var myClassVar1 = "class var1"
    
    static var myStaticVar = "static var in base"
    
    
    //This works fine
    class var myClassVar: String {
        return "class var in base"
    }
}

class SubSimple: Simple {
    //Successful override
    override class func one() {
        print("subClass - one()")
    }
    //Successful override
    override class func two () {
        print("subClass - two()")
    }
    
    //Error: Cannot overide static method
    //    override static func staticOne() {
    //
    //    }
    
    //error: Instance method overrides a 'final' instance method
    //    override final func yesFinal() {
    //
    //    }
    
    //Works fine
    override class var myClassVar: String {
        return "class var in subclass hello hello hello"
    }
    
    //    override static var myStaticVar = "hii"
}


print(Simple.one())
print(Simple.two())
print(Simple.staticOne())
print(Simple.staticTwo())
print(Simple.yesFinal(Simple()))
print(SubSimple.one())
print(Simple.myStaticVar)
print(Simple.myClassVar)
print(SubSimple.myClassVar)

