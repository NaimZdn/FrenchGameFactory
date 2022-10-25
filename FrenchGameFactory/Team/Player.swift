//
//  Player.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 25/10/2022.
//

import Foundation
class Player {
    var playerPseudo: [String] = [];
    
    func Player1Pseudo() -> String {
        var pseudo = ""
        repeat {
            print("Please choose your Pseudo : ")
            if let pseudoData = readLine() {
                pseudo = pseudoData
                if playerPseudo.contains(pseudo) {
                    print("This pseudo \(pseudo) is already use, please choose an another")
                    Player1Pseudo();
                } else {
                    playerPseudo.append(pseudo)
                    print("Welcome \(pseudo) !")
                }
            }
        } while pseudo == ""
        return ""
    }
    
    func Player2Pseudo() -> String {
        var pseudo = ""
        repeat {
            print("Please choose your Pseudo : ")
            if let pseudoData = readLine() {
                pseudo = pseudoData
                if playerPseudo.contains(pseudo) {
                    print("This pseudo \(pseudo) is already use, please choose an another")
                    Player2Pseudo();
                } else {
                    playerPseudo.append(pseudo)
                    print("Welcome \(pseudo) !")
                }
            }
        } while pseudo == ""
        return ""
    }
}
