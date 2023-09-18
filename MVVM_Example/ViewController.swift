//
//  ViewController.swift
//  MVVM_Example
//
//  Created by 염성필 on 2023/09/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var recommendTextField: UITextField!
    @IBOutlet var signupBtn: UIButton!
    
    
    @IBOutlet var emailVaildation: UIImageView!
    @IBOutlet var passwordVaildation: UIImageView!
    @IBOutlet var nicknameVaildation: UIImageView!
    @IBOutlet var locationVaildation: UIImageView!
    @IBOutlet var recommendVaildation: UIImageView!
    
    
    
    
    
    
    var viewModel = TextFieldViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
        emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        
        passwordTextField.addTarget(self, action: #selector(passWordTextFieldChanged), for: .editingChanged)
        
        
        
        
        
        
        
        
        
        viewModel.email.bind { [weak self] text in
            guard let self else { return }
          //  self.settingAlert(text: text ?? "")
            self.emailTextField.text = text
        }
        
        viewModel.password.bind { text in
            self.passwordTextField.text = text ?? ""
        }
        
        viewModel.emailvaildation.bind { bool in
            if bool {
                self.emailVaildation.image = UIImage(systemName: "checkmark.circle.fill")
                self.emailVaildation.tintColor = .blue
            } else {
                self.emailVaildation.image = UIImage(systemName: "checkmark.circle")
                self.emailVaildation.tintColor = .red
            }
            
        }
        
        viewModel.passwordvaildation.bind { bool in
            if bool {
                self.passwordVaildation.image = UIImage(systemName: "checkmark.circle.fill")
                self.passwordVaildation.tintColor = .blue
            } else {
                self.passwordVaildation.image = UIImage(systemName: "checkmark.circle")
                self.passwordVaildation.tintColor = .red
            }
            
        }
        
        viewModel.isSignup.bind { bool in
            self.signupBtn.isEnabled = bool
            
        }
      
    }
    
    @objc func emailTextFieldChanged() {
        viewModel.email.value = emailTextField.text!
        viewModel.settingEmail()
        viewModel.settingIsSignup()
    }
    
    @objc func passWordTextFieldChanged() {
        viewModel.password.value = passwordTextField.text!
        viewModel.settingPassword()
        viewModel.settingIsSignup()
    }
    


    
}

extension ViewController {
    func configureTextField() {
        emailTextField.settupPlaceHodler(text: "이메일을 입력해주세요")
        passwordTextField.settupPlaceHodler(text: "비밀번호를 입력해주세요")
        nicknameTextField.settupPlaceHodler(text: "닉네임을 입력해주세요")
        locationTextField.settupPlaceHodler(text: "위치를 입력해주세요")
        recommendTextField.settupPlaceHodler(text: "추천자를 입력해주세요")
    }
    
    func settingAlert(text: String) {
        if !text.contains("@") {
            
            let alert = UIAlertController(title: "이메일을 다시 입력해주세요.", message: "올바르지 않은 이메일입니다. @가 포함되어야 합니다.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default) { _ in
                self.emailTextField.text = ""
            }
            
            alert.addAction(ok)
            self.present(alert, animated: true)
            
        }
    }
}
