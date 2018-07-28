//
//  User.swift
//  SDDP
//
//  Created by ITP312 on 21/6/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import Foundation

class User:Entity{
    var IC:String
    var contactNo:String
    var address:String
    
    
    init(_ id: Int, _ name: String,_ ic:String,_ contactNo:String,_ address:String) {
        self.IC = ic
        self.contactNo=contactNo
        self.address=address
        super.init(id, name)
    }
    
}
