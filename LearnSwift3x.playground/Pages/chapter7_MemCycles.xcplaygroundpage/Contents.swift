//: [Previous](@previous)

import Foundation

public class Author {
    public var name: String
    public var courses = [Course]()
    
    public init(name: String){
        self.name = name
        print("Author \(name) initialized")
    }
    
    deinit {
        print("Author \(name) deintialized")
    }
}

public class Course{
    public var title: String
    public weak var author: Author?
    
    public init(title: String, author: Author){
        self.title = title
        self.author = author
        self.author!.courses.append(self)
        
        print("Course \(title) initialized")
    }
    
    deinit {
        print("Course \(title) deintialized")
    }
}

var author: Author? = Author(name: "John Doe")
var course: Course? = Course(title: "Best Swift Course Ever", author: author!)

author = nil
course = nil

//: [Next](@next)
