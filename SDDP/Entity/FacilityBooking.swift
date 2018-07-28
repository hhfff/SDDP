//
//  FacilityBooking.swift
//  SDDP
//
//  Created by hhf on 8/7/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import Foundation
class FacilityBooking{
    var userIC:String
    var facilityId:Int
    var startDateTime:String
    var endDateTime:String
    
    init(userIC:String,facilityId:Int,startDateTime:String,endDateTime:String){
        self.userIC=userIC
        self.facilityId=facilityId
        self.startDateTime=startDateTime
        self.endDateTime=endDateTime
        
    }
}
