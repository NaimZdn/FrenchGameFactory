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
    var teamChoice: [Int] = []
    var teamComposition: [Int:Characters] = [:]
    var charactersDescription = [warrior.characterDescription, magus.characterDescription, paladin.characterDescription, druid.characterDescription, rogue.characterDescription]
    var allCharactersName: [String] = [];
    
    func chooseYourCharacters() {
        print("Please choose 3 characters for the battle : ")
        for description in charactersDescription {
            print(description)
        }
    }
    
    func chooseCharacterName() -> String {
        var name = ""
        repeat {
            print("Please choose a name for your character : ")
            if let nameData = readLine() {
                name = nameData
                if allCharactersName.contains(name) {
                    print("This name \(name) is already use, please choose an another")
                    return chooseCharacterName();
                    
                } else {
                    allCharactersName.append(name)
                    print("Hmm \(name)... that's a good name !")
                    
                }
            }
        } while name == ""
        return name
    }
    
    func createYourTeam() {
        
        if teamChoice.count < 3  {
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
                if yourChoice > 5 || yourChoice <= 0 {
                    print("Error, choose a number associated at one of theese 5 characters")
                }
            } while yourChoice > 5 || yourChoice <= 0
            switch yourChoice {
            case 1:
                if teamChoice.contains(1) {
                    print("You already choose this character, please choose an another")
                    createYourTeam()
                } else {
                    print("You choose a Warrior 🛡 ");
                    charactersDescription.removeAll{$0 == warrior.characterDescription}
                    teamComposition[1] = Warrior(characterName: chooseCharacterName())
                    teamChoice.append(1)
                    createYourTeam()
                }
            case 2:
                if teamChoice.contains(2) {
                    print("You already choose this character, please choose an another")
                    createYourTeam()
                } else {
                    print("You choose a Magus 🧙‍♂️ ");
                    charactersDescription.removeAll{$0 == magus.characterDescription}
                    teamComposition[2] = Magus(characterName: chooseCharacterName())
                    print(player1Team.teamComposition)
                    teamChoice.append(2)
                    createYourTeam()
                }
            case 3:
                if teamChoice.contains(3) {
                    print("You already choose this character, please choose an another")
                    createYourTeam()
                } else {
                    print("You choose a Paladin 🏇 ");
                    charactersDescription.removeAll{$0 == paladin.characterDescription}
                    teamComposition[3] = Paladin(characterName: chooseCharacterName())
                    teamChoice.append(3)
                    createYourTeam()
                }
            case 4:
                if teamChoice.contains(4) {
                    print("You already choose this character, please choose an another")
                    createYourTeam()
                } else {
                    print("You choose a Druid 🦌 ");
                    charactersDescription.removeAll{$0 == druid.characterDescription}
                    teamComposition[4] = Druid(characterName: chooseCharacterName())
                    teamChoice.append(4)
                    createYourTeam()
                }
            case 5:
                if teamChoice.contains(5) {
                    print("You already choose this character, please choose an another")
                    createYourTeam()
                } else {
                    print("You choose a Rogue 🗡 ");
                    charactersDescription.removeAll{$0 == rogue.characterDescription}
                    teamComposition[5] = Rogue(characterName: chooseCharacterName())
                    teamChoice.append(5)
                    createYourTeam()
                }
            default:
                print(teamComposition)
            }
        } else if teamChoice.count >= 3 {
            
            print(teamChoice)
            print("You're 3 characters \(teamComposition)")
            print("fin du programme")
        }
    }
    func displayPlayersTeams() {
        print("Let's start the game, the battle is between the first player :  \(player.playerPseudo[0]) and the second player : \(player.playerPseudo[1])")
        
        for (key, value) in player1Team.teamComposition {
            print("\n\(key). A \(value.className) nammed \(value.characterName) that own a \(value.weaponName) and have \(value.characterHealth) life points.")
        }
    }
}
var team = Team()
var player1Team = Team()
var player2Team = Team()
