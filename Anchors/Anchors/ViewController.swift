//
//  ViewController.swift
//  Anchors
//
//  Created by Rahul on 08/05/21.
//

import UIKit

class LoginVC: UIViewController {
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "logo")
        imageView.accessibilityIdentifier = "appLogo"
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var emailTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.keyboardType = .emailAddress
        textfield.delegate = self
        textfield.returnKeyType = .next
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Email address"
        textfield.font = .preferredFont(forTextStyle: .subheadline)
        textfield.adjustsFontForContentSizeCategory = true
        textfield.accessibilityIdentifier = "emailField"
        return textfield
    }()
    
    lazy var passwordTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .roundedRect
        textfield.delegate = self
        textfield.returnKeyType = .done
        textfield.placeholder = "Password"
        textfield.font = .preferredFont(forTextStyle: .subheadline)
        textfield.adjustsFontForContentSizeCategory = true
        textfield.accessibilityIdentifier = "passwordField"
        return textfield
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.accessibilityIdentifier = "loginButton"
        return button
    }()
    
    override func loadView() {
        super.loadView()
        
        setupViews()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.addTarget(self, action: #selector(self.loginButtonTapped), for: .touchUpInside)
        
    }
    
    @objc
    func loginButtonTapped() {
        if isValidFields() {
            // Navigate to next viewcontrollers
        }
    }
    
    func isValidFields() -> Bool {
        let userName = emailTextfield.text!
        let password = passwordTextfield.text!
        
        if userName.isEmpty {
            Manager.showAlert(message: "Please enter email address", inViewController: self, completionHandler: nil)
            return false
        }
        
        if password.isEmpty {
            Manager.showAlert(message: "Please enter password", inViewController: self, completionHandler: nil)
            return false
        }
        
        return true
    }
    
}

//MARK: - UITextField Delegate Methods
extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextfield {
            passwordTextfield.becomeFirstResponder()
        } else if textField == passwordTextfield {
            loginButtonTapped()
        }
        
        return true
    }
}

//MARK: - View Anchors Related
extension LoginVC {
    func setupViews() {
        view.addSubview(logoImageView)
        view.addSubview(emailTextfield)
        view.addSubview(passwordTextfield)
        view.addSubview(loginButton)
        
        func setupLogo() {
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
            logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
            logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
            logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        }
        
        func setupUserName() {
            emailTextfield.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16).isActive = true
            emailTextfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
            emailTextfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
            emailTextfield.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
        
        func setupPassword() {
            passwordTextfield.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor, constant: 20).isActive = true
            passwordTextfield.leadingAnchor.constraint(equalTo: emailTextfield.leadingAnchor).isActive = true
            passwordTextfield.trailingAnchor.constraint(equalTo: emailTextfield.trailingAnchor).isActive = true
            passwordTextfield.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
        
        func setupLoginButton() {
            loginButton.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor, constant: 32).isActive = true
            loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
            loginButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
            loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        }
        
        setupLogo()
        setupUserName()
        setupPassword()
        setupLoginButton()
    }
}

