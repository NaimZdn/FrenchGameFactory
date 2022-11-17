//
//  Team.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation

class Team {
    var teamChoice: [Int] = []
    var teamComposition: [Characters] = []
    var characterName: String
    var teamChoiceNumber: Int
    
    init(){
        self.characterName = ""
        self.teamChoiceNumber = 0
    }
    
    var allCharactersName: [String] = [];
    
    // We create a function to print all character description's.
    func chooseYourCharacters()  {
        // We create an instance of class's for each character.
        let warrior = Warrior(characterName: "")
        let magus = Magus(characterName: "")
        let paladin = Paladin(characterName: "")
        let druid = Druid(characterName: "")
        let rogue = Rogue(characterName: "")
        
        // We create an array, inside it we append each characters description's.
        var descriptions = [warrior.characterDescription, magus.characterDescription, paladin.characterDescription, druid.characterDescription, rogue.characterDescription]
        
        // If the player choose an character for his team, we remove the character description's inside the description array.
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
        
        if teamComposition.count < 2 { // We print the number of characters missing to complet player team's.
            print("Please choose \(3 - teamComposition.count) characters for the battle : ")
            for description in descriptions {
                print(description)
            }
            
        } else if teamComposition.count == 2 { // If the number is one we print an new message.
            print("Please choose 1 character for the battle : ")
            for description in descriptions {
                print(description)
                
            }
        }
    }
    
    // We create a function that will allow players to choose a character name's when they choose this character for there team.
    func chooseCharacterName(allCharacterName: [String]) -> String {
        var name = ""
        repeat {
            print("Please choose a name for your character : ")
            if let nameData = readLine() {
                name = nameData
                if name.count < 1 || name.count > 10 || name.contains(" ") { // We test if number of letters is less to 1 or more to 10 or if the name contain only a space, we can print the error message.
                    print("=============================================================")
                    print("Your character name must contain at minimum 1 letter and at maximum 10 letters. Spaces has'nt accept. ")
                    print("=============================================================")
                    characterName = ""
                    
                } else if allCharactersName.contains(name)  { // We test if the name is already use by an another user's, if it use, we cans print the error message.
                    print("=============================================================")
                    print("This name \(name) is already use, please choose an another")
                    print("=============================================================")
                    characterName = ""
                    
                } else {
                    allCharactersName.append(name) // We add the name inside an array to test the precedent condition : if the name is already use.
                    let randomNumber = Int.random(in: 0..<5) // Created an random constant with an switch to make random sentence according to the constant number's.
                    
                    let quoteArray: [String] = ["\(name)...that's a name who inspire the fear !", "Oh ! With this name : \(name), victory is assured !", "Beware ! \(name) is in the arena !", "Welcome \(name). We can't hoping a better name", "...I can't telling one word, this name : \(name) scaring me"]
                    
                    print("=============================================================")
                    print(quoteArray[randomNumber])
                    print("=============================================================")
        
                    characterName = name
                }
            }
        } while characterName == ""
        return characterName
    }
    
    func createYourTeam() {
        var yourChoice = 0
        repeat {
            chooseYourCharacters()
            if let choiceData = readLine() {
                if let choiceCharacters = Int(choiceData) { // We transform String readline to Int readline for print an error message if the user haven't enter a number.
                    yourChoice = choiceCharacters
                } else {
                    print("=============================================================")
                    print("You must enter a valid number !")
                    print("=============================================================")
                }
            }
            if yourChoice > 5 || yourChoice <= 0 { // If the enter number is more than 5 or less or equal than 0 we can print an error message.
                print("=============================================================")
                print("Error, choose a number associated at one of theese 5 characters")
                print("=============================================================")
            } else {
                if teamChoice.contains(yourChoice) {
                    print("=============================================================")
                    print("You already choose this character, please choose an another")
                    print("=============================================================")
                }else {
                    let characterChoose = createCharacter(numberChoice: yourChoice)
                    teamChoice.append(yourChoice)
                    teamComposition.append(characterChoose)
                    
                }
            }
        } while teamComposition.count != 3
    }
    
    func createCharacter(numberChoice: Int) -> Characters {
        let charactersArray: [Characters] = [Warrior(characterName: ""), Magus(characterName: ""), Paladin(characterName: ""), Druid(characterName: ""), Rogue(characterName: "")]
        
        var characterSelected = 0
        
        repeat{
            if numberChoice >= 1 && numberChoice <= charactersArray.count {
                characterSelected += 1
                //subtract 1 from the choice by restricting the choice so as not to go into the negative nor to exceed the exact count of element in the characterAlive array.
                let characterChoose = charactersArray[numberChoice - 1]
                characterChoose.characterName = chooseCharacterName(allCharacterName: [])

                return characterChoose
            } else {
                print("You pick the wrong number, choose between 1 and \(charactersArray.count)")
            }
        } while characterSelected < 3
    }

    func characterSelection() -> Characters {
        var characterSelected = 0
        repeat{
           if let choice = readLine(){
                if let numberChoice = Int(choice) {
                    if numberChoice >= 1 && numberChoice <= teamComposition.count {
                        characterSelected += 1
                        //subtract 1 from the choice by restricting the choice so as not to go into the negative nor to exceed the exact count of element in the characterAlive array.
                        return teamComposition[numberChoice - 1]
                    } else {
                        print("=============================================================")
                        print("You pick the wrong number, choose between 1 and \(teamComposition.count)")
                        print("=============================================================")
                    }
                } else { // If the character enter isn't a number we can print an error message.
                    print("=============================================================")
                    print("You must enter a valid number !")
                    print("=============================================================")
                }
            }
        } while characterSelected < 1
    }

    // We create a statsTeam function to display the character team stat's to the start of the battle and in each turn.
    func statsTeam() {
        var number: Int = 0
        
        for character in teamComposition {
            print("\n\(number + 1). A \(character.className) nammed \(character.characterName) that own a \(character.weaponName) and have \(character.characterHealth) life points.")
            number += 1
        }
    }
    
    func checkWinnerTeam(player: Player) {
        var gameEnding: Int = 0
        if teamComposition.isEmpty { // If the team is empty we display the winner's pseudo.
            print("*****************The Winner is \(player.pseudo)*****************")
            print("=============================== GAME OVER ===============================")
            gameEnding = 1
            
            repeat {
                if gameEnding == 1 {
                    var startOrFinish: Int = 0
                    teamComposition.removeAll() // We remove all teamComposition to finish the game or start an another.
                    print("If you want play an other game please enter : 1")
                    print("If you want quit this game game please enter : 2")
                    if let optionChoice = readLine() {
                        if let choice = Int(optionChoice) {
                            startOrFinish = choice
                        } else {
                            print("=============================================================")
                            print("You must enter a valid number !")
                            print("=============================================================")
                        }
                        if startOrFinish > 2 || startOrFinish <= 0 {
                            print("=============================================================")
                            print("Error, choose a number associated at one of theese 2 options")
                            print("=============================================================")
                        }
                        if startOrFinish == 1 {
                            print("Let's start a new game !")
                            game.playTheGame()
                        } else if startOrFinish == 2{
                            print("I hope you enjoyed this game. See you soon !")
                        }
                    }
                }
            } while gameEnding != 1
        }
    }
}
