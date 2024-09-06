//
//  BMICalculatorEndToEndUITestsLaunchTests.swift
//  BMICalculatorEndToEndUITests
//
//  Created by Alfonso Gonzalez Miramontes on 05/09/24.
//

import XCTest

final class when_user_calculates_in_metric: XCTestCase {
    
   override func setUp(){
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
        
        //fill out the textfields
       let weightTextField =  app.textFields["weight"]
       let heightTextField = app.textFields["height"]
       let calculateButton = app.buttons["calculateButton"]
       let closeAlertButton = app.buttons["closeAlertButton"]
        
        weightTextField.tap()
        weightTextField.typeText("103")
        
        heightTextField.tap()
        heightTextField.typeText("181")
        
        calculateButton.tap()
        closeAlertButton.tap()
        
    }
}
