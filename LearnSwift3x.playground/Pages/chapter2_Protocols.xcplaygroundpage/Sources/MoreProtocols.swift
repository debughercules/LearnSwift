import Foundation

//Protocol Extensions
protocol Entity {
    var name: String {get set}
    static func uid() -> String
}

extension Entity {
    static func uid() -> String{
        return UUID().uuidString
    }
}

struct Order: Entity {
    var name: String
    let uid: String = Order.uid()
}

let order = Order(name: "My Order")
//print(order.uid)

//Protocol Inheritance
protocol Persistable: Entity {
    func write(instance: Entity, to filePath: String)
    init?(by uid: String)
}

struct PersistableEntity: Persistable {
    var name: String
    func write(instance: Entity, to filePath: String) {
        // ...
    }
    
    init?(by uid: String) {
        // try to load from the filesystem based on id
        self.name = uid
    }
}

struct InMemoryEntity: Entity {
    var name: String
}


//Protocol Compositions
struct MyEntity: Entity, Equatable, CustomStringConvertible {
    var name: String
    
    // Equatable
    public static func ==(lhs: MyEntity, rhs: MyEntity) -> Bool {
        return lhs.name == rhs.name
    }
    
    // CustomStringConvertible
    public var description: String {
        return "MyEntity: \(name)" }
}

let entity1 = MyEntity(name: "42")
//print(entity1)
let entity2 = MyEntity(name: "42")
//assert(entity1 == entity2, "Entities shall be equal")


//Ref: https://www.pluralsight.com/guides/swift/protocol-oriented-programming-in-swift
