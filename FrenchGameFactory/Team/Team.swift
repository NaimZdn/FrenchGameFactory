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
    
    func chooseYourCharacters() {
        print("Please choose 3 characters for the battle : "
              + "\n1.🛡 a Warrior with 10 life points. His weapon is a Sword which inflicts 1 point of damage. With his talent the warrior use his shield for protect hiself, the shield reduce 0.5 point of the opponent damages."
              + "\n2.🧙‍♂️ a Magus with 4 life points. His Power inflicts 2.5 points of damage. With his talent the magus throws his oponnent with a potion which inflicts 0.5 points of damage. "
              + "\n3.🏇 a Paladin with 6 life points. His weapon is a Spear which inflicts 2 points of damage. With his talent the paladin's horse inflicts 0.5 points of damage at the opponnent."
              + "\n4.🦌 a Druid with 6 life points. His weapon is a Stick which inflicts 1 point of damage. With his talent the druid can heal one ally."
              + "\n5.🗡 a Rogue with 4 life points. His weapons is two Daggers which inflicts 2 points of damage. With his talent the rogue use his second dagger to inflict 2 additional damage points at his opponent. " )
    }
    
    func createYourTeam() {
        
        for _ in 0...2 {
            var yourChoice = 0
            repeat {
                chooseYourCharacters()
                if let choiceData = readLine() {
                    if let choiceCharacters = Int(choiceData) {
                        yourChoice = choiceCharacters
                    }
                }
                if yourChoice != 1 && yourChoice != 2 && yourChoice != 3 && yourChoice != 4 && yourChoice != 5 {
                    print("Error, choose a number associated at one of theese 5 characters")
                }
            } while yourChoice != 1 && yourChoice != 2 && yourChoice != 3 && yourChoice != 4 && yourChoice != 5
            
        }
    }
}

var team = Team()
