//: ---
//: [Previous](@previous)
//: [Next](@next)


import Foundation
import PlaygroundSupport

//To break Strong Reference Cycles With Closures using Capture lists
//Rule of Thumb: Use unowned if you are sure captured refrence will never become nil
// If you are unsure about this rather use weak and implement required validity checks inside closure's body


class Contact {
    var name: String
    var phoneNumber: String?
    
    //Try not using weak self in below then see denit method not being called because closures are refrence types and they create strong refrence.
    //To avoid memory cycle we use unowned or weak.
    //Unowned must not be used in long running asynchronous operations.
    public lazy var prettyPrint: () -> String = { [weak self] in
        if let strongSelf = self {
            var result = strongSelf.name
            if let phoneNumber = strongSelf.phoneNumber{
                result = "Name:\t\(result)\nPhone:\t\(phoneNumber)"
            }
            return result
        }
        else{
            return ""
        }
    }
    
    public init(name: String, phoneNumber: String? = nil) {
        self.name = name
        self.phoneNumber = phoneNumber
        print("Contact \(name) initialized")
    }
    
    deinit {
        print("Contact \(name) deinitialized")
    }
}

var johnDoe: Contact? = Contact(name: "John Doe", phoneNumber: "+1-555-555")
print(johnDoe!.prettyPrint())
johnDoe = nil

//: ---
//: [Previous](@previous)
//: [Next](@next)

//Ref: https://www.youtube.com/watch?v=7BpLU9uhLCg&index=4&list=PLqyx8dnzDyGZptf3VLFhMneICYzYHMTl6


