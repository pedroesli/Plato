import XCTest
import Foundation
@testable import Plato

final class PlatoTests: XCTestCase {
    func testGeneral() throws {
        let code = """
        21 + 2
        """
        try Plato.run(code)
    }
}
