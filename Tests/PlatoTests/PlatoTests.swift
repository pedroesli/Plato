import XCTest
import Foundation
@testable import Plato

final class PlatoTests: XCTestCase {
    func testGeneral() {
        let code = """
        [1,23]
        2
        "321pedro"
        """
        XCTAssertNoThrow(try Plato.run(code))
    }
    
    func testAddition() {
        let code = """
        1+2
        44+55.5
        TRUE + FALSE
        3 + TRUE
        "hello" + ", world!"
        [1, 2, 3] + [4, 5, 6]
        1 - 3
        3.5 - 6
        4 - TRUE
        """
        XCTAssertNoThrow(try Plato.run(code))
        
        let errorCode = """
        "Error" - "String"
        [1, 3, 4] - [4, 5]
        """
        XCTAssertThrowsError(try Plato.run(errorCode))
    }
}
