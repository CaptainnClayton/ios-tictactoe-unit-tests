//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Clayton Watkins on 7/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {

    // Goal: Make sure the board is empty right after it's initalized
    func testCreatingEmptyBoard() {
        let board = GameBoard()
        
        for x in 0..<3 {
            for y in 0..<3{
                // 0, 0
                // 0, 1
                // 0, 2
                // 1, 0
                let square = board[(x, y)]
                // We assume the square is nil, because it has no X or O mark
                XCTAssertNil(square)
            }
        }
    }
    
    func testPlacingMarks() {
        
        var board = GameBoard()
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (0, 0)))
        XCTAssertEqual(board[(0, 0)], .x)
        
        for x in 0...2{
            for y in 0...2 {
                if x == 0 && y == 0{
                    XCTAssert(board[(x, y)] == .x)
                    continue
                }
                XCTAssert(board[(x, y)] == nil)
            }
        }
        
        // Make sure we can't change the mark on a sqaure with an existing mark
        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0)))
    }
    
}
