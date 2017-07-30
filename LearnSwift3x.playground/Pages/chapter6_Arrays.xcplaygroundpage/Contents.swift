//: ---
//: [Previous](@previous)
//: [Next](@next)

import Foundation

// Sorting arrays
var numbers = [42, 10, 50, 5, 9, 7, 4, 12, 1, 27]

// sort() sort in place
numbers.sort{ $0 < $1 }
print(numbers)

// sorted() creates a new array after sorting the original array
let reverseOrdered = numbers.sorted{ $0 > $1 }
print(reverseOrdered)

// Filtering arrays
let smallerThanTen = numbers.filter{ $0 < 10 }
print(smallerThanTen)

let biggerThanFive = numbers.filter{ $0 > 5 }
print(biggerThanFive)

let betweenFiveAndTwenty = numbers.filter{ $0 > 5 && $0 < 20 }
print(betweenFiveAndTwenty)

// Apply rules to each array element
let halved = numbers.map{ Double($0) / 2 }
print(halved)

let transformed = numbers.map{ "\($0)#" }
print(transformed)


//: ---
//: [Previous](@previous)
//: [Next](@next)

