import XCTest
@testable import Password_Strength

class String_EntropyTests: XCTestCase {
    func testStringEntropy() {
        var subject = ""
        let accuracy = 0.00000001
        
        XCTAssertEqual(subject.entropy, 0)
        
        subject = "a"
        XCTAssertEqualWithAccuracy(subject.entropy, 4.70043971814, accuracy: accuracy)

        subject = "!"
        XCTAssertEqualWithAccuracy(subject.entropy, 5, accuracy: accuracy)

        subject = "1"
        XCTAssertEqualWithAccuracy(subject.entropy, 3.32192809489, accuracy: accuracy)

        subject = "B"
        XCTAssertEqualWithAccuracy(subject.entropy, 4.70043971814, accuracy: accuracy)

        subject = "aaaaaaaaaaaaaaaaaaaa"
        XCTAssertEqualWithAccuracy(subject.entropy, 94.0087943628, accuracy: accuracy)

        subject = "aaaaaaaaaaaaaaaaaaa!"
        XCTAssertEqualWithAccuracy(subject.entropy, 117.159619903, accuracy: accuracy)

        subject = "aaaaaaaaaaaaaaaaaa!1"
        XCTAssertEqualWithAccuracy(subject.entropy, 121.749256825, accuracy: accuracy)

        subject = "aaaaaaaaaaaaaaaaa1!B"
        XCTAssertEqualWithAccuracy(subject.entropy, 131.091777034, accuracy: accuracy)
        
        subject = "anu17diha792udV1i!an"
        XCTAssertEqualWithAccuracy(subject.entropy, 131.091777034, accuracy: accuracy)

        
    }
}
