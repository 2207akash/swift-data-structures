/*
    Author: Akash Sen
    Topic: Singly Linked List
    Created Date: 30-01-2024
 */


// MARK: Class definitions
class Node<T> {
    let data: T
    var next: Node<T>?
    
    init(data: T, next: Node<T>? = nil) {
        self.data = data
        self.next = next
    }
}

class SinglyLinkedList<T> {
    
    var head: Node<T>?
    var count: Int = 0 {
        didSet {
            self.isEmpty = (self.count == 0)
        }
    }
    var isEmpty: Bool = true
    
    func traverse() -> String {
        var pathString = ""
        var ptr = head
        while ptr != nil {
            if let ptrData = ptr?.data {
                pathString.append("\(ptrData)->")
            }
            ptr = ptr?.next
        }
        pathString.append("Nil")
        return pathString
    }
    
    func insert(data: T, at position: Int) -> Bool {
        // Error Handling
        if position > self.count {
            print("Node insertion position invalid")
            return false
        }
        
        // Main logic
        if position == 0 {
            // Insert node at begin
            let node = Node(data: data, next: head)
            head = node
        }
        else if position == count {
            // Insert node at end
            let node = Node(data: data, next: nil)
            var ptr = head
            while let ptrNext = ptr?.next {
                ptr = ptrNext
            }
            ptr?.next = node
        }
        else {
            // Insert node at anywhere in middle
            var ptr = head
            for index in 0..<position-1 {
                ptr = ptr?.next
            }
            if let ptrNext = ptr?.next {
                let node = Node(data: data, next: ptrNext)
                ptr?.next = node
            } else {
                let node = Node(data: data)
                ptr?.next = node
            }
        }
        
        // Update counters
        self.count += 1
        
        return true
    }
    
    func delete(at position: Int) -> Bool {
        // Error Handling
        if position >= self.count {
            print("Node deletion position invalid")
            return false
        }
        
        // Main logic
        if position == 0 {
            head = head?.next
        } else if position == count-1 {
            // Delete node at end
            var ptr1 = head?.next, ptr2 = head
            while let newPtr1 = ptr1?.next {
                ptr2 = ptr1
                ptr1 = newPtr1
            }
            ptr2?.next = nil
        } else {
            // Delete node at anywhere in middle
            var ptr = head
            for index in 0..<position-1 {
                ptr = ptr?.next
            }
            ptr?.next = ptr?.next?.next
        }
        
        // Update counters
        self.count -= 1
        
        return true
    }
    
}


// MARK: Test ADT working
let sll = SinglyLinkedList<Int>()

sll.insert(data: 5, at: 0)
sll.insert(data: 15, at: 1)
sll.insert(data: 10, at: 1)
sll.delete(at: 1)
sll.traverse()
