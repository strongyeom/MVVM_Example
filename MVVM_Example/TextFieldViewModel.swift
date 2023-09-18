//
//  TextFieldViewModel.swift
//  MVVM_Example
//
//  Created by 염성필 on 2023/09/18.
//

import Foundation

class TextFieldViewModel {
    
    var email:Observable<String?> = Observable("")
    var password:Observable<String?> = Observable("")
    var nickname:Observable<String?> = Observable("")
    var location:Observable<String?> = Observable("")
    var recommend:Observable<String?> = Observable("")
    var emailvaildation = Observable(false)
    var passwordvaildation = Observable(false)
    var isSignup = Observable(false)
    
    func settingEmail() {
        guard let text = email.value else { return }
        if !text.contains("@") {
            self.emailvaildation.value = false
        } else {
            self.emailvaildation.value = true
        }
    }

    
    func settingPassword() {
        guard let text = password.value else {
            passwordvaildation.value = false
            return
        }
        
        guard text.count >= 6, text.count <= 10 else {
            passwordvaildation.value = false
            return
        }
        
        guard let convertString = Int(text) else {
            passwordvaildation.value = false
            return
        }
        password.value = "\(convertString)"
        passwordvaildation.value = true
       
    }
    
    func settingIsSignup() {
        if emailvaildation.value == true && passwordvaildation.value ==  true {
            isSignup.value = true
        } else {
            isSignup.value = false
        }
    }
    
}
