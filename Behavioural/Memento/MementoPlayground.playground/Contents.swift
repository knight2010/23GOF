import Swift
import Foundation

/*:
💾 Memento
----------
    
The memento pattern is used to capture the current state of an object and store it in such a manner that it can be restored at a later time without breaking the rules of encapsulation.
 
备忘录对象是一个用来存储另外一个对象内部状态的快照的对象。备忘录模式的用意是在不破坏封装的条件下，将一个对象的状态捕捉住，并外部化存储起来，从而可以在将来合适的时候把这个对象还原到存储起来的状态。

### Example
*/
typealias Memento = NSDictionary
/*:
 Originator
 */
protocol MementoConvertible {
    var memento: Memento { get }
    init?(memento: Memento)
}

struct Originator: MementoConvertible {
    
    private struct Keys {
        static let chapter = "com.valve.halflife.chapter"
        static let weapon = "com.valve.halflife.weapon"
    }
    
    var chapter: String
    var weapon: String
    
    init(chapter: String, weapon: String) {
        self.chapter = chapter
        self.weapon = weapon
    }
    
    init?(memento: Memento) {
        guard let mementoChapter = memento[Keys.chapter] as? String,
            let mementoWeapon = memento[Keys.weapon] as? String else {
                return nil
        }
        
        chapter = mementoChapter
        weapon = mementoWeapon
    }
    
    var memento: Memento {
        return [ Keys.chapter: chapter, Keys.weapon: weapon ]
    }
}
/*:
 Caretaker
 */
enum Caretaker {
    static func save(_ state: MementoConvertible, saveName: String) {
        let defaults = UserDefaults.standard
        defaults.set(state.memento, forKey: saveName)
        defaults.synchronize()
    }
    
    static func restore(saveName: String) -> Memento? {
        let defaults = UserDefaults.standard
        
        return defaults.object(forKey: saveName) as? Memento
    }
}
/*:
 ### Usage
 */
var gameState = Originator(chapter: "Black Mesa Inbound", weapon: "Crowbar")

gameState.chapter = "Anomalous Materials"
gameState.weapon = "Glock 17"
Caretaker.save(gameState, saveName: "gameState1")

gameState.chapter = "Unforeseen Consequences"
gameState.weapon = "MP5"
Caretaker.save(gameState, saveName: "gameState2")

gameState.chapter = "Office Complex"
gameState.weapon = "Crossbow"
Caretaker.save(gameState, saveName: "gameState3")

if let memento = Caretaker.restore(saveName: "gameState1") {
    let finalState = Originator(memento: memento)
    dump(finalState)
}

/*:
 >**Further Examples:** [Design Patterns in Swift](https://github.com/knight2010/23GOF)
 */
