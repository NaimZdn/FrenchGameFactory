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
    
    init(){
        self.characterName = ""
    }
    
    var allCharactersName: [String] = [];
    
    // We create a function to print all character description's.
    func chooseYourCharacters()  {
        // We create an instance of class's for each character.
        let warrior = Warrior(characterName: characterName)
        let magus = Magus(characterName: characterName)
        let paladin = Paladin(characterName: characterName)
        let druid = Druid(characterName: characterName)
        let rogue = Rogue(characterName: characterName)
        
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
        
        if teamChoice.count < 2 { // We print the number of characters missing to complet player team's.
            print("Please choose \(3 - teamChoice.count) characters for the battle : ")
            for description in descriptions {
                print(description)
            }
            
        } else if teamChoice.count == 2 { // If the number is one we print an new message.
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
                    
                    
                } else if allCharactersName.contains(name)  { // We test if the name is already use by an another user's, if it use, we cans print the error message.
                    print("=============================================================")
                    print("This name \(name) is already use, please choose an another")
                    print("=============================================================")
                    characterName = ""
                    
                } else {
                    allCharactersName.append(name) // We add the name inside an array to test the precedent condition : if the name is already use.
                    let randomSentence = Int.random(in: 0..<5) // Created an random constant with an switch to make random sentence according to the constant number's.
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
                    switch yourChoice { // We create 5 case inside the switch, corresponding to the five characters game's
                    case 1:
                        if teamChoice.contains(1) { // We test if this character is already inside user team's, if it use, we can print the error message.
                            print("=============================================================")
                            print("You already choose this character, please choose an another")
                            print("=============================================================")
                            
                        } else {
                            let warrior = Warrior(characterName: chooseCharacterName(allCharacterName: [])) // We create an instance of warrior class's to append warrior inside the team composition array's. During the instanciation we call the function which allows the player to choose a name for his character.
                            print("=============================================================")
                            print("You choose a \(warrior.className)")
                            print("=============================================================")
                            teamComposition.append(warrior)
                            teamChoice.append(1)
                            
                        }
                    case 2:
                        if teamChoice.contains(2) {
                            print("=============================================================")
                            print("You already choose this character, please choose an another")
                            print("=============================================================")
                            
                        } else {
                            let magus = Magus(characterName: chooseCharacterName(allCharacterName: []))
                            print("=============================================================")
                            print("You choose a \(magus.className)")
                            print("=============================================================")
                            teamComposition.append(magus)
                            teamChoice.append(2)
                            
                        }
                    case 3:
                        if teamChoice.contains(3){
                            print("=============================================================")
                            print("You already choose this character, please choose an another")
                            print("=============================================================")
                            
                        } else {
                            let paladin = Paladin(characterName: chooseCharacterName(allCharacterName: []))
                            print("=============================================================")
                            print("You choose a \(paladin.className)")
                            print("=============================================================")
                            teamComposition.append(paladin)
                            teamChoice.append(3)
                            
                        }
                    case 4:
                        if teamChoice.contains(4) {
                            print("=============================================================")
                            print("You already choose this character, please choose an another")
                            print("=============================================================")
                            
                        } else {
                            let druid = Druid(characterName: chooseCharacterName(allCharacterName: []))
                            print("=============================================================")
                            print("You choose a \(druid.className)")
                            print("=============================================================")
                            teamComposition.append(druid)
                            teamChoice.append(4)
                            
                        }
                    case 5:
                        if teamChoice.contains(5) {
                            print("=============================================================")
                            print("You already choose this character, please choose an another")
                            print("=============================================================")
                            
                        } else {
                            let rogue = Rogue(characterName: chooseCharacterName(allCharacterName: []))
                            print("=============================================================")
                            print("You choose a \(rogue.className)")
                            print("=============================================================")
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
    
    // We create a function to make the attacks during the fight.
    func attackTeam(characterAttacked: Characters, characterAttacker: Characters) {
        
        if characterAttacked.characterHealth <= 0 { // If the attacked character lifepoint is less than 0, we print an error message because he is dead.
            print("=============================================================")
            print("This character is dead")
            print("=============================================================")
        } else {
            let randomActivation = Int.random(in: 0..<3) //We set a percentage so that the character has a 33% chance to activate his talent.
            if randomActivation == 0 {
                if characterAttacked.className == "Warrior 🛡" { // If the character attacked is a Warrior his talent is reducing damage to 0.5 point.
                    print("=============================================================")
                    print("Oh ! Opponent Warrior's 🛡 make a shield for reduce your attack")
                    print("=============================================================")
                    let damageReduce: Double = characterAttacker.weaponDamage - characterAttacked.talent
                    characterAttacked.characterHealth -= damageReduce
                    characterAttacked.characterHealth -= characterAttacker.weaponDamage
                    
                } else if characterAttacker.className == "Druid 🦌" { //  If the character attacker is a Druid his talent healed a team character's choosing by the player with healingteam function.
                    print("=============================================================")
                    print("Oh your \(characterAttacker.className) active his talent, you can choose a character to heal : ")
                    print("=============================================================")
                    statsTeam()
                    healingTeam()
                    characterAttacked.characterHealth -= characterAttacker.weaponDamage
                    
                } else if characterAttacker.className != "Druid 🦌" && characterAttacker.className != "Warrior 🛡"{ // Talent activation for the other character.
                    print("=============================================================")
                    print("Oh ! Your \(characterAttacker.className) active his talent")
                    print("=============================================================")
                    characterAttacked.characterHealth -= characterAttacker.weaponDamage
                    characterAttacked.characterHealth -= characterAttacker.talent
                    
                }
                
            } else { // If the talent isn't activate.
                characterAttacked.characterHealth -= characterAttacker.weaponDamage
            }
            if characterAttacked.characterHealth <= 0 { // If there lifepoints of the character attacked is reduce to 0, we can print this following message.
                print("=============================================================")
                print("Congratulation, you kill his \(characterAttacked.className)")
                print("=============================================================")
            }
        }
    }
    
    // We create a function for druid talent's.
    func healingTeam() {
        var healing: Int = 0
        repeat {
            if let characterToHeal = readLine() {
                if let healedCharacter = Int(characterToHeal) { // We transform the readline to Int readline for control if the character enter is a number.
                    healing = healedCharacter
                } else { // If the character enter isn't a number we can print an error message.
                    print("=============================================================")
                    print("You must enter a valid number !")
                    print("=============================================================")
                    
                }
                if healing > 3 || healing <= 0 { // If the character enter is more than 3 or less or equal than 0 we can print an error message.
                    print("=============================================================")
                    print("Please enter a number associated of one of your 3 characters !")
                    print("=============================================================")
                } else {
                    switch healing {
                    case 1:
                        if !teamComposition.indices.contains(0){ // If teamComposition not contain the character we can print an error message.
                            print("=============================================================")
                            print("You can't choose this character because he isn't in your team or... maybe he's dead ?")
                            print("=============================================================")
                            
                        } else { // Else we create an instance of druid class to heal the character choosen.
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
    
    // We create a statsTeam function to display the character team stat's to the start of the battle and in each turn.
    func statsTeam() {
        var number: Int = 0
        
        for character in teamComposition {
            print("\n\(number + 1). A \(character.className) nammed \(character.characterName) that own a \(character.weaponName) and have \(character.characterHealth) life points.")
            number += 1
        }
    }
}
