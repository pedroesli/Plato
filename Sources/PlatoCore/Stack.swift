//
//  Stack.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

class Stack<T> {
    private var items: [T] = []
    
    func peek() -> T {
        guard let topElement = items.first else { fatalError("This stack is empty.") }
        return topElement
    }
    
    func pop() -> T {
        return items.removeFirst()
    }
    
    func push(_ element: T) {
        items.insert(element, at: 0)
    }
}
