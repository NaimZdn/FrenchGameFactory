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
          
            if let pseudoData:String = readLine() {
                pseudo = pseudoData
                if pseudo.count > 10 || pseudo.count < 1 || pseudo.contains(" "){
                    print("------------------------------------------------------")
                    print("Your pseudo must contain at minimum 1 letter and at maximum 10 letters.Spaces has'nt accept. ")
                    print("------------------------------------------------------")
                    return player1Pseudo();
                } else if playerPseudo.contains(pseudo) {
                    print("------------------------------------------------------")
                    print("This pseudo \(pseudo) is already use, please choose an another")
                    print("------------------------------------------------------")
                    return player1Pseudo();
                } else if !playerPseudo.contains(pseudo){
                    playerPseudo.append(pseudo)
                    print("------------------------------------------------------")
                    print("Welcome \(pseudo) !")
                    print("------------------------------------------------------")
                }

            }
        } while pseudo == ""
        return pseudo
    }
    
    func player2Pseudo() -> String {
        var pseudo = ""
        repeat {
            print("Hello Player 2 ! \n Please choose your Pseudo : ")
            if let pseudoData = readLine() {
                pseudo = pseudoData
                if pseudo.count > 10 || pseudo.count < 1 || pseudo.contains(" "){
                    print("Your pseudo must contain at minimum 1 letter and at maximum 10 letters. Spaces has'nt accept. ")
                    print("------------------------------------------------------")
                    return player1Pseudo();
                } else if playerPseudo.contains(pseudo) {
                    print("This pseudo \(pseudo) is already use, please choose an another")
                    print("------------------------------------------------------")
                    return player2Pseudo();
                } else {
                    playerPseudo.append(pseudo)
                    print("Welcome \(pseudo) !")
                    print("------------------------------------------------------")
                }
            }
        } while pseudo == ""
        return pseudo
    }
}

var player = Player()
