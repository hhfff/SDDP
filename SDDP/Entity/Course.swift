//
//  Course.swift
//  SDDP
//
//  Created by ITP312 on 21/6/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import Foundation

enum CourseCategory{
    case Children
    case HealthAndSport
    case Ladies
    case Language
}
class Course:Entity{
    var timing:String
    var trainnerName:String
    var feeMember:Double
    var feeNonMember:Double
    var venue:String
    
    init(_ id: Int, _ name: String, _ timing:String , _ trainnerName:String , _ feeMember: Double , _ feeNonMember: Double , _ venue:String) {
        self.timing = timing
        self.trainnerName = trainnerName
        self.feeMember = feeMember
        self.feeNonMember = feeNonMember
        self.venue = venue
        super.init(id, name)
    }
}
