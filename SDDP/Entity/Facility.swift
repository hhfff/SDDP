//
//  Facility.swift
//  SDDP
//
//  Created by ITP312 on 21/6/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import Foundation

class Facility:Entity{
    var venue:String
    var ccID:Int
    
    
    init(_ id: Int, _ name: String,_ venue:String,_ ccID:Int) {
        self.ccID=ccID
        self.venue=venue
        super.init(id, name)
    }
    
    
}
