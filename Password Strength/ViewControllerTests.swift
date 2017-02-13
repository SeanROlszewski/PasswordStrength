import XCTest
@testable import Password_Strength

class ViewControllerTests: XCTestCase {
    var subject: ViewController!
    
    override func setUp() {
        super.setUp()
        subject = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
        _ = subject.view
    }
    
    func testExample() {
        XCTAssertTrue(subject.textField(subject.passwordTextField,
                                         shouldChangeCharactersIn: NSRange(),
                                         replacementString: ""))
        subject.passwordTextField.text = ""
        let initialColor = subject.passwordTextField.backgroundColor
        XCTAssertEqual(initialColor, UIColor.white)
        
        subject.passwordTextField.text = "Any"
        _ = subject.textField(subject.passwordTextField,
                          shouldChangeCharactersIn: NSRange(),
                          replacementString: "")
        let firstColor = subject.passwordTextField.backgroundColor

        subject.passwordTextField.text = "Anyth1ng Else!"
        _ = subject.textField(subject.passwordTextField,
                          shouldChangeCharactersIn: NSRange(),
                          replacementString: "")
        let secondColor = subject.passwordTextField.backgroundColor
        
        subject.passwordTextField.text = "Anyth1ng Else! B4Mc@"
        _ = subject.textField(subject.passwordTextField,
                          shouldChangeCharactersIn: NSRange(),
                          replacementString: "")
        let thirdColor = subject.passwordTextField.backgroundColor
        
        XCTAssertTrue(initialColor !== firstColor)
        XCTAssertTrue(firstColor !== secondColor)
        XCTAssertTrue(secondColor !== thirdColor)
    }
}
