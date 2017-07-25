//: Protocols
//: =
//: ## Protocol Oriented Programming
//: ---
//: ### Swift 3x
//: [Next](@next)

import UIKit
import PlaygroundSupport

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

/*:
 # LearnSwift3x in playground!
 
 A *simple* demo with _markup_ examples.
 */

//: Another **variable** of type __String__
//: show Swift keywords such as `for` and `let` as monspaced font

/*:
 ## Points to Remember
 * Empty lines end the single line comment delimiter block
 * Comment content ends at a newline
 * Commands that work in a comment block work in single line
 * This **includes** text formatting commands
 */

