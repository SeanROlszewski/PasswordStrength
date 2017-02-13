import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == passwordTextField {
            guard let passwordText = passwordTextField.text,
            !passwordText.isEmpty else {
                UIView.animate(withDuration: 0.25, animations: {
                    self.passwordTextField.backgroundColor = UIColor.white
                })
                return true
            }
            let entropy = Int(textField.text!.entropy)
            let color = CGFloat(entropy.map(from: 0...140, to: (0...1000)))
            UIView.animate(withDuration: 0.25, animations: {
                self.passwordTextField.backgroundColor = UIColor(red: 0.12, green: color/100.0, blue: 0.5, alpha: 1.0 )
            })
        }
        return true
    }
}
