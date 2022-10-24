//
//  Team.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation

// Création des joueurs

//var teamComposition: [Int: Characters]();

class Team {
    var playerPseudo: [String] = [];
    var teamChoice: [Int] = []
    var charactersDescription = [warrior.characterDescription, magus.characterDescription, paladin.characterDescription, druid.characterDescription, rogue.characterDescription]
    
    
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
        print("Please choose 3 characters for the battle : ")
        for description in charactersDescription {
            print(description)
        }
        
    }

        func createYourTeam() {
        var teamComposition: [Int:Characters] = [:]
        
        for _ in 0...2 {
            var yourChoice = 0
            repeat {
                chooseYourCharacters()
                if let choiceData = readLine() {
                    if let choiceCharacters = Int(choiceData) {
                        yourChoice = choiceCharacters
                    } else {
                        print("You must enter a valid number !")
                    }
                }
                if yourChoice > 5 && yourChoice <= 0 {
                    print("Error, choose a number associated at one of theese 5 characters")
                }
            } while yourChoice > 5 && yourChoice <= 0
            switch yourChoice {
            case 1:
                if teamChoice.contains(1) {
                    print("You already choose this character, please choose an another")
                    createYourTeam()
                } else {
                    let characterName = ChooseCharacterName.checkName.characterName()
                    print("You choose a Warrior 🛡 ");
                    charactersDescription.removeAll{$0 == warrior.characterDescription}
                    teamComposition[1] = Warrior(characterName: characterName)
                    teamChoice.append(1)
                }
            case 2:
                if teamChoice.contains(2) {
                    print("You already choose this character, please choose an another")
                    createYourTeam()
                } else {
                    print("You choose a Magus 🧙‍♂️ ");
                    teamChoice.append(2)
                }
            case 3:
                if teamChoice.contains(3) {
                    print("You already choose this character, please choose an another")
                    createYourTeam()
                } else {
                    print("You choose a Paladin 🏇 ");
                    teamChoice.append(3)
                }
            case 4:
                if teamChoice.contains(4) {
                    print("You already choose this character, please choose an another")
                    createYourTeam()
                } else {
                    print("You choose a Druid 🦌 ");
                    teamChoice.append(4)
                }
            case 5:
                if teamChoice.contains(5) {
                    print("You already choose this character, please choose an another")
                    createYourTeam()
                } else {
                    print("You choose a Rogue 🗡 ");
                    teamChoice.append(5)
                }
            default:
                print("Please choose a character for your team")
                
                
            }
           
            
        }
    }
}

var team = Team()
