import XCTest
import Foundation
@testable import Plato
@testable import PlatoCore

final class PlatoTests: XCTestCase {
    
    let plato = TestablePlato()
    
    override func tearDown() {
        plato.reset()
    }
    
    func testGeneral() async throws {
        let code = """
        cos(90)
        2
        "321pedro"
        """
        try await self.plato.run(code)
    }
    
    func testAddition() async throws {
        let code = """
        1+2+5
        44+55.5
        true + false
        3 + true
        "Hello" + ", World!"
        [1, 2, 3] + [4, 5, 6]
        1 - 3
        3.5 - 6
        4 - true
        5+10-2
        1_000_000+1_500_000
        """
        plato.addExpectedValue(int: 8, forLine: 1)
        plato.addExpectedValue(double: 99.5, forLine: 2)
        plato.addExpectedValue(int: 1, forLine: 3)
        plato.addExpectedValue(int: 4, forLine: 4)
        plato.addExpectedValue(string: "Hello, World!", forLine: 5)
        plato.addExpectedValue(
            array: [
                Value(int: 1),
                Value(int: 2),
                Value(int: 3),
                Value(int: 4),
                Value(int: 5),
                Value(int: 6)
            ],
            forLine: 6
        )
        plato.addExpectedValue(int: -2, forLine: 7)
        plato.addExpectedValue(double: -2.5, forLine: 8)
        plato.addExpectedValue(int: 3, forLine: 9)
        plato.addExpectedValue(int: 13, forLine: 10)
        plato.addExpectedValue(int: 2_500_000, forLine: 11)
        try await self.plato.run(code)
    }
    
    func testMultiplication() async throws {
        let code = """
        2*5
        25/5
        2 + 3 * 5
        10%2
        8.625%0.75
        5.5 * 2.5
        """
        plato.addExpectedValue(int: 10, forLine: 1)
        plato.addExpectedValue(int: 5, forLine: 2)
        plato.addExpectedValue(int: 17, forLine: 3)
        plato.addExpectedValue(int: 0, forLine: 4)
        plato.addExpectedValue(double: 0.375, forLine: 5)
        plato.addExpectedValue(double: 13.75, forLine: 6)
        try await self.plato.run(code)
    }
    
    func testExponent() async throws {
        let code = """
        2**true
        2**false
        2**3
        2**2**2
        2.5**2
        2**2.5
        2**2**2.5
        """
        plato.addExpectedValue(int: 2, forLine: 1)
        plato.addExpectedValue(int: 1, forLine: 2)
        plato.addExpectedValue(int: 8, forLine: 3)
        plato.addExpectedValue(int: 16, forLine: 4)
        plato.addExpectedValue(double: 6.25, forLine: 5)
        plato.addExpectedValue(double: 5.656854249492381, forLine: 6)
        plato.addExpectedValue(double: 50.4525138385402, forLine: 7)
        try await self.plato.run(code)
    }
    
    func testBoolean() async throws {
        let code = """
        true and true
        true and false
        true or true
        true or false
        1 and 0
        3 and 5
        6 or 0
        not true
        not false
        not 1
        not 0
        not 4.5
        """
        plato.addExpectedValue(bool: true,  forLine: 1)
        plato.addExpectedValue(bool: false, forLine: 2)
        plato.addExpectedValue(bool: true,  forLine: 3)
        plato.addExpectedValue(bool: true,  forLine: 4)
        plato.addExpectedValue(bool: false, forLine: 5)
        plato.addExpectedValue(bool: true,  forLine: 6)
        plato.addExpectedValue(bool: true,  forLine: 7)
        plato.addExpectedValue(bool: false, forLine: 8)
        plato.addExpectedValue(bool: true,  forLine: 9)
        plato.addExpectedValue(bool: false, forLine: 10)
        plato.addExpectedValue(bool: true,  forLine: 11)
        plato.addExpectedValue(bool: false, forLine: 12)
        try await self.plato.run(code)
    }
    
    func testEquality() async throws {
        let code = """
        true == true
        true != false
        1 == 1
        1 == 1.0
        1 == 1.5
        true == 25
        2 == true
        3.5 == 3.5
        [1,2,3] == [1,2,3]
        [1,2.5,3.1] == [1,2.5,3.1]
        [1,2] == [1,3]
        [1,2,3] != [4,5,6]
        [1,2] != [1,2]
        """
        plato.addExpectedValue(bool: true,  forLine: 1)
        plato.addExpectedValue(bool: true,  forLine: 2)
        plato.addExpectedValue(bool: true,  forLine: 3)
        plato.addExpectedValue(bool: true,  forLine: 4)
        plato.addExpectedValue(bool: false, forLine: 5)
        plato.addExpectedValue(bool: false, forLine: 6)
        plato.addExpectedValue(bool: false, forLine: 7)
        plato.addExpectedValue(bool: true,  forLine: 8)
        plato.addExpectedValue(bool: true,  forLine: 9)
        plato.addExpectedValue(bool: true,  forLine: 10)
        plato.addExpectedValue(bool: false, forLine: 11)
        plato.addExpectedValue(bool: true,  forLine: 12)
        plato.addExpectedValue(bool: false, forLine: 13)
        try await self.plato.run(code)
    }
    
