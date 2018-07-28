//
//  InterestGroup.swift
//  SDDP
//
//  Created by ITP312 on 21/6/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import Foundation

class InterestGroup:Entity{
    // could be more than 1 time, so use string
    var timing:String
    var venue:String
    var contactPerson:ContactPerson
    init(_ id: Int, _ name: String,_ timing:String,_ venue:String,_ contactPerson:ContactPerson) {
        self.timing=timing
        self.venue=venue
        self.contactPerson=contactPerson
        super.init(id, name)
    }
    
}
