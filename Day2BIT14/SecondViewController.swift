//
//  SecondViewController.swift
//  Day2BIT14
//
//  Created by Jlius Suweno on 30/09/20.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var turnLabel: UILabel!
    
    enum Player : String {
        case X = "X"
        case O = "O"
        
        func other() -> Player {
            switch (self) {
            case .O: return .X
            case .X: return .O
            }
        }
        
        func text() -> String {
            return self.rawValue
        }
        
        static func random() -> Player {
            return arc4random_uniform(2) == 0 ? .O : .X
        }
    }
    
    var currentPlayer: Player!
    
    var board: [Player?] = [nil,nil,nil,
                            nil,nil,nil,
                            nil,nil,nil]
    
    let winningCombos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], //horizontal
                         [0, 3, 6], [1, 4, 7], [2, 5, 8], //vertical
                         [0, 4, 8], [2, 4, 6]] //diagonals
    
    var gameOver = false
    var turnCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPlayer = Player.random()
        turnLabel.text = "Turn : \(currentPlayer.rawValue)"
    }
    
    func checkForWinner() -> Bool {
        for combo in winningCombos {
            let row = combo.map { board[$0] }
            if (row[0] != nil && row[0] == row[1] && row[1] == row[2]) {
                //                return row[0]
                return true
            }
        }
        return false
    }
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        board = [nil,nil,nil,
                 nil,nil,nil,
                 nil,nil,nil]
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setTitle("", for: .normal)
        }
        currentPlayer = Player.random()
        turnCount = 0
        gameOver = false
        turnLabel.text = "Turn : \(currentPlayer.rawValue)"
        
        
    }
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        let space = sender.tag - 1
        
        if board[space] == nil {
            board[space] = currentPlayer
            sender.setTitle(currentPlayer.text(), for: .normal)
            turnCount += 1
            let winner = checkForWinner()
            if winner {
                gameOver = true
                turnLabel.text = "\(currentPlayer.text()) is the winner!"
            } else if (turnCount == 9) {
                gameOver = true
                turnLabel.text = "It's a tie!"
            } else {
                currentPlayer = currentPlayer.other()
                turnLabel.text = "Turn : \(currentPlayer.text())"
            }
        }
        
        
    }
}
