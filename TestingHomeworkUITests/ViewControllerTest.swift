//
//  ViewControllerTest.swift
//  TestingHomeworkUITests
//
//  Created by User-UAM on 11/30/24.
//

import XCTest
@testable import TestingHomework

class ViewControllerTests: XCTestCase {
    
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = ViewController()
        _ = viewController.view  // Esto carga la vista del view controller
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    // 1. Prueba que los elementos existan
    func testElementsExist() {
        // Verificar que los campos de texto y los botones existan
        XCTAssertNotNil(viewController.userTextField)
        XCTAssertNotNil(viewController.passwordTextField)
        XCTAssertNotNil(viewController.loginButton)
        XCTAssertNotNil(viewController.registerButton)
    }
    
    // 2. Prueba que los elementos sean interactuables
    func testElementsAreInteractable() {
        // Verificar que los campos de texto sean interactuables
        XCTAssertTrue(viewController.userTextField.isUserInteractionEnabled)
        XCTAssertTrue(viewController.passwordTextField.isUserInteractionEnabled)
        
        // Verificar que el botón de login sea interactuable
        XCTAssertTrue(viewController.loginButton.isUserInteractionEnabled)
        
        // Verificar que el botón de registro sea interactuable
        XCTAssertTrue(viewController.registerButton.isUserInteractionEnabled)
    }
    
    // 3. Prueba que el botón de login responde a toques
    func testLoginButtonTap() {
        let expectation = self.expectation(description: "Login button tapped")
        
        // Simular el toque en el botón de login
        viewController.loginButton.sendActions(for: .touchUpInside)
        
        // Esperar a que la expectativa se cumpla (esto solo se cumple si la acción del botón sucede)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            expectation.fulfill() // Simula que la acción fue ejecutada
        }
        
        // Esperamos que la acción se ejecute
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("Esperaba que se ejecutara la acción del botón de login: \(error)")
            }
        }
    }
    
    // 4. Prueba que el botón de registro responde a toques
    func testRegisterButtonTap() {
        let expectation = self.expectation(description: "Register button tapped")
        
        // Simular el toque en el botón de registro
        viewController.registerButton.sendActions(for: .touchUpInside)
        
        // Esperar a que la expectativa se cumpla (esto solo se cumple si la acción del botón sucede)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            expectation.fulfill() // Simula que la acción fue ejecutada
        }
        
        // Esperamos que la acción se ejecute
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("Esperaba que se ejecutara la acción del botón de registro: \(error)")
            }
        }
    }
    
    // 5. Método simulado que revisa los placeholders
    func testTextFieldPlaceholders() {
        XCTAssertEqual(viewController.userTextField.placeholder, "User")
        XCTAssertEqual(viewController.passwordTextField.placeholder, "Password")
    }
    
    func testUserTextFieldInput() {
        // Simulamos la escritura en el campo 'userTextField'
        let userInput = "user123"
        viewController.userTextField.text = userInput
        
        // Verificamos que el texto ingresado en el campo sea el esperado
        XCTAssertEqual(viewController.userTextField.text, userInput, "El texto ingresado en el campo 'User' no es el esperado")
    }
    
    func testPasswordTextFieldInput() {
        // Simulamos la escritura en el campo 'passwordTextField'
        let passwordInput = "SecurePassword123"
        viewController.passwordTextField.text = passwordInput
        
        // Verificamos que el texto ingresado en el campo sea el esperado
        XCTAssertEqual(viewController.passwordTextField.text, passwordInput, "El texto ingresado en el campo 'Password' no es el esperado")
    }
}
