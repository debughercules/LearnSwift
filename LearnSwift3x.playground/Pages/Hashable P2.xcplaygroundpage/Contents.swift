import UIKit
import PlaygroundSupport

//: [Previous](@previous)

/*: Bullet List
 ### Protocol Oriented Programming
 */

//: [Next](@next)

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



