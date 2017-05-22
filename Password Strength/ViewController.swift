import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    
    var notificationCenter: NotificationCenterProtocol = NotificationCenter.default

    deinit {
        notificationCenter.removeObserver(passwordTextField)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAccountButton.accessibilityIdentifier = "PWSSubmitLogin"
        usernameTextField.accessibilityIdentifier = "PWSUsername"
        passwordTextField.accessibilityIdentifier = "PWSPassword"
        passwordTextField.backgroundColor = .white
        _ = notificationCenter.addObserver(forName: .UITextFieldTextDidChange, object: passwordTextField, queue: nil) { (_) in
            self.updatePasswordTextField()
        }
    }
    
    fileprivate func updatePasswordTextField() {
        guard let passwordText = passwordTextField.text,
            !passwordText.isEmpty else {
                UIView.animate(withDuration: 0.25) {
                    self.passwordTextField.backgroundColor = .red
                }
                return
        }
        
        if passwordText.contains(" ") {
            passwordTextField.text = passwordText.replacingOccurrences(of: " ", with: "")
        }
        
        let entropy = passwordText.entropy
        animatePasswordFieldBackgroundColor(forEntropy: entropy)
    }
    
    private func animatePasswordFieldBackgroundColor(forEntropy entropy: Double) {
        let color = CGFloat(entropy.map(from: 0, to: 140, within: 0.25, and: 1))
        
        UIView.animate(withDuration: 0.25) {
            if entropy >= 70 {
                self.passwordTextField.backgroundColor = UIColor(red: 0, green: color, blue: 0, alpha: 1.0 )
            } else {
                self.passwordTextField.backgroundColor = UIColor(red: 1 - color, green: color, blue: 0, alpha: 1.0 )
            }
        }
    }
}
