//
//  Stack.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

class Stack<Element> {
    private var items: [Element] = []
    
    func peek() -> Element {
        guard let topElement = items.first else { fatalError("This stack is empty.") }
        return topElement
    }
    
    @discardableResult func pop() -> Element {
        return items.removeFirst()
    }
    
    func push(_ element: Element) {
        items.insert(element, at: 0)
    }
}
