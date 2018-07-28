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
        list.append(Facility(1,"Badminton Court","Nee Soon South CC",1))
        list.append(Facility(2,"Theatrette","Nee Soon South CC",1))
        list.append(Facility(3,"Multi-Purpose Hall","Nee Soon South CC",1))
        
        
        return list
    }
    static func bookedFacility(user: User, facility: Facility) -> Bool {
        
        
        return true
        
    }
    static func cancelBooking(booking: FacilityBooking) -> Bool {
        return true
        
    }
    
}
