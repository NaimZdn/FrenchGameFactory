//
//  Team.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation

// Création des joueurs
var playerPseudo: [String] = []
class Team {
    func Player1Pseudo() -> String {
        var pseudo = ""
        repeat {
            print("Please choose your Pseudo : ")
            if let pseudoData = readLine() {
                pseudo = pseudoData
                if playerPseudo.contains(pseudo) {
                    print("This pseudo \(pseudo) is already use, please choose an another")
                } else {
                    Player1Pseudo();
                    playerPseudo.append(pseudo)
                    print("Welcome \(pseudo) !")
                }
            }
        } while pseudo == ""
        return pseudo
    }
    
    func Player2Pseudo() -> String {
        var pseudo = ""
        repeat {
            print("Please choose your Pseudo : ")
            if let pseudoData = readLine() {
                pseudo = pseudoData
                if playerPseudo.contains(pseudo) {
                    print("This pseudo \(pseudo) is already use, please choose an another")
                } else {
                    Player2Pseudo();
                    playerPseudo.append(pseudo)
                    print("Welcome \(pseudo) !")
                }
            }
        } while pseudo == ""
        return pseudo
    }
}
