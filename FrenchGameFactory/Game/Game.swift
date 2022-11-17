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
    
    // We control this 2 optional variable with a guard let inside the fight function.
    var attackerCharacter: Characters?
    var attackedCharacter: Characters?
    
    var playerPseudo: String
    
    var playerTeam:Team
    var opponentTeam:Team
    
    var isPlayerOneTurn:Bool = true // We create this variable to allow the change of turn.
    
    init() {
        self.playerPseudo = ""
        self.playerTeam = Team()
        self.opponentTeam = Team()
        
    }
    
    // We create a starting Menu function to execute the game.
    func playTheGame() {
        print("Hello and welcome on the FrenchFactory company's game specially create for you.\n Let me tell you there rules : 📜 \n "
              + "\n1. You must form a team of 3 characters. You can't have 2 same characters in your Team. \n"
              + "\n2. Each character has a talent with 33% chance's activation. \n"
              + "\n3. You fight between fighters. The winner is the one who killed the opposing team's fighters. \n"
              + "\n4. The last rule and the more important, enjoy the game 😁. \n")
        print("=============================================================")
        let player1Pseudo = player1.choosePlayerPseudo(allPlayerPseudo: [])
        player1Team.createYourTeam()
        _ = player2.choosePlayerPseudo(allPlayerPseudo: [player1Pseudo])
        player2Team.createYourTeam()
        displayPlayersTeams()
        
        var turn: Int = 1
        
        repeat {
            print("============================ TURN \(turn) =========================")
            fight()
            turn += 1
            
        } while !player1Team.teamComposition.isEmpty && !player2Team.teamComposition.isEmpty
        player1Team.checkWinnerTeam(player: player2)
        player2Team.checkWinnerTeam(player: player1)
    }
    
    // We created a function to display each player team's after the creation of teams.
    func displayPlayersTeams() {
        
        print("Let's start the game, the battle is between the first player : \(player1.pseudo) and the second player : \(player2.pseudo)")
        print("=============================================================")
        
        print("Here is \(player1.pseudo) team's")
        print("=============================================================")
        player1Team.statsTeam()
        
        print("=============================================================")
        print("Here is \(player2.pseudo) team's")
        print("=============================================================")
        player2Team.statsTeam()
    }
    
    // We create this function for the turn change.
    func switchPlayersTurn() {
        if isPlayerOneTurn  { // First case if is the playerOneTurn
            playerPseudo = player1.pseudo
            playerTeam = player1Team
            opponentTeam = player2Team
            
            isPlayerOneTurn = false
            
        } else { // Second case if is the playerTwoTurn
            playerPseudo = player2.pseudo
            playerTeam = player2Team
            opponentTeam = player1Team
            
            isPlayerOneTurn = true
        }
    }
    // We create a fight function.
    func fight() {
        
        var attackerChoice: Int = 0
        var attackedChoice: Int = 0
        
        switchPlayersTurn() // Before each fight we switch the player's turn.
        
        print("=============================================================")
        print("It's your turn \(playerPseudo). Please choose your attacker")
        playerTeam.statsTeam()
        print("=============================================================")
        print("Choose a number associated with one of your team's characters")
        print("=============================================================")
        
        attackerCharacter = playerTeam.characterSelection()
        guard let attackerCharacter = attackerCharacter else {return} // We use a guard let method because most of the code in this function depends on the existence of attackerCharacter variable. If no characterAreSelected we can't execut the rest of this function.
        
        repeat {
            
            print("=============================================================")
            print("You choose your \(attackerCharacter.className)")
            print("=============================================================")
            attackerChoice = 1
            
        } while attackerChoice != 1
        attackerChoice = 0
        
        print("Which opponent character's would you like to attack ? ")
        opponentTeam.statsTeam()
        print("=============================================================")
        print("Choose a number associate with one of your opponent team's")
        
        attackedCharacter = opponentTeam.characterSelection()
        guard let attackedCharacter = attackedCharacter else {return} // We use a guard let method because most of the code in this function depends on the existence of attackedCharacter variable. If no characterAreSelected we can't execut the rest of this function.
        
        repeat {
            
            print("=============================================================")
            print("You choose your opponent's \(attackedCharacter.className)")
            print("=============================================================")
            attackedCharacter.attack(attackedCharacter: attackedCharacter, attackerCharacter: attackerCharacter, playerTeam: playerTeam) // We call the attackTeam function to make the fight.
            if attackedCharacter.characterHealth <= 0 { // If attacked character health is less or equal than 0 we removed the character to teamComposition array's.
                opponentTeam.teamComposition.removeAll{(character) -> Bool in
                    return character.className == attackedCharacter.className ? true : false
                } // If attackedCharacter are now 0 lifepoint and it is in opponent teamComposition we remove this.
            }
            attackedChoice = 1
            
        } while attackedChoice != 1
        attackedChoice = 0
    }
}
