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
    
    func chooseYourTeam() {
        print("Please choose 3 characters for the battle : "
              + "\n1.🛡 a Warrior with 10 life points. His weapon is a Sword which inflicts 1 point of damage. With his talent the warrior use his shield for protect hiself, the shield reduce 0.5 point of the opponent damages."
              + "\n2.🧙‍♂️ a Magus with 4 life points. His Power inflicts 2.5 points of damage. With his talent the magus throws his oponnent with a potion which inflicts 0.5 points of damage. "
              + "\n3.🏇 a Paladin with 6 life points. His weapon is a Spear which inflicts 2 points of damage. With his talent the paladin's horse inflicts 0.5 points of damage at the opponnent."
              + "\n4.🦌 a Druid with 6 life points. His weapon is a Stick which inflicts 1 point of damage. With his talent the druid can heal one ally."
              + "\n5.🗡 a Rogue with 4 life points. His weapons is two Daggers which inflicts 2 points of damage. With his talent the rogue use his second dagger to inflict 2 additional damage points at his opponent. " )
    }
}
