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
        
        let errorCode = """
        [
        """
        XCTAssertThrowsError(try Plato.run(errorCode))
    }
    
    func testAddition() {
        let code = """
        1+2+5
        44+55.5
        TRUE + FALSE
        3 + TRUE
        "hello" + ", world!"
        [1, 2, 3] + [4, 5, 6]
        1 - 3
        3.5 - 6
        4 - TRUE
        5+10-2
        """
        XCTAssertNoThrow(try Plato.run(code))
        
        let errorCode = """
        "Hey" + 3
        "Error" - "String"
        [1, 3, 4] - [4, 5]
        "value: " + 25
        """
        XCTAssertThrowsError(try Plato.run(errorCode))
    }
    
    func testMultiplication() {
        let code = """
        2*5
        25/5
        2 + 3 * 5
        10%2
        8.625%0.75 #0.375
        """
        XCTAssertNoThrow(try Plato.run(code))
        
        let errorCode = """
        "Error" * "String"
        [1, 3, 4] / [4, 5]
        1 *
        """
        XCTAssertThrowsError(try Plato.run(errorCode))
    }
    
    func testExponent() {
        let code = """
        2^TRUE
        2^FALSE
        2^3
        2^2^2
        2.5^2
        2^2.5
        2^2^2.5
        """
        XCTAssertNoThrow(try Plato.run(code))
        
        let errorCode = """
        2^"Hey"
        """
        XCTAssertThrowsError(try Plato.run(errorCode))
    }
    
    func testBoolean() {
        let code = """
        TRUE and TRUE
        TRUE and FALSE
        TRUE or TRUE
        TRUE or FALSE
        1 and 0
        3 and 5
        6 or 0
        !TRUE
        !FALSE
        !1
        !0
        !4
        """
        XCTAssertNoThrow(try Plato.run(code))
    }
}
