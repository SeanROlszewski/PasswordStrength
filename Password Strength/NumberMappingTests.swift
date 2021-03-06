import XCTest
@testable import Password_Strength

class NumberMappingTests: XCTestCase {
    let accuracy = 0.0000001
    
    func testMappingNumberBetweenRanges() {
        XCTAssertEqual(0.map(from: 0, to: 10, within: 0, and: 20), 0, accuracy: accuracy)
        XCTAssertEqual(0.map(from: 0, to: 10, within: 10, and: 5), 10, accuracy: accuracy)
        XCTAssertEqual(5.map(from: 0, to: 10, within: 0, and: 20), 10, accuracy: accuracy)
        XCTAssertEqual(5.map(from: 0, to: 10, within: 10, and: 5), 7.5, accuracy: accuracy)
        XCTAssertEqual(10.map(from: 0, to: 10, within: 10, and: 5), 5, accuracy: accuracy)
        XCTAssertEqual(10.map(from: 0, to: 10, within: 0, and: 20), 20, accuracy: accuracy)
    }
}
