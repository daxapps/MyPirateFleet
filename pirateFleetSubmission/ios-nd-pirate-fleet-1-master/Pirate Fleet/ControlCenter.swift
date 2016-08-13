  //
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        
        let smallShip = Ship(length: 2, location: GridLocation(x:0, y:2), isVertical: false)
        let mediumShip1 = Ship(length: 3, location: GridLocation(x:0, y:0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x:0, y:4) , isVertical: false)
        let largeShip = Ship(length: 4, location: GridLocation(x:0, y:6), isVertical: false)
        let extraLargeShip = Ship(length: 5, location: GridLocation(x:0, y:7), isVertical: false)
        
        human.addShipToGrid(smallShip)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(largeShip)
        human.addShipToGrid(extraLargeShip)
        
        let bomb1 = Mine(location: GridLocation(x:3, y:4), explosionText: "Boom! goes bomb #1")
        let bomb2 = Mine(location: GridLocation(x:5, y:5), explosionText: "Boom! goes bomb #2")
        
        human.addMineToGrid(bomb1)
        human.addMineToGrid(bomb2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        let enemyShipsSunk: Int = 5 - gameStats.enemyShipsRemaining
        let humanShipsRemaining: Int = 5 - gameStats.humanShipsSunk
        let numberOfGuesses: Int = gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman

        
        print("Enemy Ships Sunk \(enemyShipsSunk)")
        print("Human Ships Remaining \(humanShipsRemaining)")
        print("Number of Guesses \(numberOfGuesses)")
        
        
        finalScore = (enemyShipsSunk * gameStats.sinkBonus) + (humanShipsRemaining * gameStats.shipBonus) - (numberOfGuesses * gameStats.guessPenalty)
        
        return finalScore
        
        
    }
}

















