//
//  PlatoContinuation.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 09/04/24.
//
import Foundation

public class PlatoContinuation {
    
    internal var result: Result<Value, Error>?
    private let semaphore = DispatchSemaphore(value: 0)
    
    public func resume(returning value: Value) {
        result = .success(value)
        semaphore.signal()
    }
    
    public func resume<E>(throwing error: E) where E: Error {
        result = .failure(error)
        semaphore.signal()
    }
    
    internal func wait() {
        semaphore.wait()
    }
}
