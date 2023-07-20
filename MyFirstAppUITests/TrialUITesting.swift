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
    
  /*  func testTrueFalseQues1() {
        testValidLoginSuccess()
        let quesLabel = app.staticTexts["quesLabel"]
        XCTAssertTrue(quesLabel.exists)
        XCTAssertEqual(quesLabel.label, "A slug's blood is green.")
        let trueButton = app.buttons["trueButton"]
        let falseButton = app.buttons["falseButton"]
        trueButton.tap()
        //trueButton.label
        //XCTAssertTrue(trueButton.backgroundColor == UIColor.green, "The button background color is not green")
    }*/
    
    func navigateMultipleChoiceQues() {
        
       // testNavigateToMultipleChoiceView()
        let choiceAButton = app.buttons["choiceA"]
        let choiceBButton = app.buttons["choiceB"]
        let choiceCButton = app.buttons["choiceC"]
        XCTAssertTrue(choiceAButton.exists)
        XCTAssertTrue(choiceBButton.exists)
        XCTAssertTrue(choiceCButton.exists)
        choiceAButton.tap()
    }


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
       // let textLabel = app.staticTexts[""]
        let finalView = app.otherElements["FinalScoreView"]
        while(!finalView.exists) {
            navigateMultipleChoiceQues()
        }
        XCTAssertTrue(finalView.exists, "The final view does not exist")
    }
    
    func navigateTFQues() {
        
        while (app.buttons["finalScoreButton"].isHittable != true || app.buttons["MultipleChoiceButton"].isHittable != true) {
            let trueButton = app.buttons["True"]
            XCTAssertTrue(trueButton.exists)
            trueButton.tap()
        }
    }
    
    func goToFinalPage() {
        
        let finalScoreButton = app.buttons["finalScoreButton"]
        XCTAssertTrue(finalScoreButton.exists)
        finalScoreButton.tap()
        let finalScoreView = app.otherElements["FinalScoreView"]
        XCTAssertTrue(finalScoreView.exists)
    }
    
    func testNavigateToScoreViewFromTF() {
        
        testValidLoginSuccess()
        navigateTFQues()
        goToFinalPage()
    }
    
    
    func testEmptyLogin() {

        app.staticTexts["Login"].tap()
        let alertDialog = app.alerts["Alert"]
        XCTAssertTrue(alertDialog.exists)
        alertDialog.scrollViews.otherElements.buttons["Close"].tap()
    }
    
    
    func testInvalidLogin() {
        
        let usernameTextField =  app.textFields["Enter Username"]
        XCTAssertTrue(usernameTextField.exists)
        usernameTextField.tap()
        
        let passwordTextField = app.textFields["Enter Password"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        
        app.buttons["Login"].tap()
        let alertDialog = app.alerts["Alert"]
        XCTAssertTrue(alertDialog.exists)
        alertDialog.scrollViews.otherElements.buttons["Close"].tap()
        
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
    
    func testPlayAgainButton() {
        testValidLoginSuccess()
        navigateTFQues()
        goToFinalPage()
         let playAgainButton = app.buttons["playAgainButton"]
         XCTAssertTrue(playAgainButton.exists)
         playAgainButton.tap()
         XCTAssertTrue(app.otherElements["QuizView"].exists)
    }
    
    func testResetScore(){
        testPlayAgainButton()
        let scoreLabel = app.staticTexts["scoreLabel"]
        XCTAssertTrue(scoreLabel.exists)
        XCTAssertEqual(scoreLabel.label, "Score: 0")
        
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
