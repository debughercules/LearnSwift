//: Protocols
//: =
//: ## Protocol Oriented Programming
//: ### Swift 3x
//: ---
//: [Previous](@previous)
//: [Next](@next)


import UIKit
import PlaygroundSupport

// Fruit Protocol having only Declaration of 2 variables
protocol Fruit {
    var color: UIColor { get }
    var canBecomeViral: Bool { get }
}

// Fruit Protocol having only Declaration of 1 function
protocol Pen {
    func draw()
}

// Apple conforms to both Fruit & Pen Protocol
struct Apple: Fruit, Pen {
    var color: UIColor {
        return UIColor.red
    }
    
    func draw() {
        // draw code
    }
}

// Pineapple conforms to both Fruit & Pen Protocol
struct Pineapple: Fruit, Pen {
    var color: UIColor {
        return UIColor.yellow
    }
    
    func draw() {
        // draw code
    }
}

// Protocol extension having default implementaion i.e value of canBecomeViral
// Using condtion where clause i.e anyone that conforms to Fruit and the to Pen also need not to provide default value for canBecomeViral
extension Fruit where Self:Pen {
    var canBecomeViral: Bool { return true }
}

// Mango only conforms to Fruit Protocol
struct Mango: Fruit {
    var canBecomeViral: Bool
    var color: UIColor
    
}

// No need to provide Default value for canBecomeViral
let x : Apple = Apple()
print("Result: \(x.canBecomeViral)")

// Need to provide Default value for both canBecomeViral and color as its not conforming to Pen Protocol
let y : Mango = Mango(canBecomeViral: false, color: .yellow)
print("Result: \(y.canBecomeViral)")


/*: Bullet List
 ### Key Points
 * Protocol cannot iherit from a class
 * Protocol can inherit a protocol
 * Protocol can be inherited by clases, structs, enums (can may or may not implementation)
 * Protocols can be extented after swift 2, can be used to add default implementations to protocols.
 * Protocols extend to add additional implementaions to existing protocols
 * Struct cannot inherit from Class
 
 ### POP (swift) vs OOPS (obj c)
 * OOPS problem: Implicit sharing, object being passed shares refrence(classes refrense types) unlike Structs (Value types)
 * Apple is trying to make swift a safer language by avoiding implicit sharing issues , they started using Structs with POP instead of classes
 * Structs do not support inheritence (protocols used), but also classes support full inheritence (multiple inheritence not supported in Obj C, multi-level inheritence supported)
 */


/*:
 [Reference1]: https://www.youtube.com/watch?v=lBr8onqP_fM/ "Click here"
 For more information, see [Reference1].
 */
/*:
 [Reference2]: https://www.youtube.com/watch?v=P6zT1BLBgEI "Click here"
 For more information, see [Reference2].
 */
/*:
 [Reference3]: https://www.youtube.com/watch?v=exkaXqvbHiQ "Click here"
 For more information, see [Reference3].
 */


/*: Bullet List
 ### More on Protocols
 Few Built in Protocols i.e Hashable and Equatable
 */

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
    
    //Any class that conforms to Hashable protocol has to conform to Equatable protocol & must overide below static method
    static func == (lhs: Cat, rhs: Cat) -> Bool {
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

//: ---
//: [Previous](@previous)
//: [Next](@next)
