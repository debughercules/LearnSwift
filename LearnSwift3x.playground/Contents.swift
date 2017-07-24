import UIKit
import PlaygroundSupport

//: Playground - noun: a place where people can play

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
    
    static func == (lhs: Dog, rhs: Dog) -> Bool {
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
// https://stackoverflow.com/questions/25156377/what-is-the-difference-between-static-func-and-class-func-in-swift

//: ![Alt text](imgFunc.png "One mistake in this chart i.e mentioned below")

//: static and class both associate a method with a class, rather than an instance of a class. The difference is that subclasses can override class methods; they cannot override static methods.

//: class properties will theoretically function in the same way (subclasses can override them), but they're not possible in Swift yet.

class Simple {
    
    init() {
        print("init method called in base")
    }
    
    func normalFunc1() {
        print("normalFunc1()")
    }
    
    class func one() {
        print("class - one()")
    }

    static func staticOne() {
        print("staticOne()")
    }
    
    final func yesFinal() {
        print("yesFinal()")
    }
    
    var myNormalVar = "normal variable"
    
    //Class stored properties not yet supported in classes; did you mean 'static'?
    //    class var myClassVar1 = "class var1"
    
    static var myStaticVar = "static var in base"
    
    
    //This works fine
    class var myClassVar: String {
        return "class var in base"
    }
}

class SubSimple: Simple {
    
    //Error: Cannot redeclare normal func
//    func normalFunc1(){
//        
//    }
    
    //Successful override
    override func normalFunc1() {
        print("subClass - normalFunc1()")
    }
    
    //Successful redecleration of class func
    func one(){
        print("subClass - one()")
    }

    //Successful override
    override class func one() {
        let x = Simple()
        x.myNormalVar = "hello"
        print("\(x.myNormalVar): overidden subClass - one()")
    }
    
    // re-declaring static func as normal func
    func staticOne() {
        print("subclass - staticOne()")
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
        return "class var in subclass helloo"
    }
    
    //    override static var myStaticVar = "hii"
}


Simple.one()
Simple.staticOne()
Simple.yesFinal(Simple())
Simple.myStaticVar
Simple.myClassVar
SubSimple.myClassVar
SubSimple.one()
SubSimple.staticOne()








//****************************** Protocol Oriented Programming ******************************//
// https://www.youtube.com/watch?v=lBr8onqP_fM
// https://www.youtube.com/watch?v=P6zT1BLBgEI
// https://www.youtube.com/watch?v=exkaXqvbHiQ

//Protocol cannot iherit from a class
//Protocol can inherit a protocol
//Protocol can be inherited by clases, structs, enums (can may or may not implementation)
//Protocols can be extented after swift 2, can be used to add default implementations to protocols.
//Protocols extend to add additional implementaions to existing protocols

//Struct cannot inherit from Class

//****************************** POP (swift) vs OOPS (obj c) ******************************//
//OOPS problem: Implicit sharing, object being passed shares refrence(classes refrense types) unlike Structs (Value types)
//Apple is trying to make swift a safer language by avoiding implicit sharing issues , they started using Structs with POP instead of classes

//Structs do not support inheritence (protocols used), but also classes support full inheritence (multiple inheritence not supported in Obj C, multi-level inheritence supported)

protocol Fruit {
    var color: UIColor { get }
    var canBecomeViral: Bool { get }
}

protocol Pen {
    func draw()
}

struct Apple: Fruit, Pen {
    var color: UIColor {
        return UIColor.red
    }
    
    func draw() {
        // draw code
    }
}

//July 24 2017
//SBI 8th of month last due date , 19th new bill gen
//5192
//5200
//23 May 5900 via HDFC netbanking
// www.sbicard.com make online payment , Pay neft, or payNET

struct Pineapple: Fruit, Pen {
    var color: UIColor {
        return UIColor.yellow
    }
    
    func draw() {
        // draw code
    }
}

struct Mango: Fruit {
    var canBecomeViral: Bool
    var color: UIColor
    
}

//Protocol extension
extension Fruit where Self:Pen {
    var canBecomeViral: Bool { return true }
}

let x : Apple = Apple()
print("Result: \(x.canBecomeViral)")
