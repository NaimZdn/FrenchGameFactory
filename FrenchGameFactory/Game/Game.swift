//
//  Game.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 25/10/2022.
//

import Foundation
class Game {
    
    var player1 = Player(player: "Player 1")
    var player2 = Player(player: "Player 2")
    var player1Team = Team()
    var player2Team = Team()
    var team = Team()
    
    var character = Magus(characterName: "")
    
    var attacker: Characters
    var attacked: Characters
    
    var isPlayerOneTurn:Bool = true
    var playerTurn: Player?
    var notPlayerTurn: Player?
    
    init() {
        self.attacker = character
        self.attacked = character
        
    }
    
    // We create a starting Menu function to execute the game.
    func startingMenu() {
        print("Hello and welcome on the FrenchFactory company's game specially create for you.\n Let me tell you there rules : 📜 \n "
              + "\n1. You must form a team of 3 characters. You can't have 2 same characters in your Team. \n"
              + "\n2. Each character has a talent with 33% chance's activation. \n"
              + "\n3. You fight between fighters. The winner is the one who killed the opposing team's fighters. \n"
              + "\n4. The last rule and the more important, enjoy the game 😁. \n")
        print("=============================================================")
        let pseudo1 = player1.choosePlayerPseudo(allPlayerPseudo: [])
        player1Team.createYourTeam()
        _ = player2.choosePlayerPseudo(allPlayerPseudo: [pseudo1])
        player2Team.createYourTeam()
        displayPlayersTeams()
        
        var turn: Int = 1
        
        repeat {
            print("============================ TURN \(turn) =========================")
            fight()
            turn += 1
            
        } while !player1Team.teamComposition.isEmpty && !player2Team.teamComposition.isEmpty
        checkWinnerTeam()
    }
    
    // We created a function to display each player team's after the creation of teams.
    func displayPlayersTeams() {
        
        print("Let's start the game, the battle is between the first player :  \(player1.pseudo) and the second player : \(player2.pseudo)")
        print("=============================================================")
        
        print("Here is \(player1.pseudo) team's")
        print("=============================================================")
        player1Team.statsTeam()
        
        print("=============================================================")
        print("Here is \(player2.pseudo) team's")
        print("=============================================================")
        player2Team.statsTeam()
    }
    
