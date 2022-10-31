//
//  main.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation

game.startingMenu()
while true {
    game.turn += 1
    print("============================ TURN \(game.turn) ============================")
    game.fightingTeam1()
    game.fightingTeam2()
}
