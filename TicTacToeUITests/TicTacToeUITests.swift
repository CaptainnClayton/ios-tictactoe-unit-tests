//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Clayton Watkins on 7/29/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

@testable import TicTacToe

class TicTacToeUITests: XCTestCase {
    var app = XCUIApplication()
    
    func testMiddleVerticalWin() throws {
        launch()
        
        play(elements: [
            app.buttons["topMiddleButton"],
            app.buttons["middleLeftButton"],
            app.buttons["middleMiddleButton"],
            app.buttons["bottomLeftButton"],
            app.buttons["bottomMiddleButton"]
        ])
        
        compareWinCondition(playerString: "Player X won!")
    }
    
    func testMiddleHorizontalWin(){
        playerXWin(elementIdentifiers:[
            "middleLeftButton",
            "topLeftButton",
            "middleMiddleButton",
            "topMiddleButton",
            "middleRightButton"])
    }
    
}

extension TicTacToeUITests {
    
    func launch(){
        app.launch()
    }
    
    func play(elements: [XCUIElement]){
        // Tap the buttons in the correct order
        for element in elements {
            element.tap()
        }
    }
    
    func compareWinCondition(playerString: String) {
        // How do I check that I won?
        // Status label should say "Player X won!"
        let statusLabel = app.staticTexts["statusLabel"]
        
        // Test passes or fails
        XCTAssertEqual(statusLabel.label, playerString)
    }
    
    func playerXWin(elementIdentifiers: [String]) {
        launch()
        // Transforming from on array to another
        // map -> iterates through every struct/class of the array and returns a new struct/class
        //        let elements = elementIdentifiers.map { (elementInElementIdentifiers) -> XCUIElement in
        //            return app.buttons[elementInElementIdentifiers]
        //        }
        
        // $0 is the first parameter in the closure
        let elements = elementIdentifiers.map({app.buttons[$0]})
        
        play(elements: elements)
        
        compareWinCondition(playerString: "Player X won!")
    }
}
