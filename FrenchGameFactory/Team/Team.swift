//
//  Team.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation

// Création des joueurs

class Team {
    var teamChoice: [Int] = []
    
    var teamComposition: [Int:Characters] = [:]
    
    var characterName: String
    
    var characterDescription: [String]
    
    init(){
        self.characterName = ""
        self.characterDescription = []
    }
   
    var allCharactersName: [String] = [];
    
    
    func chooseYourCharacters() -> [String] {
        let warrior = Warrior(characterName: characterName)
        let magus = Magus(characterName: characterName)
        let paladin = Paladin(characterName: characterName)
        let druid = Druid(characterName: characterName)
        let rogue = Rogue(characterName: characterName)
        
        var descriptions = [warrior.characterDescription, magus.characterDescription, paladin.characterDescription, druid.characterDescription, rogue.characterDescription]
        
        if teamChoice.contains(1) {
            descriptions.removeAll{$0 == warrior.characterDescription}
        }
        if teamChoice.contains(2) {
            descriptions.removeAll{$0 == magus.characterDescription}
        }
        if teamChoice.contains(3) {
            descriptions.removeAll{$0 == paladin.characterDescription}
        }
        if teamChoice.contains(4) {
            descriptions.removeAll{$0 == druid.characterDescription}
        }
        if teamChoice.contains(5) {
            descriptions.removeAll{$0 == rogue.characterDescription}
        }
        
        if teamChoice.count < 2 {
            print("Please choose \(3 - teamChoice.count) characters for the battle : ")
            for description in descriptions {
                print(description)
            }
        } else if teamChoice.count == 2 {
            print("Please choose 1 character for the battle : ")
            for description in descriptions {
                print(description)
                
            }
        }
        characterDescription = descriptions
        return characterDescription
    }
    
    func chooseCharacterName(allCharacterName: [String]) -> String {
        var name = ""
        repeat {
            print("Please choose a name for your character : ")
            if let nameData = readLine() {
                name = nameData
                if name.count < 1 || name.count > 10 || name.contains(" ") {
                    print("=============================================================")
                    print("Your character name must contain at minimum 1 letter and at maximum 10 letters.Spaces has'nt accept. ")
                    print("=============================================================")
                    
                    
                } else if allCharactersName.contains(name)  {
                    print("=============================================================")
                    print("This name \(name) is already use, please choose an another")
                    print("=============================================================")
                    chooseCharacterName(allCharacterName: [name])
                    
                } else {
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
                    characterName = name
                    
                }
            }
        } while characterName == ""
        return characterName
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
                } else {
                    switch yourChoice {
                    case 1:
                        if teamChoice.contains(1) {
                            print("=============================================================")
                            print("You already choose this character, please choose an another")
                            print("=============================================================")
                            
                        } else {
                            print("=============================================================")
                            print("You choose a Warrior 🛡 ");
                            print("=============================================================")
                            let warrior = Warrior(characterName: chooseCharacterName(allCharacterName: [characterName]))
                            print(allCharactersName)
                            teamComposition[1] = warrior
                            teamChoice.append(1)
                            
                        }
                    case 2:
                        if teamChoice.contains(2) {
                            print("=============================================================")
                            print("You already choose this character, please choose an another")
                            print("=============================================================")
                            
                        } else {
                            print("=============================================================")
                            print("You choose a Magus 🧙‍♂️ ");
                            print("=============================================================")
                            let magus = Magus(characterName: chooseCharacterName(allCharacterName: [characterName]))
                            print(allCharactersName)
                            teamComposition[2] = magus
                            teamChoice.append(2)
                           
                        }
                    case 3:
                        if teamChoice.contains(3){
                            print("=============================================================")
                            print("You already choose this character, please choose an another")
                            print("=============================================================")
                        
                        } else {
                            print("=============================================================")
                            print("You choose a Paladin 🏇");
                            print("=============================================================")
                            let paladin = Paladin(characterName: chooseCharacterName(allCharacterName: []))
                            teamComposition[3] = paladin
                            teamChoice.append(3)
                            
                        }
                    case 4:
                        if teamChoice.contains(4) {
                            print("=============================================================")
                            print("You already choose this character, please choose an another")
                            print("=============================================================")
                            
                        } else {
                            print("=============================================================")
                            print("You choose a Druid 🦌 ");
                            print("=============================================================")
                            let druid = Druid(characterName: chooseCharacterName(allCharacterName: []))
                            teamComposition[4] = druid
                            teamChoice.append(4)
                        
                        }
                    case 5:
                        if teamChoice.contains(5) {
                            print("=============================================================")
                            print("You already choose this character, please choose an another")
                            print("=============================================================")
                            
                        } else {
                            print("=============================================================")
                            print("You choose a Rogue 🗡 ");
                            print("=============================================================")
                            let rogue = Rogue(characterName: chooseCharacterName(allCharacterName: []))

                            teamComposition[5] = rogue
                            teamChoice.append(5)
                            
                        }
                    default:
                        print(teamComposition)
                    }
                }

            } while teamComposition.count != 3
                
        }
            
    }
     
    
    /*func statsTeam1() {
        for (key, value) in player1Team.teamComposition {
            print("\n\(key). A \(value.className) nammed \(value.characterName) that own a \(value.weaponName) and have \(value.characterHealth) life points.")
        }
    }
    
    func statsTeam2() {
        for (key, value) in player2Team.teamComposition {
            print("\n\(key). A \(value.className) nammed \(value.characterName) that own a \(value.weaponName) and have \(value.characterHealth) life points.")
        }
    }*/
}

    
var team = Team()
var player2Team = Team()
