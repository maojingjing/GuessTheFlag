//
//  SetDetail.swift
//  GuessTheFlag
//
//  Created by Jingjing Mao on 6/20/24.
//

import Foundation


struct SetDetail: Codable {
    var lbs: Int
    var reps: Int
    
    public init() {
        self.lbs = 0
        self.reps = 0
    }
    
    public init(lbs: Int, reps: Int) {
        self.lbs = lbs
        self.reps = reps
    }
}
