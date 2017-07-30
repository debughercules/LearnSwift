/*: Bullet List
 ### Static vs Class Functions
 * Example using image in playgrounds
 * Static vs Class example
 */
//: ---
//: [Previous](@previous)
//: [Next](@next)

import Foundation

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


//: ![Alt text](imgFunc.png "One mistake in this chart i.e mentioned below")

/*:
 ## Key Points
 > 1. Static and class both associate a method with a class, rather than an instance of a class. The difference is that subclasses can override class methods; they cannot override static methods.
 > 2. Slass properties will theoretically function in the same way (subclasses can override them), but they're not possible in Swift yet.
 
 (the > symbol denotes a new section)
 */

/*:
 [Reference]: https://stackoverflow.com/questions/25156377/what-is-the-difference-between-static-func-and-class-func-in-swift/ "Some hover text"
 For more information, see [Reference].
 */

//: ---
//: [Previous](@previous)
//: [Next](@next)

//: [Go back to first page](page1_Protocols)

