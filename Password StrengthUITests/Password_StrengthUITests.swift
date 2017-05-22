import XCTest

class Password_StrengthUITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
    
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testUserSeesLoginForm() {
        XCTAssert(app.textFields["PWSUsername"].exists)
        XCTAssert(app.secureTextFields["PWSPassword"].exists)
        XCTAssert(app.buttons["PWSSubmitLogin"].exists)
    }
}
