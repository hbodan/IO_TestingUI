//
//  HomeViewControllerTest.swift
//  TestingHomeworkUITests
//
//  Created by User-UAM on 11/30/24.
//

import XCTest
@testable import TestingHomework

class HomeViewControllerTests: XCTestCase {
    var viewController: HomeViewController!
        var window: UIWindow!
        
        override func setUp() {
            super.setUp()
            
            // Configura la ventana y el controlador de vista
            window = UIWindow(frame: UIScreen.main.bounds)
            viewController = HomeViewController()
            
            // Carga la vista
            window.rootViewController = viewController
            window.makeKeyAndVisible()
            
            // Asegúrate de que la vista se cargue completamente
            XCTAssertNotNil(viewController.view, "La vista no debería ser nil")
            
            _ = viewController.view

        }
        
        override func tearDown() {
            window = nil
            viewController = nil
            super.tearDown()
        }
        
        // Prueba para verificar la existencia de elementos
        func testUIElementsExist() {
            XCTAssertNotNil(viewController.welcomeLabel, "El label 'welcomeLabel' debería existir")
            XCTAssertNotNil(viewController.profileImageView, "La imagen 'profileImageView' debería existir")
            XCTAssertNotNil(viewController.tableView, "La tabla 'tableView' debería existir")
        }
        
        // Prueba de interactividad
        func testUIElementsAreInteractable() {
            XCTAssertTrue(viewController.welcomeLabel.isUserInteractionEnabled == false, "El label 'welcomeLabel' no debería ser interactivo")
            XCTAssertTrue(viewController.profileImageView.isUserInteractionEnabled == false, "La imagen 'profileImageView' no debería ser interactiva")
            XCTAssertTrue(viewController.tableView.isUserInteractionEnabled, "La tabla 'tableView' debería ser interactiva")
        }
        
        // Prueba de visibilidad de las celdas
        func testTableViewFirstAndLastCellsVisible() {
            
            // Fuerza el layout para asegurarse de que todo se renderice
            viewController.tableView.layoutIfNeeded()
            
            // Espera a que la tabla cargue
            let expectation = self.expectation(description: "TableView should load cells")
            
            // Desplaza la tabla hacia la última celda
            let lastIndexPath = IndexPath(row: viewController.items.count - 1, section: 0)
            viewController.tableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: false)
                
            // Espera un breve momento para asegurar que el desplazamiento y renderizado se completen
            DispatchQueue.main.async {
                self.viewController.tableView.layoutIfNeeded()
                expectation.fulfill()
            }
                   
            // Espera hasta que la tabla haya renderizado las celdas
            wait(for: [expectation], timeout: 1.0)
                   
            // Accede a la primera y última celda
            let firstCell = self.viewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
            let lastCell = self.viewController.tableView.cellForRow(at: lastIndexPath)
                   
            // Verifica si las celdas no son nil
            XCTAssertNotNil(firstCell, "La primera celda debería estar visible")
            XCTAssertNotNil(lastCell, "La última celda debería estar visible")
        }
    }
