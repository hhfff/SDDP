//
//  CommunityCenter.swift
//  SDDP
//
//  Created by ITP312 on 21/6/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import Foundation

class CommunityCenter:Entity{
    
    var address: String
    var phoneNo: String
    var email:String
    var operatingHour: String
    
    init(_ id:Int,_ name:String,_ address:String,_ phoneNo:String,_ email:String,_ operatingHour:String){
        self.address=address
        self.phoneNo=phoneNo
        self.email=email
        self.operatingHour=operatingHour
        super.init(id, name)
    }
   
    
}
