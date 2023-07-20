//
//  TrialUITesting.swift
//  MyFirstAppUITests
//
//  Created by Nathalie on 17/07/2023.
//


import XCTest
@testable import MyFirstApp

final class MultipleChoiceTest: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func navigateMultipleChoiceQues() {
        let choiceAButton = app.buttons["choiceA"]
        let choiceBButton = app.buttons["choiceB"]
        let choiceCButton = app.buttons["choiceC"]
        XCTAssertTrue(choiceAButton.exists)
        XCTAssertTrue(choiceBButton.exists)
        XCTAssertTrue(choiceCButton.exists)
        choiceAButton.tap()
    }
R
    func testNavigateToMultipleChoiceView () {
        testValidLoginSuccess()
        navigateTFQues()
        let multipleChoiceButton = app.buttons["MultipleChoiceButton"]
        XCTAssertTrue(multipleChoiceButton.exists)
        multipleChoiceButton.tap()
        let multipleChoiceView = app.otherElements["MultipleChoiceView"]
        XCTAssertTrue(multipleChoiceView.exists)
    }
     
    func testNavigateToScoreViewFromMultiple() {
        testNavigateToMultipleChoiceView()
        let finalView = app.otherElements["FinalScoreView"]
        while(!finalView.exists) {
            navigateMultipleChoiceQues()
        }
        XCTAssertTrue(finalView.exists, "The final view does not exist")
   
    }
    
    func goToFinalPage() {
        
        let finalScoreButton = app.buttons["finalScoreButton"]
        XCTAssertTrue(finalScoreButton.exists)
        finalScoreButton.tap()
        let finalScoreView = app.otherElements["FinalScoreView"]
        XCTAssertTrue(finalScoreView.exists)
    }
    
    
   func testValidLoginSuccess() {
       
        let validUsername = "User"
        let validPassword = "pass123"
        
        let usernameTextField =  app.textFields["Enter Username"]
        XCTAssertTrue(usernameTextField.exists)
        usernameTextField.tap()
        usernameTextField.typeText(validUsername)
        
        let passwordTextField = app.textFields["Enter Password"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText(validPassword)
        passwordTextField.typeText("\n")
        app.buttons["Login"].tap()

        XCTAssertTrue(app.otherElements["QuizView"].exists)
    }
        
    func navigateTFQues() {
        
        while (app.buttons["finalScoreButton"].isHittable != true || app.buttons["MultipleChoiceButton"].isHittable != true) {
            let trueButton = app.buttons["True"]
            XCTAssertTrue(trueButton.exists)
            trueButton.tap()
        }
    }
}

