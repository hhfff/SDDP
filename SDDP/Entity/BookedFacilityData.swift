//
//  BookedFacilityData.swift
//  SDDP
//
//  Created by hhf on 30/7/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import Foundation


class BookedFacilityData{
   
    var userName:String?
    var fee:Double?
    var feeType:String?
    var slot:String?
    var facilityName:String?
    var ccName:String?
    var date:Date?
    
    init(userName:String,fee:Double,feeType:String,slot:String,facilityName:String,ccName:String,date:Date){
        self.date=date
        self.userName=userName
        self.fee=fee
        self.feeType=feeType
        self.slot=slot
        self.facilityName=facilityName
        self.ccName=ccName
        
    }
    
}
