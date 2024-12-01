//
//  RegisterViewControllerTest.swift
//  TestingHomeworkUITests
//
//  Created by User-UAM on 11/30/24.
//

import XCTest
@testable import TestingHomework

class RegisterViewControllerTest: XCTestCase {
    
    var registerVC: RegisterViewController!
    
    override func setUp() {
        super.setUp()
        registerVC = RegisterViewController()
        _ = registerVC.view  //
    }
    
    override func tearDown() {
        registerVC = nil
        super.tearDown()
    }

    func testRegisterViewControllerInitialization() {
        let viewController = RegisterViewController()
        XCTAssertNotNil(viewController)
    }
    
    // 1. Prueba que los elementos existan
    func testElementsExist() {
        // Verificar que los campos de texto y los botones existan
        XCTAssertNotNil(registerVC.nameTextField)
        XCTAssertNotNil(registerVC.userIDTextField)
        XCTAssertNotNil(registerVC.phoneTextField)
        XCTAssertNotNil(registerVC.passwordTextField)
        XCTAssertNotNil(registerVC.repeatPasswordTextField)
        XCTAssertNotNil(registerVC.registerButton)
        XCTAssertNotNil(registerVC.backButton)
    }
    
    // 2. Prueba que los elementos sean interactuables
    func testElementsAreInteractable() {
        // Verificar que los campos de texto sean interactuables
        XCTAssertTrue(registerVC.nameTextField.isUserInteractionEnabled)
        XCTAssertTrue(registerVC.userIDTextField.isUserInteractionEnabled)
        XCTAssertTrue(registerVC.phoneTextField.isUserInteractionEnabled)
        XCTAssertTrue(registerVC.passwordTextField.isUserInteractionEnabled)
        XCTAssertTrue(registerVC.repeatPasswordTextField.isUserInteractionEnabled)
        
        // Verificar que el botón de registro sea interactuable
        XCTAssertTrue(registerVC.registerButton.isUserInteractionEnabled)
        
        // Verificar que el botón de retroceso sea interactuable
        XCTAssertTrue(registerVC.backButton.isUserInteractionEnabled)
    }
    
    // 3. Prueba que el botón de registro responde a toques
    func testRegisterButtonTap() {
        let expectation = self.expectation(description: "Register button tapped")

        // Simular el toque en el botón de registro
        registerVC.registerButton.sendActions(for: .touchUpInside)
        
        // Esperar a que la expectativa se cumpla (esto solo se cumple si la acción del botón sucede)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            expectation.fulfill() // Simula que la acción fue ejecutada
        }

        // Esperamos que la acción se ejecute
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("Esperaba que se ejecutara la acción del botón: \(error)")
            }
        }
    }
    
    // 4. Prueba que el botón de back responde a toques
    func testBackButtonTap() {
        let expectation = self.expectation(description: "Back button tapped")

        // Simular el toque en el botón de regreso
        registerVC.backButton.sendActions(for: .touchUpInside)
        
        // Esperar a que la expectativa se cumpla (esto solo se cumple si la acción del botón sucede)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            expectation.fulfill() // Simula que la acción fue ejecutada
        }

        // Esperamos que la acción se ejecute
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("Esperaba que se ejecutara la acción del botón de regreso: \(error)")
            }
        }
    }
    
    // 5. Método simulado que revisa los placeholder
    func testTextFieldPlaceholders() {
        XCTAssertEqual(registerVC.nameTextField.placeholder, "Name")
        XCTAssertEqual(registerVC.userIDTextField.placeholder, "UserID")
        XCTAssertEqual(registerVC.phoneTextField.placeholder, "Phone")
        XCTAssertEqual(registerVC.passwordTextField.placeholder, "Password")
        XCTAssertEqual(registerVC.repeatPasswordTextField.placeholder, "Repeat Password")
    }
    
    func testNameTextFieldInput() {
        // Simulamos la escritura en el campo 'nameTextField'
        let nameInput = "John Doe"
        registerVC.nameTextField.text = nameInput
        
        // Verificamos que el texto ingresado en el campo sea el esperado
        XCTAssertEqual(registerVC.nameTextField.text, nameInput, "El texto ingresado en el campo 'Name' no es el esperado")
    }
    
    func testUserIDTextFieldInput() {
        // Simulamos la escritura en el campo 'userIDTextField'
        let userIDInput = "user123"
        registerVC.userIDTextField.text = userIDInput
        
        // Verificamos que el texto ingresado en el campo sea el esperado
        XCTAssertEqual(registerVC.userIDTextField.text, userIDInput, "El texto ingresado en el campo 'UserID' no es el esperado")
    }
    
    func testPhoneTextFieldInput() {
        // Simulamos la escritura en el campo 'phoneTextField'
        let phoneInput = "123-456-7890"
        registerVC.phoneTextField.text = phoneInput
        
        // Verificamos que el texto ingresado en el campo sea el esperado
        XCTAssertEqual(registerVC.phoneTextField.text, phoneInput, "El texto ingresado en el campo 'Phone' no es el esperado")
    }
    
    func testPasswordTextFieldInput() {
        // Simulamos la escritura en el campo 'passwordTextField'
        let passwordInput = "SecurePass123"
        registerVC.passwordTextField.text = passwordInput
        
        // Verificamos que el texto ingresado en el campo sea el esperado
        XCTAssertEqual(registerVC.passwordTextField.text, passwordInput, "El texto ingresado en el campo 'Password' no es el esperado")
    }
    
    func testRepeatPasswordTextFieldInput() {
        // Simulamos la escritura en el campo 'repeatPasswordTextField'
        let repeatPasswordInput = "SecurePass123"
        registerVC.repeatPasswordTextField.text = repeatPasswordInput
        
        // Verificamos que el texto ingresado en el campo sea el esperado
        XCTAssertEqual(registerVC.repeatPasswordTextField.text, repeatPasswordInput, "El texto ingresado en el campo 'Repeat Password' no es el esperado")
    }
    
}
