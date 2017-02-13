import XCTest
@testable import Password_Strength

class String_EntropyTests: XCTestCase {
    var subject: String!
    let accuracy = 0.00000001
    
    override func setUp() {
        super.setUp()
        
        subject = ""
    }
    
    func testStringEntropy() {
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
    
    func testAverageStringEntropy() {
        XCTAssertEqual(subject.averageEntropy, 0)
        
        subject = "a"
        XCTAssertEqualWithAccuracy(subject.averageEntropy, 4.70043971814, accuracy: accuracy)
        
        subject = "!"
        XCTAssertEqualWithAccuracy(subject.averageEntropy, 5, accuracy: accuracy)
        
        subject = "1"
        XCTAssertEqualWithAccuracy(subject.averageEntropy, 3.32192809489, accuracy: accuracy)
        
        subject = "B"
        XCTAssertEqualWithAccuracy(subject.averageEntropy, 4.70043971814, accuracy: accuracy)
        
        subject = "aaaaaaaaaaaaaaaaaaaa"
        XCTAssertEqualWithAccuracy(subject.averageEntropy, 4.700439718, accuracy: accuracy)
        
        subject = "aaaaaaaaaaaaaaaaaaa!"
        XCTAssertEqualWithAccuracy(subject.averageEntropy, 5.857980995, accuracy: accuracy)
        
        subject = "aaaaaaaaaaaaaaaaaa!1"
        XCTAssertEqualWithAccuracy(subject.averageEntropy, 6.087462841, accuracy: accuracy)
        
        subject = "aaaaaaaaaaaaaaaaa1!B"
        XCTAssertEqualWithAccuracy(subject.averageEntropy, 6.554588852, accuracy: accuracy)
        
        subject = "anu17diha792udV1i!an"
        XCTAssertEqualWithAccuracy(subject.averageEntropy, 6.554588852, accuracy: accuracy)
    }
}
