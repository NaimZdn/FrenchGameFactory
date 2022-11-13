//
//  Player.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 25/10/2022.
//

import Foundation
class Player {
    
    var player: String
    var pseudo: String
    
    init(player: String) {
        self.player = player
        self.pseudo = ""
    }
    
    func choosePlayerPseudo(allPlayerPseudo: [String]) -> String {
        var playerPseudo = ""
        repeat {
            print("Hello \(player) ! \n Please choose your Pseudo : ")
            
            if let pseudoData = readLine() {
                playerPseudo = pseudoData
                if playerPseudo.count > 10 || playerPseudo.count < 1 || playerPseudo.contains(" "){
                    print("=============================================================")
                    print("Your pseudo must contain at minimum 1 letter and at maximum 10 letters.Spaces has'nt accept. ")
                    print("=============================================================")
                    
                } else if allPlayerPseudo.contains(playerPseudo) {
                    print("=============================================================")
                    print("This pseudo \(playerPseudo) is already use, please choose an another")
                    print("=============================================================")
                    
                } else {
                    print("=============================================================")
                    print("Welcome \(playerPseudo) !")
                    print("=============================================================")
                    pseudo = playerPseudo
                
                }
            }
        } while pseudo == ""
        return pseudo
    }
}


