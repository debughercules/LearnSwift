//: ---
//: [Previous](@previous)
//: [Next](@next)


import Foundation
import PlaygroundSupport

class Contact {
    var name: String
    var phoneNumber: String?
    
    public init(name: String, phoneNumber: String? = nil) {
        self.name = name
        self.phoneNumber = phoneNumber
        print("Contact \(name) initialized")
    }
    
    deinit {
        print("Contact \(name) deinitialized")
    }
}

var johnDoe: Contact? = Contact(name: "John Doe")
johnDoe = nil

//: ---
//: [Previous](@previous)
//: [Next](@next)
