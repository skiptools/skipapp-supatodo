import XCTest
import OSLog
import Foundation
@testable import SupaTODO

let logger: Logger = Logger(subsystem: "SupaTODO", category: "Tests")

@available(macOS 13, *)
final class SupaTODOTests: XCTestCase {
    func testSupaTODO() throws {
        logger.log("running testSupaTODO")
        XCTAssertEqual(1 + 2, 3, "basic test")
        
        // load the TestData.json file from the Resources folder and decode it into a struct
        let resourceURL: URL = try XCTUnwrap(Bundle.module.url(forResource: "TestData", withExtension: "json"))
        let testData = try JSONDecoder().decode(TestData.self, from: Data(contentsOf: resourceURL))
        XCTAssertEqual("SupaTODO", testData.testModuleName)
    }
}

struct TestData : Codable, Hashable {
    var testModuleName: String
}