    func testCompare() async throws {
        let code = """
        2 < 3
        5 > 2
        5.2 > 5.3
        6.3 < 6
        2 <= 2
        5.5 >= 3.3
        "hey" <= "hey"
        "a" < "b"
        "a" > "b"
        """
        plato.addExpectedValue(bool: true,  forLine: 1)
        plato.addExpectedValue(bool: true,  forLine: 2)
        plato.addExpectedValue(bool: false, forLine: 3)
        plato.addExpectedValue(bool: false, forLine: 4)
        plato.addExpectedValue(bool: true,  forLine: 5)
        plato.addExpectedValue(bool: true,  forLine: 6)
        plato.addExpectedValue(bool: true,  forLine: 7)
        plato.addExpectedValue(bool: true,  forLine: 8)
        plato.addExpectedValue(bool: false, forLine: 9)
        try await self.plato.run(code)
    }
    
    func testAssignment() async throws {
        let code = """
        a = 2
        a += 1
        a *= 2
        a -= 1
        a
        b: float = 1.5
        b
        c = [1, 2, 3]
        c
        """
        plato.addExpectedValue(int: 5, forLine: 5)
        plato.addExpectedValue(float: 1.5, forLine: 7)
        plato.addExpectedValue(array: [Value(int: 1), Value(int: 2), Value(int: 3)], forLine: 9)
        try await self.plato.run(code)
    }
    
    func testTypeAssignment() async throws {
        let code = """
        a: bool = true
        b: int = 1
        c: float = 1.6
        d: double = 0.5123456712
        e: number = 42
        f: string = "hey"
        g: array = [1, 2, 3, 4]
        h: any = "test"
        a
        b
        c
        d
        e
        f
        g
        h
        """
        plato.addExpectedValue(bool: true, forLine: 9)
        plato.addExpectedValue(int: 1, forLine: 10)
        plato.addExpectedValue(float: 1.6, forLine: 11)
        plato.addExpectedValue(double: 0.5123456712, forLine: 12)
        plato.addExpectedValue(int: 42, forLine: 13)
        plato.addExpectedValue(string: "hey", forLine: 14)
        plato.addExpectedValue(array: [Value(int: 1), Value(int: 2), Value(int: 3), Value(int: 4)], forLine: 15)
        plato.addExpectedValue(string: "test", forLine: 16)
        try await self.plato.run(code)
    }
    
    func testArray() async throws {
        let code = """
        []
        [1, 2, 3, 5]
        ["Hello", "World"][1]
        a = [1, 2, 3, 4, 5]
        a[3]
        b = [[1,2,3]]
        b[0][1]
        """
        plato.addExpectedValue(array: [], forLine: 1)
        plato.addExpectedValue(array: [Value(int: 1), Value(int: 2), Value(int: 3), Value(int: 5)], forLine: 2)
        plato.addExpectedValue(string: "World", forLine: 3)
        plato.addExpectedValue(int: 4, forLine: 5)
        plato.addExpectedValue(int: 2, forLine: 7)
        try await self.plato.run(code)
    }
    
    func testIfStatement() async throws {
        let code = """
        if 1 == 2 {
            "1"
        } else if 2 == 2 {
            "2"
        } else if 4 == 4 {
            "4"
        } else {
            "5"
        }
        """
        plato.addExpectedValue(string: "2", forLine: 4)
        try await self.plato.run(code)
    }
    
    func testWhileStatement() async throws {
        let code = """
        a = 0
        while a < 10 {
            a += 1
            a
        }
        a = 0
        while a < 5 {
            b = 0
            while b < 5 {
                b += 1
                b
            }
            a += 1
        }
        """
        try await self.plato.run(code)
    }
    
    func testForInStatement() async throws {
        let code = """
        numbers = [1, 2, 3, 4, 5, 6]
        for number in numbers {
            number
        }
        
        words = "Hello, World!"
        for word in words {
            word
        }
        """
        plato.addExpectedValue(rangeInt: 1...6, forLine: 3)
        try await self.plato.run(code)
    }
    
    func testForFromToByStatement() async throws{
        let code = """
        for index from 0 to 10 by 1 {
            for j in [1, 2, 3, 4, 5] {
                if j == 4 {
                    break
                }
                j
            }
        }
        """
        try await self.plato.run(code)
    }
    
