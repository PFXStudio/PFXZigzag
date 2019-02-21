//
//  bowling-score-calculator.swift
//  PFXZigzag
//
//  Created by PFXStudio on 2019. 2. 21..
//  Copyright © 2019년 PFXStudio. All rights reserved.
//

import UIKit

class bowling_score_calculator: NSObject {
    
    private static let kMaxFrame = 10
    private static let kMaxPin = 10
    
    var currentRoll = 0
    var rolls = [Int]()
    
    func roll(pins: Int) {
        self.rolls[self.currentRoll] = pins
        self.currentRoll = self.currentRoll + 1
    }
    
    func score() -> [Int] {
        var scores = [Int]()
        var score = 0
        var frame = 0
        for _ in 1...bowling_score_calculator.kMaxFrame {
            if self.currentRoll == frame + 1 {
                break
            }
            
            switch frame {
            case let fr where self.isStrike(frame: frame):
                score += self.pointsInStrike(frame: fr)
                frame += 1
            case let fr where self.isSpare(frame: frame):
                score += self.pointsInSpare(frame: fr)
                frame += 2
            case let fr:
                assert(self.rolls[fr] + self.rolls[fr + 1] <= 10, "wrong spare score \(self.rolls[fr]), \(self.rolls[fr + 1])")
                score += self.rolls[fr] + self.rolls[fr + 1]
                frame += 2
            }
            
            scores.append(score)
        }

        return scores
    }
    
    private func isStrike(frame: Int) -> Bool {
        return self.rolls[frame] == bowling_score_calculator.kMaxPin
    }
    
    private func pointsInStrike(frame: Int) -> Int {
        return 10 + self.rolls[frame + 1] + self.rolls[frame + 2]
    }
    
    private func isSpare(frame: Int) -> Bool {
        return self.rolls[frame] + self.rolls[frame + 1] == bowling_score_calculator.kMaxPin
    }
    
    private func pointsInSpare(frame: Int) -> Int {
        return 10 + self.rolls[frame + 2]
    }
    
    override init() {
        super.init()

        print(self.solution("AAAAAAAAAAAA"))
        print(self.solution("82A900519A"))
        print(self.solution("AAAAAAAAA52A"))
//        print(self.solution("85A900519A"))

        print("end")
    }
    
    public func solution(_ text: String) -> [Int] {
        self.currentRoll = 0
        self.rolls = [Int](repeating: 0, count: 21)
        for i in text {
            if i == "A" {
                self.roll(pins: 10)
            }
            else {
                self.roll(pins: Int(String(i))!)
            }
        }
        
        return self.score()
    }
}
