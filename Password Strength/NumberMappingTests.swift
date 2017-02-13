import XCTest
@testable import Password_Strength

class NumberMappingTests: XCTestCase {
    func testMappingNumberBetweenRanges() {
        let rangeOne = 0...10
        let rangeTwo = 0x7777...0x8888
        let rangeThree = 0...20
        
        XCTAssertEqual(0.map(from: rangeOne, to: rangeThree), 0)
        XCTAssertEqual(0.map(from: rangeOne, to: rangeThree), 0)
        XCTAssertEqual(5.map(from: rangeOne, to: rangeThree), 10)
        XCTAssertEqual(5.map(from: rangeOne, to: rangeTwo), 0x7FFF)
        XCTAssertEqual(10.map(from: rangeOne, to: rangeTwo), 0x8888)
        XCTAssertEqual(10.map(from: rangeOne, to: rangeThree), 20)
    }
}
