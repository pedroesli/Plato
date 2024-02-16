import XCTest
import Foundation
@testable import Plato
@testable import PlatoCore

final class PlatoTests: XCTestCase {
    func testGeneral() {
        let code = """
        6
        2
        "321pedro"
        """
        XCTAssertNoThrow(try Plato.run(code))
    }
    
    func testAddition() {
        let plato = TestablePlato()
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
        plato.addExpectedValue(Value(int: 8), forLine: 1)
        plato.addExpectedValue(Value(float: 99.5), forLine: 2)
        plato.addExpectedValue(Value(int: 1), forLine: 3)
        plato.addExpectedValue(Value(int: 4), forLine: 4)
        plato.addExpectedValue(Value(string: "Hello, World!"), forLine: 5)
        plato.addExpectedValue(
            Value(
                array: ArrayValue(
                    [
                        Value(int: 1),
                        Value(int: 2),
                        Value(int: 3),
                        Value(int: 4),
                        Value(int: 5),
                        Value(int: 6)
                    ]
                )
            ),
            forLine: 6
        )
        plato.addExpectedValue(Value(int: -2), forLine: 7)
        plato.addExpectedValue(Value(float: -2.5), forLine: 8)
        plato.addExpectedValue(Value(int: 3), forLine: 9)
        plato.addExpectedValue(Value(int: 13), forLine: 10)
        plato.addExpectedValue(Value(int: 2_500_000), forLine: 11)
        XCTAssertNoThrow(try plato.run(code))
    }
    
    func testMultiplication() {
        let plato = TestablePlato()
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
        plato.addExpectedValue(float: 0.375, forLine: 5)
        plato.addExpectedValue(float: 13.75, forLine: 6)
        XCTAssertNoThrow(try plato.run(code))
    }
    
    func testExponent() {
        let plato = TestablePlato()
        let code = """
        2^true
        2^false
        2^3
        2^2^2
        2.5^2
        2^2.5
        2^2^2.5
        """
        plato.addExpectedValue(int: 2, forLine: 1)
        plato.addExpectedValue(int: 1, forLine: 2)
        plato.addExpectedValue(int: 8, forLine: 3)
        plato.addExpectedValue(int: 16, forLine: 4)
        plato.addExpectedValue(float: 6.25, forLine: 5)
        plato.addExpectedValue(float: 5.656854, forLine: 6)
        plato.addExpectedValue(float: 50.45251, forLine: 7)
        XCTAssertNoThrow(try plato.run(code))
    }
    
    func testBoolean() {
        let plato = TestablePlato()
        let code = """
        true and true
        true and false
        true or true
        true or false
        1 and 0
        3 and 5
        6 or 0
        !true
        !false
        !1
        !0
        !4
        """
        plato.addExpectedValue(bool: true , forLine: 1)
        plato.addExpectedValue(bool: false, forLine: 2)
        plato.addExpectedValue(bool: true , forLine: 3)
        plato.addExpectedValue(bool: true , forLine: 4)
        plato.addExpectedValue(bool: false, forLine: 5)
        plato.addExpectedValue(bool: true , forLine: 6)
        plato.addExpectedValue(bool: true , forLine: 7)
        plato.addExpectedValue(bool: false, forLine: 8)
        plato.addExpectedValue(bool: true , forLine: 9)
        plato.addExpectedValue(bool: false, forLine: 10)
        plato.addExpectedValue(bool: true , forLine: 11)
        plato.addExpectedValue(bool: false, forLine: 12)
        XCTAssertNoThrow(try plato.run(code))
    }
    
    func testEquality() {
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
        XCTAssertNoThrow(try Plato.run(code))
    }
    
    func testCompare() {
        let code = """
        2 < 3
        5 > 2
        2 <= 2
        5.5 >= 3.3
        "hey" <= "hey"
        "a" < "b"
        """
        XCTAssertNoThrow(try Plato.run(code))
    }
    
    func testAssignment() {
        let plato = TestablePlato()
        let code = """
        a = 2
        a += 1
        a *= 2
        a -= 1
        a
        b: Float = 1
        b
        c: Array = [1, 2, 3]
        c
        """
        plato.addExpectedValue(int: 5, forLine: 5)
        plato.addExpectedValue(float: 1.0, forLine: 7)
        plato.addExpectedValue(array: [Value(int: 1), Value(int: 2), Value(int: 3)], forLine: 9)
        XCTAssertNoThrow(try plato.run(code))
    }
    
    func testArray() {
        let code = """
        []
        [1, 2, 3, 5]
        ["Hello", "World"][1]
        a = [1, 2, 3, 4, 5]
        a[3]
        b = [[1,2,3]]
        b[0][1]
        """
        XCTAssertNoThrow(try Plato.run(code))
    }
    
    func testIfStatement() {
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
        XCTAssertNoThrow(try Plato.run(code))
    }
    
    func testWhileStatement() {
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
        XCTAssertNoThrow(try Plato.run(code))
    }
    
    func testForInStatement() {
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
        XCTAssertNoThrow(try Plato.run(code))
    }
    
    func testForFromToByStatement() {
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
        XCTAssertNoThrow(try Plato.run(code))
    }
    
    func testTypeFuncCall() {
        let plato = TestablePlato()
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
        plato.addExpectedValue(array: [Value(int: 1), Value(int: 2), Value(float: 3.5), Value(string: "4")], forLine: 18)
        XCTAssertNoThrow(try plato.run(code))
    }
}
