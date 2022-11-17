//
//  Team.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation

class Team {
    var teamChoose: [Int] = [] // This array permit to know which characters were selected by each players.
    var teamComposition: [Characters] = []
    var uniqueCharacterName: String
    var allCharactersName: [String] = []
    
    init(){
        self.uniqueCharacterName = ""
    }
    
    // We create a function to print all character description's.
    func listOfCharacters()  {
        // We create an instance of class's for each character.
        let warrior = Warrior(characterName: "")
        let magus = Magus(characterName: "")
        let paladin = Paladin(characterName: "")
        let druid = Druid(characterName: "")
        let rogue = Rogue(characterName: "")
        
        // We create an array, inside it we append each characters description's.
        var charactersDescriptions = [warrior.characterDescription, magus.characterDescription, paladin.characterDescription, druid.characterDescription, rogue.characterDescription]
        
        // If the player choose an character for his team, we remove the character description's inside the description array.
        if teamChoose.contains(1) {
            charactersDescriptions.removeAll{$0 == warrior.characterDescription}
        }
        if teamChoose.contains(2) {
            charactersDescriptions.removeAll{$0 == magus.characterDescription}
        }
        if teamChoose.contains(3) {
            charactersDescriptions.removeAll{$0 == paladin.characterDescription}
        }
        if teamChoose.contains(4) {
            charactersDescriptions.removeAll{$0 == druid.characterDescription}
        }
        if teamChoose.contains(5) {
            charactersDescriptions.removeAll{$0 == rogue.characterDescription}
        }
        
        if teamComposition.count < 2 { // We print the number of characters missing to complet player team's.
            print("Please choose \(3 - teamComposition.count) characters for the battle : ")
            for description in charactersDescriptions {
                print(description)
            }
            
        } else if teamComposition.count == 2 { // If the number is one we print an new message.
            print("Please choose 1 character for the battle : ")
            for description in charactersDescriptions {
                print(description)
                
            }
        }
    }
    
    // We create a function that will allow players to choose a character name's when they choose this character for there team.
    func createCharacterName(allCharacterName: [String]) -> String {
        var characterName = ""
        repeat {
            print("Please choose a name for your character : ")
            if let characterNameData = readLine() {
                characterName = characterNameData
                if characterName.count < 1 || characterName.count > 10 || characterName.contains(" ") { // We test if number of letters is less to 1 or more to 10 or if the name contain only a space, we can print the error message.
                    print("=============================================================")
                    print("Your character name must contain at minimum 1 letter and at maximum 10 letters. Spaces has'nt accept. ")
                    print("=============================================================")
                    uniqueCharacterName = ""
                    
                } else if allCharactersName.contains(characterName)  { // We test if the name is already use by an another user's, if it use, we cans print the error message.
                    print("=============================================================")
                    print("This name \(characterName) is already use, please choose an another")
                    print("=============================================================")
                    uniqueCharacterName = ""
                    
                } else {
                    allCharactersName.append(characterName) // We add the name inside an array to test the precedent condition : if the name is already use.
                    let randomNumber = Int.random(in: 0..<5) // Created an random constant with an switch to make random sentence according to the constant number's.
                    
                    let quoteArray: [String] = ["\(characterName)...that's a name who inspire the fear !", "Oh ! With this name : \(characterName), victory is assured !", "Beware ! \(characterName) is in the arena !", "Welcome \(characterName). We can't hoping a better name", "...I can't telling one word, this name : \(characterName) scaring me"]
                    
                    print("=============================================================")
                    print(quoteArray[randomNumber])
                    print("=============================================================")
                    
                    uniqueCharacterName = characterName
                }
            }
        } while uniqueCharacterName == ""
        return uniqueCharacterName
    }
    
    // We create a function to permit players to create their team.
    func createYourTeam() {
        var yourChoice = 0
        repeat {
            listOfCharacters()
            if let yourChosenData = readLine() {
                if let characterChosen = Int(yourChosenData) { // We transform String readline to Int readline for print an error message if the user haven't enter a number.
                    yourChoice = characterChosen
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
                if teamChoose.contains(yourChoice) {
                    print("=============================================================")
                    print("You already choose this character, please choose an another")
                    print("=============================================================")
                } else {
                    let characterChoose = teamCharacterSelection(numberChoice: yourChoice) // We call the function for select a character inside an array with all characters available
                    teamChoose.append(yourChoice)
                    teamComposition.append(characterChoose)
                    
                }
            }
        } while teamComposition.count != 3
    }
    
    // We create a function to permit players to select each character for their team.
    func teamCharacterSelection(numberChoice: Int) -> Characters {
        let allCharacters: [Characters] = [Warrior(characterName: ""), Magus(characterName: ""), Paladin(characterName: ""), Druid(characterName: ""), Rogue(characterName: "")]
        
        var characterSelected = 0
        
        repeat{
            if numberChoice >= 1 && numberChoice <= allCharacters.count {
                characterSelected += 1
                // We subtract 1 from the choice by restricting the choice so as not to go into the negative nor to exceed the exact count of element in the allCharacters array.
                let characterChosen = allCharacters[numberChoice - 1]
                characterChosen.characterName = createCharacterName(allCharacterName: []) // We call the function create CharacterName to permit players to select a name for their characters.
                
                return characterChosen
            } else {
                print("You pick the wrong number, choose between 1 and \(allCharacters.count)")
            }
        } while characterSelected < 3
    }
    
    // We create a function to permit players to select their character for attack or heal.
    func characterSelection() -> Characters {
        var characterSelected = 0
        repeat{
            if let yourChosenData = readLine(){
                if let characterChosen = Int(yourChosenData) {
                    if characterChosen >= 1 && characterChosen <= teamComposition.count {
                        characterSelected += 1
                        // We subtract 1 from the choice by restricting the choice so as not to go into the negative nor to exceed the exact count of element in the teamComposition array.
                        return teamComposition[characterChosen - 1]
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
    
    // We create a function to check which player won that game.
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
                    if let yourChosenData = readLine() {
                        if let optionChosen = Int(yourChosenData) {
                            startOrFinish = optionChosen
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
