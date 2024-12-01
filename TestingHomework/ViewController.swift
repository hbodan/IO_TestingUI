//
//  ViewController.swift
//  TestingHomework
//
//  Created by User-UAM on 11/30/24.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Elements
    public let userTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "User"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "userTextField"
        return textField
    }()
    
    public let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "passwordTextField"
        return textField
    }()
    
    public let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "loginButton"
        return button
    }()
    
    public let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "registerButton"
        return button
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupActions()
    }
    
    // MARK: - UI Setup
    public func setupUI() {
        // Add subviews
        view.addSubview(userTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        
        // Layout constraints
        NSLayoutConstraint.activate([
            userTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            userTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalTo: userTextField.widthAnchor),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.widthAnchor.constraint(equalTo: userTextField.widthAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
        ])
    }
    
    // MARK: - Actions
    public func setupActions() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    @objc public func loginButtonTapped() {
        let homeVC = HomeViewController()
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true)
    }
    
    @objc public func registerButtonTapped() {
        let registerVC = RegisterViewController()
        registerVC.modalPresentationStyle = .fullScreen
        present(registerVC, animated: true)
    }
}
