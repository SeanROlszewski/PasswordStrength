import XCTest

class Password_StrengthUITests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launch()
    }
    
    func testUserSeesLoginForm() {
        XCTAssertTrue(app.textFields["PWSUsername"].exists)
        XCTAssertTrue(app.secureTextFields["PWSPassword"].exists)
        XCTAssertTrue(app.buttons["PWSSubmitLogin"].exists)
    }
}
