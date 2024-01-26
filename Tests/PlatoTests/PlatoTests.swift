import XCTest
import Foundation
@testable import Plato

final class PlatoTests: XCTestCase {
    func testGeneral() throws {
        let code = """
        [1,23]
        2
        3
        """
        try Plato.run(code)
    }
}
