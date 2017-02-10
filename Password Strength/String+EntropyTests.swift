import XCTest
@testable import Password_Strength

class String_EntropyTests: XCTestCase {
    func testStringEntropy() {
        var subject = ""
        XCTAssertEqual(subject.entropy, 0)
        
        subject = "a"
        XCTAssertEqual(subject.entropy, 4.70043971814)

        subject = "!"
        XCTAssertEqual(subject.entropy, 5)

        subject = "1"
        XCTAssertEqual(subject.entropy, 3.32192809489)

        subject = "B"
        XCTAssertEqual(subject.entropy, 4.70043971814)

        subject = "aaaaaaaaaaaaaaaaaaaa"
        XCTAssertEqual(subject.entropy, 94.0087943628)

        subject = "aaaaaaaaaaaaaaaaaaa!"
        XCTAssertEqual(subject.entropy, 117.159619903)

        subject = "aaaaaaaaaaaaaaaaaa!1"
        XCTAssertEqual(subject.entropy, 121.749256825)

        subject = "aaaaaaaaaaaaaaaaa1!B"
        XCTAssertEqual(subject.entropy, 131.091777034)
        
        // subject = "anu17diha792udb1i$an"
        // XCTAssertEqual(subject.entropy, 0)

        
    }
}
