//
//  CCContact.swift
//  SDDP
//
//  Created by ITP312 on 21/6/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import Foundation
class ContactPerson:Entity{
    var contactNo:String
    init(_ id:Int,_ name:String,_ contactNo:String){
        self.contactNo=contactNo
        super.init(id, name)
        
    }
}