    func testTypeFuncCall() async throws {
        let code = """
        bool(1)
        bool("true")
        bool("false")
        bool("1")
        bool("25")
        bool("hey")
        int("25")
        int("hello")
        int(1.5)
        int(true)
        float("25.5")
        float("world")
        float(true)
        string(1)
        string(true)
        string(1.5)
        string([1, 2, 3])
        array(1, 2, 3.5, "4")
        array(repeating: 2.5, count: 4)
        double("0.5123456123")
        double("peter")
        double(true)
        """
        plato.addExpectedValue(bool: true, forLine: 1)
        plato.addExpectedValue(bool: true, forLine: 2)
        plato.addExpectedValue(bool: false, forLine: 3)
        plato.addExpectedValue(bool: true, forLine: 4)
        plato.addExpectedValue(bool: false, forLine: 5)
        plato.addExpectedValue(bool: false, forLine: 6)
        plato.addExpectedValue(int: 25, forLine: 7)
        plato.addExpectedValue(int: 0, forLine: 8)
        plato.addExpectedValue(int: 1, forLine: 9)
        plato.addExpectedValue(int: 1, forLine: 10)
        plato.addExpectedValue(float: 25.5, forLine: 11)
        plato.addExpectedValue(float: 0, forLine: 12)
        plato.addExpectedValue(float: 1, forLine: 13)
        plato.addExpectedValue(string: "1", forLine: 14)
        plato.addExpectedValue(string: "true", forLine: 15)
        plato.addExpectedValue(string: "1.5", forLine: 16)
        plato.addExpectedValue(string: "[1, 2, 3]", forLine: 17)
        plato.addExpectedValue(array: [Value(int: 1), Value(int: 2), Value(double: 3.5), Value(string: "4")], forLine: 18)
        plato.addExpectedValue(array: [Value(double: 2.5), Value(double: 2.5), Value(double: 2.5), Value(double: 2.5)], forLine: 19)
        plato.addExpectedValue(double: 0.5123456123, forLine: 20)
        plato.addExpectedValue(double: 0, forLine: 21)
        plato.addExpectedValue(double: 1, forLine: 22)
        try await self.plato.run(code)
    }
    
    func testFunctionCall() async throws {
        let code = """
        func printHelloWorld() {
            "Hello, World!"
        }
        printHelloWorld()
        
        func sum(a, b) {
            return a + b
        }
        sum(1,2)
        
        func mul(a: int, b: int) {
            return a * b
        }
        mul(2, 4)
        
        func mul(a: double, b: double) {
            return a * b
        }
        mul(1.5, 1.5)
        mul(5, 2)
        
        func scopeMul() {
            func mul(a: double, b: double) {
                return b * b
            }
            return mul(5.5, 2.5)
        }
        scopeMul()
        
        func minus(at a, at b) {
            return a - b
        }
        minus(a: 10, b: 15)
        """
        plato.addExpectedValue(string: "Hello, World!", forLine: 2)
        plato.addExpectedValue(int: 3, forLine: 9)
        plato.addExpectedValue(int: 8, forLine: 14)
        plato.addExpectedValue(double: 2.25, forLine: 19)
        plato.addExpectedValue(int: 10, forLine: 20)
        plato.addExpectedValue(double: 6.25, forLine: 28)
        plato.addExpectedValue(int: -5, forLine: 33)
        try await self.plato.run(code)
    }
    
    func testPrintFunction() async throws {
        let code = """
            print("Hello, World!")
            a = 25
            a += 5
            print("Result:", a)
            print(1, 2, 3, 4, separator: " ... ", terminator: "\n\n")
        """
        try await self.plato.run(code)
    }
    
    func testRandomFunction() async throws {
        let code = """
            random(1, 9.5)
            random(1, 10)
            random(-20, 20)
            random(0.1, 0.9)
        """
        plato.addExpectedValue(rangeDouble: 1...10, forLine: 1)
        plato.addExpectedValue(rangeInt: 1...10, forLine: 2)
        plato.addExpectedValue(rangeInt: -20...20, forLine: 3)
        plato.addExpectedValue(rangeDouble: 0.1...0.9, forLine: 4)
        
        try await self.plato.run(code)
    }
    
//    func testInfinity() async throws {
//        let plato = Plato()
//        let code = """
//            a = 0
//            while true {
//                a
//                a += 1
//            }
//        """
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
//            print("reseting")
//            plato.stop()
//        })
//        try await plato.run(code)
//    }
    
    func testMaxLoop() async throws {
        let max = 10
        plato.config.loop = .max(max)
        
        var code = """
            count = 0
            max = 20
            while count < max {
                count += 1
            }
            count
        """
        try await assertThrowsError(
            try await plato.run(code),
            message: "Plato has to throw an error where loop has a max of \(max) allowed loops."
        )
        
        plato.clearCache()
        
        code = """
            count = 0
            for index from 0 to 15 by 1 {
                count += 1
            }
            count
        """
        try await assertThrowsError(
            try await plato.run(code),
            message: "Plato has to throw an error where loop has a max of \(max) allowed loops."
        )
    }
    
    func testReadLineContinuation() async throws {
        plato.config.readLine = .continuation
        
        let code = """
            a = readLine()
            a
        """
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            print("resuming")
            self.plato.readLineContinuation.resume(returning: Value(string: "Hello"))
        }
        try await plato.run(code)
    }
    
    /// Expects the expression to throw an error to pass.
    func assertThrowsError(_ expression: @autoclosure () async throws -> Void, message: String) async throws {
        var pass = true
        do {
            try await expression()
            pass = false
        } catch {
            
        }
        
        if !pass {
            throw PError.expectsThrow(message)
        }
    }
    
    enum PError: Error {
        case expectsThrow(String)
    }
}
