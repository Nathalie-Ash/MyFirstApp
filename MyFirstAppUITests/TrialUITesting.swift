//
//  TrialUITesting.swift
//  MyFirstAppUITests
//
//  Created by Nathalie on 17/07/2023.
//


import XCTest
@testable import MyFirstApp

final class TrialUITesting: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
        
    }
    
    override func tearDown() {
        app = nil
    }
    
    
    func testValidLoginSuccess() {
        let validUsername = "User"
        let validPassword = "pass123"
        
        let usernameTextField =  app.textFields["Enter Username"]
        XCTAssertTrue(usernameTextField.exists)
        
        // XCTAssertEqual(usernameTextField.label, "Enter Username")
        //XCTAssertEqual(app.staticTexts.element.label, "Enter Username")
        //        XCTAssert( app.textFields["Enter Username"].exists, "test text field doesn't exist" )
        //        let tf = app.textFields["Enter Username"]
        //        tf.tap()    // must give text field keyboard focus!
        //        tf.typeText("Hello!")
        //        XCTAssert( tf.exists, "tf exists" )   // text field still exists
        //        XCTAssertEqual( tf.value as! String, "Hello!", "text field has proper value" )
        //
        usernameTextField.tap()
        
        usernameTextField.typeText(validUsername)
        
        let passwordTextField = app.textFields["Enter Password"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText(validPassword)
        passwordTextField.typeText("\n")
        app.buttons["Login"].tap()
    }
    
}

extension XCUIApplication {
    
    func dismissKeyboard() {
        if self.keyboards.element(boundBy: 0).exists {
            if UIDevice.current.userInterfaceIdiom == .pad {
                self.keyboards.buttons["Hide keyboard"].tap()
            } else {
                self.toolbars.buttons["Done"].tap()
            }
        }
    }
}
