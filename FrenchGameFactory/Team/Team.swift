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
    var teamComposition: [Characters] = []
    var characterName: String
    
    init(){
        self.characterName = ""
    }
   
    var allCharactersName: [String] = [];
    
    func chooseYourCharacters()  {
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
                    characterName = ""
                    
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
                        print("=============================================================")
                        print("You must enter a valid number !")
                        print("=============================================================")
                    }
                }
                if yourChoice > 5 || yourChoice <= 0 {
                    print("=============================================================")
                    print("Error, choose a number associated at one of theese 5 characters")
                    print("=============================================================")
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
                            teamComposition.append(warrior)
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
                            teamComposition.append(magus)
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
                            teamComposition.append(paladin)
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
                            teamComposition.append(druid)
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
                            teamComposition.append(rogue)
                            teamChoice.append(5)
                            
                        }
                    default:
                        print(teamComposition)
                    }
                }
            } while teamComposition.count != 3
        }
    }
    
    
  func attackTeam(attackedTeam: Characters, attackerTeam: Characters) {
        
         if attackedTeam.characterHealth > 0 {
             if attackedTeam.characterHealth <= 0 {
                 print("=============================================================")
                 print("This character is dead")
                 print("=============================================================")
             } else {
                 let randomActivation = Int.random(in: 0..<3)
                 if randomActivation == 0 {
                     if attackedTeam.className == "Warrior" {
                         print("=============================================================")
                         print("Oh ! Opponent Warrior's make a shield for reduce your attack")
                         print("=============================================================")
                         let damageReduce: Double = attackerTeam.weaponDamage - attackedTeam.talent
                         attackedTeam.characterHealth -= damageReduce
                         
                     } else if attackerTeam.className != "Druid" && attackerTeam.className != "Warrior"{
                         print("=============================================================")
                         print("Oh ! Your character active his talent")
                         print("=============================================================")
                         attackedTeam.characterHealth -= attackerTeam.weaponDamage
                         attackedTeam.characterHealth -= attackerTeam.talent
                         
                     } else if attackerTeam.className == "Druid" {
                         
                         print("=============================================================")
                         print("Oh your Druid active his talent, you can choose a character to heal : ")
                         print("=============================================================")
                         statsTeam()
                         healingTeam()
                         attackedTeam.characterHealth -= attackerTeam.weaponDamage
                         
                     }else if attackerTeam.className == "Warrior" {
                         attackedTeam.characterHealth -= attackerTeam.weaponDamage
                     }
         
                 } else {
                     attackedTeam.characterHealth -= attackerTeam.weaponDamage
                 }
                 if attackedTeam.characterHealth <= 0 {
                     print("=============================================================")
                     print("Congratulation, you kill his \(attackedTeam.className)")
                     print("=============================================================")
                 }
             }
         }
     }
    
    
    func healingTeam() {
        var healing: Int = 0
        repeat {
            if let characterToHeal = readLine() {
                if let healedCharacter = Int(characterToHeal) {
                    healing = healedCharacter
                } else {
                    print("=============================================================")
                    print("You must enter a valid number !")
                    print("=============================================================")
                    
                }
                if healing > 3 || healing <= 0 {
                    print("=============================================================")
                    print("Please enter a number associated of one of your 3 characters !")
                    print("=============================================================")
                } else {
                    switch healing {
                    case 1:
                        if !teamComposition.indices.contains(0){
                            print("=============================================================")
                            print("You can't choose this character because he isn't in your team or... maybe he's dead ?")
                            print("=============================================================")
                            
                        } else {
                            print("=============================================================")
                            print("Your \(teamComposition[0].className) gain 1 lifepoint")
                            print("=============================================================")
                            let druid = Druid(characterName: "")
                            teamComposition[0].characterHealth += druid.talent
                            healing = 1
                        }
                    case 2:
                        if !teamComposition.indices.contains(1) {
                            print("=============================================================")
                            print("You can't choose this character because he isn't in your team or... maybe he's dead ?")
                            print("=============================================================")
                        
                        } else {
                            print("=============================================================")
                            print("Your \(teamComposition[1].className) gain 1 lifepoint")
                            print("=============================================================")
                            let druid = Druid(characterName: "")
                            teamComposition[1].characterHealth += druid.talent
                            healing = 1
                        }
                    case 3:
                        if !teamComposition.indices.contains(2) {
                            print("=============================================================")
                            print("You can't choose this character because he isn't in your team or... maybe he's dead ?")
                            print("=============================================================")
                            
                        } else {
                            print("=============================================================")
                            print("Your \(teamComposition[2].className) gain 1 lifepoint")
                            print("=============================================================")
                            let druid = Druid(characterName: "")
                            teamComposition[2].characterHealth += druid.talent
                            healing = 1
                        }
                    default:
                        break
                    }
                }
            }
        } while healing != 1
    }
    
    func statsTeam() {
        var number: Int = 0
        
        for character in teamComposition {
            print("\n\(number + 1). A \(character.className) nammed \(character.characterName) that own a \(character.weaponName) and have \(character.characterHealth) life points.")
            number += 1
        }
    }
}
