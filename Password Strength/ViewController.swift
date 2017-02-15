import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        createAccountButton.accessibilityIdentifier = "PWSSubmitLogin"
        usernameTextField.accessibilityIdentifier = "PWSUsername"
        passwordTextField.accessibilityIdentifier = "PWSPassword"
        passwordTextField.delegate = self
        passwordTextField.backgroundColor = UIColor.red
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == passwordTextField {
            
            guard let passwordText = passwordTextField.text,
            !passwordText.isEmpty else {
                UIView.animate(withDuration: 0.25, animations: {
                    self.passwordTextField.backgroundColor = UIColor.red
                })
                return true
            }
            
            let entropy = textField.text!.entropy
            let color = CGFloat(entropy.map(from: 0, to: 140, within: 0.25, and: 1))

            UIView.animate(withDuration: 0.25, animations: {
                if entropy >= 70 {
                    self.passwordTextField.backgroundColor = UIColor(red: 0, green: color, blue: 0, alpha: 1.0 )
                } else {
                    self.passwordTextField.backgroundColor = UIColor(red: 1-color, green: color, blue: 0, alpha: 1.0 )
                }
            })
        }
        return true
    }
}
