//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    // Check verticals for wins
    
    // check each column for all three marks being the same player as the parameter to the function
    for x in 0...2{
        var markCount = 0
        for y in 0...2{
            if board[(x, y)] == player {
                // They marked the board at this given location
                markCount += 1
            }
        }
        
        if markCount == 3{
            // They won
            return true
        }
    }
    
    // Check horizontals for wins
    
    for y in 0...2{
        var markCount = 0
        for x in 0...2{
            if board[(x, y)] == player {
                // They marked the board at this given location
                markCount += 1
            }
        }
        
        if markCount == 3{
            // They won
            return true
        }
    }
    
    // Check diagnals for wins
    // 0,0  1,1  2,2
    // 2,0  1,1  0,2
    
    let leftToRight: [Coordinate] = [(0, 0), (1, 1), (2, 2)]
    
    var ltrMarkCount = 0
    
    for coordinate in leftToRight{
        if board[coordinate] == player{
            ltrMarkCount += 1
        }
    }
    
    if ltrMarkCount == 3{
        return true
    }
    
    let rightToLeft: [Coordinate] = [(0, 0), (1, 1), (2, 2)]
    
    var rtlMarkCount = 0
    
    for coordinate in rightToLeft{
        if board[coordinate] == player{
            rtlMarkCount += 1
        }
    }
    
    if rtlMarkCount == 3{
        return true
    }
    
    
    
    return false
}
