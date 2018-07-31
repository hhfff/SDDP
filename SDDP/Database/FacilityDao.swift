//
//  FacilityDao.swift
//  SDDP
//
//  Created by hhf on 8/7/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import Foundation

protocol FacilitDatabase{
    static func getAllFacilityByCC(cc:CommunityCenter)->[Facility]
    static func bookedFacility(user:User,facility:Facility)->Bool
    static func cancelBooking(booking:FacilityBooking)->Bool
}
class FacilityFireBaseDao:FacilitDatabase{
    static func getAllFacilityByCC(cc: CommunityCenter) -> [Facility] {
        var list=[Facility]()
        
        
        
        return list
    }
    static func bookedFacility(user: User, facility: Facility) -> Bool {
        
        
        return true
        
    }
    static func cancelBooking(booking: FacilityBooking) -> Bool {
        return true
        
    }
    
}
