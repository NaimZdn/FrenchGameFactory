//
//  Player.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 25/10/2022.
//

import Foundation
class Player {
    var playerPseudo: [String] = [];
    
    func player1Pseudo() -> String {
        var pseudo = ""
        repeat {
            print("Hello Player 1 ! \n Please choose your Pseudo : ")
            if let pseudoData = readLine() {
                pseudo = pseudoData
                if playerPseudo.contains(pseudo) {
                    print("This pseudo \(pseudo) is already use, please choose an another")
                    player1Pseudo();
                } else {
                    playerPseudo.append(pseudo)
                    print("Welcome \(pseudo) !")
                }
            }
        } while pseudo == ""
        return ""
    }
    
    func player2Pseudo() -> String {
        var pseudo = ""
        repeat {
            print("Hello Player 2 ! \n Please choose your Pseudo : ")
            if let pseudoData = readLine() {
                pseudo = pseudoData
                if playerPseudo.contains(pseudo) {
                    print("This pseudo \(pseudo) is already use, please choose an another")
                    player2Pseudo();
                } else {
                    playerPseudo.append(pseudo)
                    print("Welcome \(pseudo) !")
                }
            }
        } while pseudo == ""
        return ""
    }
}

var player = Player()
