//
//  LoginUITest.swift
//  AnchorsUITests
//
//  Created by Rahul on 09/05/21.
//

import XCTest

class LoginUITest: XCTestCase {
    
    lazy var app : XCUIApplication = {
        return XCUIApplication()
    }()
    
    var emailField : XCUIElement {
        return app.textFields["emailField"]
    }
    
    var passwordField : XCUIElement {
        return app.textFields["passwordField"]
    }
    
    var loginButton : XCUIElement {
        return app.buttons["loginButton"]
    }
    
    var logo : XCUIElement {
        return app.images["logo"]
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app.launch()
    }

    override func tearDownWithError() throws {
        
    }
    
    func testLoginSuccess() {
        XCTAssertTrue(logo.exists)
        
        XCTAssertTrue(emailField.exists)
        
        emailField.tap()
        emailField.typeText("rahul@gmail.com")
        
        XCTAssertTrue(passwordField.exists)
        
        passwordField.tap()
        passwordField.typeText("12345678")
        
        XCTAssertTrue(loginButton.exists)
        
        loginButton.tap()
    }
    
    func testEmptyEmailValidation() {
        XCTAssertTrue(logo.exists)
        
        XCTAssert(emailField.exists)
        
        emailField.tap()
        emailField.typeText("")
        
        XCTAssertTrue(passwordField.exists)
        
        passwordField.tap()
        passwordField.typeText("12345678")
        
        XCTAssertTrue(loginButton.exists)
        
        loginButton.tap()
        
        XCTAssert(app.alerts.element.staticTexts["Please enter email address"].exists)
    }
    
    func testInavlidEmailValidation() {
        XCTAssertTrue(logo.exists)
        
        XCTAssert(emailField.exists)
        
        emailField.tap()
        emailField.typeText("r.com")
        
        XCTAssertTrue(passwordField.exists)
        
        passwordField.tap()
        passwordField.typeText("12345678")
        
        XCTAssertTrue(loginButton.exists)
        
        loginButton.tap()
        
        XCTAssert(app.alerts.element.staticTexts["Please enter valid email address"].exists)
    }
    
    func testEmptyPasswordValidation() {
        XCTAssertTrue(logo.exists)
        
        XCTAssert(emailField.exists)
        
        emailField.tap()
        emailField.typeText("rahul@gmail.com")
        
        XCTAssertTrue(passwordField.exists)
        
        passwordField.tap()
        passwordField.typeText("")
        
        XCTAssertTrue(loginButton.exists)
        
        loginButton.tap()
        
        XCTAssert(app.alerts.element.staticTexts["Please enter password"].exists)
    }

}
