/*: Bullet List
 ### Classes
 * Abstract Class 1
 * Abstract Class 2
 */
//: ---
//: [Previous](@previous)
//: [Next](@next)


import Foundation


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


//Convinience initialisers
class Food {
    let name: String
    
    // MARK: - designated initializer
    init(name: String) {
        self.name = name
    }
    
    // MARK: - convenience initializer
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

// MARK: - Examples
let food = Food(name: "Cheese")
let food2 = Food()
food.name
food2.name



//: ---
//: [Previous](@previous)
//: [Next](@next)