    // We create a fight function.
    func fight() {
        // We create some variables. There values changes during each player turn thanks to a boolean to control who player turn's.
        var pseudo1: String
        var team1:Team
        
        var team2:Team
        
        var attackerChoice: Int = 0
        var attackedChoice: Int = 0
        
        if isPlayerOneTurn  {
            pseudo1 = player1.pseudo
            team1 = player1Team
            
            team2 = player2Team
            
            isPlayerOneTurn = false
            
        } else {
            pseudo1 = player2.pseudo
            team1 = player2Team
            
            team2 = player1Team
            
            isPlayerOneTurn = true
            
        }
        
        print("=============================================================")
        print("It's your turn \(pseudo1). Please choose your attacker")
        team1.statsTeam()
        print("=============================================================")
        print("Choose a number associated with one of your team's characters")
        print("=============================================================")
        
        repeat {
            if let playerAttacker = readLine() {
                if let characterAttacker = Int(playerAttacker){ // 
                    attackerChoice = characterAttacker
                } else {
                    print("=============================================================")
                    print("You must enter a valid number !")
                    print("=============================================================")
                }
                if attackerChoice > 3 || attackerChoice <= 0 {
                    print("=============================================================")
                    print("Please enter a number associated of one of your 3 characters !")
                    print("=============================================================")
                } else {
                    switch attackerChoice {
                        
                    case 1:
                        if !team1.teamComposition.indices.contains(0) {
                            print("=============================================================")
                            print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                            print("=============================================================")
                            team1.statsTeam()
                            print("Please, choose a number associated with one of your team's characters")
                            
                        } else {
                            attacker = team1.teamComposition[0]
                            print("=============================================================")
                            print("You choose your \(team1.teamComposition[0].characterName)")
                            print("=============================================================")
                            attackerChoice = 1
                            
                        }
                    case 2:
                        if !team1.teamComposition.indices.contains(1) {
                            print("=============================================================")
                            print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                            print("=============================================================")
                            team1.statsTeam()
                            print("Please, choose a number associated with one of your team's characters")
                            
                        } else {
                            attacker = team1.teamComposition[1]
                            print("=============================================================")
                            print("You choose your \(team1.teamComposition[1].characterName)")
                            print("=============================================================")
                            attackerChoice = 1
                        }
                        
                    case 3:
                        if !team1.teamComposition.indices.contains(2) {
                            print("=============================================================")
                            print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                            print("=============================================================")
                            team1.statsTeam()
                            print("Please, choose a number associated with one of your team's characters")
                            
                        } else {
                            attacker = team1.teamComposition[2]
                            print("=============================================================")
                            print("You choose your \(team1.teamComposition[2].characterName)")
                            print("=============================================================")
                            attackerChoice = 1
                            
                        }
                    default :
                        break
                    }
                }
            }
        } while attackerChoice != 1
        attackerChoice = 0
        
        print("Which opponent character's would you like to attack ? ")
        team2.statsTeam()
        print("=============================================================")
        print("Choose a number associate with one of your opponent team's")
        
        repeat {
            if let playerAttacked = readLine() {
                if let characterAttacked = Int(playerAttacked) { // We transform String readline to Int readline for print an error message if the user haven't enter a number.
                    attackedChoice = characterAttacked
                    
                } else {
                    print("=============================================================")
                    print("You must enter a valid number !")
                    print("=============================================================")
                }
                if attackedChoice > 3 || attackedChoice <= 0 { // If number enter is more than 3 or less or equal than 0 we display an error message.
                    print("=============================================================")
                    print("Please enter a number associated of one of your 3 characters !")
                    print("=============================================================")
                } else {
                    switch attackedChoice { // We create a switch whiwh will allow players to choice his attacked character.
                    case 1:
                        if !team2.teamComposition.indices.contains(0) { // If teamComposition not contain the character we display an error message.
                            print("=============================================================")
                            print("Your opponent hasn't got this character or... maybe he is dead ?")
                            print("=============================================================")
                            
                        } else {
                            attacked = team2.teamComposition[0] // attacked is equal at teamComposition case index's.
                            print("=============================================================")
                            print("You choose your opponent \(team2.teamComposition[0].className) !")
                            print("=============================================================")
                            team1.attackTeam(characterAttacked: attacked, characterAttacker: attacker) // We call the attackTeam function to make the fight.
                            if attacked.characterHealth <= 0 { // If attacked character health is less or equal than 0 we removed the character to teamComposition array's.
                                team2.teamComposition.remove(at: 0)
                            }
                            attackedChoice = 1
                            
                        }
                    case 2:
                        if !team2.teamComposition.indices.contains(1) {
                            print("=============================================================")
                            print("Your opponent hasn't got this character or... maybe he is dead ?")
                            print("=============================================================")
                            
                        } else {
                            attacked = team2.teamComposition[1]
                            print("=============================================================")
                            print("You choose your opponent \(team2.teamComposition[1].className) !")
                            print("=============================================================")
                            team1.attackTeam(characterAttacked: attacked, characterAttacker: attacker)
                            if attacked.characterHealth <= 0 {
                                team2.teamComposition.remove(at: 1)
                            }
                            attackedChoice = 1
                            
                        }
                    case 3:
                        if !team2.teamComposition.indices.contains(2) {
                            print("=============================================================")
                            print("Your opponent hasn't got this character or... maybe he is dead ?")
                            print("=============================================================")
                            
                        } else {
                            attacked = team2.teamComposition[2]
                            print("=============================================================")
                            print("You choose your opponent \(team2.teamComposition[2].className) !")
                            print("=============================================================")
                            team1.attackTeam(characterAttacked: attacked, characterAttacker: attacker)
                            if attacked.characterHealth <= 0 {
                                team2.teamComposition.remove(at: 2)
                            }
                            attackedChoice = 1
                        }
                    default:
                        break
                    }
                }
            }
        } while attackedChoice != 1
        attackedChoice = 0
    }
    
    // We created a function to ckeck the winner
    func checkWinnerTeam() {
        var gameEnding: Int = 0
        if player1Team.teamComposition.isEmpty { // If the team is empty we display the winner's pseudo.
            print("*****************The Winner is \(player2.pseudo)*****************")
            print("=============================== GAME OVER ===============================")
            gameEnding = 1
        }
        else if player2Team.teamComposition.isEmpty {
            print("*****************The Winner is \(player1.pseudo)*****************")
            print("=============================== GAME OVER ===============================")
            gameEnding = 1
            
        }
        if gameEnding == 1 {
            var startOrFinish: Int = 0
            player1Team.teamComposition.removeAll() // We remove all teamComposition to finish the game or start an another.
            player2Team.teamComposition.removeAll()
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
                switch startOrFinish {
                case 1:
                    print("Let's start a new game !")
                    game.startingMenu()
                case 2:
                    print("I hope you enjoyed this game. See you soon !")
                default:
                    break
                }
            }
        }
    }
}

