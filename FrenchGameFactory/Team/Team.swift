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
        if teamChoice.count < 2 {
            print("Please choose \(3 - teamChoice.count) characters for the battle : ")
            for description in charactersDescription {
                print(description)
            }
        } else if teamChoice.count == 2 {
            print("Please choose 1 character for the battle : ")
            for description in charactersDescription {
                print(description)
                
            }
        }
    }
    
    func chooseCharacterName() -> String {
        var name = ""
        repeat {
            print("Please choose a name for your character : ")
            if let nameData = readLine() {
                name = nameData
                if name.count < 1 || name.count > 10 || name.contains(" ") {
                    print("=============================================================")
                    print("Your character name must contain at minimum 1 letter and at maximum 10 letters.Spaces has'nt accept. ")
                    print("=============================================================")
                    return chooseCharacterName()
                } else if allCharactersName.contains(name) {
                    print("=============================================================")
                    print("This name \(name) is already use, please choose an another")
                    print("=============================================================")
                    return chooseCharacterName();
                    
                } else if !allCharactersName.contains(name){
                    allCharactersName.append(name)
                    let randomSentence = Int.random(in: 0..<5)
                    switch randomSentence {
                    case 0:
                        print("=============================================================")
                        print("\(name)...that's a name who inspire the fear !")
                        print("=============================================================")
                    case 1:
                        print("=============================================================")
                        print("Oh ! With this name : \(name), victory is assured !")
                        print("=============================================================")
                    case 2:
                        print("=============================================================")
                        print("Beware ! \(name) is in the arena !")
                        print("=============================================================")
                    case 3:
                        print("=============================================================")
                        print("Welcome \(name). We can't hoping a better name")
                        print("=============================================================")
                    case 4:
                        print("=============================================================")
                        print("...I can't telling one word, this name : \(name) scaring me")
                        print("=============================================================")
                    default :
                        print("=============================================================")
                        print("Hmm \(name)...that's a good name !")
                        print("=============================================================")
                    }
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
                    print("=============================================================")
                    print("You already choose this character, please choose an another")
                    print("=============================================================")
                    createYourTeam()
                    
                } else {
                    print("=============================================================")
                    print("You choose a Warrior 🛡 ");
                    print("=============================================================")
                    charactersDescription.removeAll{$0 == warrior.characterDescription}
                    teamComposition[1] = Warrior(characterName: chooseCharacterName())
                    teamChoice.append(1)
                    createYourTeam()
                }
            case 2:
                if teamChoice.contains(2) {
                    print("=============================================================")
                    print("You already choose this character, please choose an another")
                    print("=============================================================")
                    createYourTeam()
                } else {
                    print("=============================================================")
                    print("You choose a Magus 🧙‍♂️ ");
                    print("=============================================================")
                    charactersDescription.removeAll{$0 == magus.characterDescription}
                    teamComposition[2] = Magus(characterName: chooseCharacterName())
                    teamChoice.append(2)
                    createYourTeam()
                }
            case 3:
                if teamChoice.contains(3){
                    print("=============================================================")
                    print("You already choose this character, please choose an another")
                    print("=============================================================")
                    createYourTeam()
                } else {
                    print("=============================================================")
                    print("You choose a Paladin 🏇 ");
                    print("=============================================================")
                    charactersDescription.removeAll{$0 == paladin.characterDescription}
                    teamComposition[3] = Paladin(characterName: chooseCharacterName())
                    teamChoice.append(3)
                    createYourTeam()
                }
            case 4:
                if teamChoice.contains(4) {
                    print("=============================================================")
                    print("You already choose this character, please choose an another")
                    print("=============================================================")
                    createYourTeam()
                } else {
                    print("=============================================================")
                    print("You choose a Druid 🦌 ");
                    print("=============================================================")
                    charactersDescription.removeAll{$0 == druid.characterDescription}
                    teamComposition[4] = Druid(characterName: chooseCharacterName())
                    teamChoice.append(4)
                    createYourTeam()
                }
            case 5:
                if teamChoice.contains(5) {
                    print("=============================================================")
                    print("You already choose this character, please choose an another")
                    print("=============================================================")
                    createYourTeam()
                } else {
                    print("=============================================================")
                    print("You choose a Rogue 🗡 ");
                    print("=============================================================")
                    charactersDescription.removeAll{$0 == rogue.characterDescription}
                    teamComposition[5] = Rogue(characterName: chooseCharacterName())
                    teamChoice.append(5)
                    print(teamComposition)
                    createYourTeam()
                }
            default:
                print(teamComposition)
            }
        }
    }
    func displayPlayersTeams() {
        print("Let's start the game, the battle is between the first player :  \(player.playerPseudo[0]) and the second player : \(player.playerPseudo[1])")
        print("=============================================================")
        
        print("Here is \(player.playerPseudo[0]) team's")
        print("=============================================================")
        for (key, value) in player1Team.teamComposition {
            print("\n\(key). A \(value.className) nammed \(value.characterName) that own a \(value.weaponName) and have \(value.characterHealth) life points.")
            
        }
        print("=============================================================")
        print("Here is \(player.playerPseudo[1]) team's")
        print("=============================================================")

        for (key, value) in player2Team.teamComposition {
            print("\n\(key). A \(value.className) nammed \(value.characterName) that own a \(value.weaponName) and have \(value.characterHealth) life points.")
        }
    }
    
    func statsTeam1() {
        for (key, value) in player1Team.teamComposition {
            print("\n\(key). A \(value.className) nammed \(value.characterName) that own a \(value.weaponName) and have \(value.characterHealth) life points.")
        }
    }
    
    func statsTeam2() {
        for (key, value) in player2Team.teamComposition {
            print("\n\(key). A \(value.className) nammed \(value.characterName) that own a \(value.weaponName) and have \(value.characterHealth) life points.")
        }
    }
}

    
var team = Team()
var player1Team = Team()
var player2Team = Team()
