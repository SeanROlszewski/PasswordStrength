import XCTest
import UIKit
@testable import Password_Strength

class ViewControllerTests: XCTestCase {
    var subject: ViewController!
    var mockNotificationCenter: MockNotificationCenter!
    
    override func setUp() {
        super.setUp()
        mockNotificationCenter = MockNotificationCenter()
        subject = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
        subject.notificationCenter = mockNotificationCenter
        _ = subject.view
    }
    
    func testRegistersForNotifications() {
        XCTAssertEqual(mockNotificationCenter.addObserverCall.recieved?.name, .UITextFieldTextDidChange)
        XCTAssertEqual(mockNotificationCenter.addObserverCall.recieved?.object as? UITextField, subject.passwordTextField)
        XCTAssertEqual(mockNotificationCenter.addObserverCall.recieved?.queue, nil)
    }
    
    func testPasswordTextFieldUpdatesOnUserInput() {
        subject.passwordTextField.text = ""
        mockNotificationCenter.post(Notification(name: .UITextFieldTextDidChange))
        let emptyColor = subject.passwordTextField.backgroundColor
        
        subject.passwordTextField.text = "Any"
        mockNotificationCenter.post(Notification(name: .UITextFieldTextDidChange))
        let firstColor = subject.passwordTextField.backgroundColor

        subject.passwordTextField.text = "Anyth1ng_Else!"
        mockNotificationCenter.post(Notification(name: .UITextFieldTextDidChange))
        let secondColor = subject.passwordTextField.backgroundColor
        
        subject.passwordTextField.text = "Anyth1ng_Else!_B4Mc@"
        mockNotificationCenter.post(Notification(name: .UITextFieldTextDidChange))
        let thirdColor = subject.passwordTextField.backgroundColor
        
        XCTAssertEqual(emptyColor, .red)
        XCTAssertTrue(emptyColor !== firstColor)
        XCTAssertTrue(firstColor !== secondColor)
        XCTAssertTrue(secondColor !== thirdColor)
    }
    
    func testPasswordFieldHasWhiteBackgroundWhenEmpty() {
        XCTAssertEqual(subject.passwordTextField.backgroundColor, .white)
    }
    
    func testPasswordFieldRejectsSpaces() {
        subject.passwordTextField.text = " "
        mockNotificationCenter.post(Notification(name: .UITextFieldTextDidChange))
        XCTAssert(subject.passwordTextField.text!.isEmpty)
    }
}
