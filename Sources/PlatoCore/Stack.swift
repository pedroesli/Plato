//
//  Stack.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

public class Stack<Element> {
    private var items: [Element] = []
    
    public func peek() -> Element {
        guard let topElement = items.first else { fatalError("This stack is empty.") }
        return topElement
    }
    
    @discardableResult func pop() -> Element {
        return items.removeFirst()
    }
    
    public func push(_ element: Element) {
        items.insert(element, at: 0)
    }
}
