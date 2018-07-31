//
//  Facility.swift
//  SDDP
//
//  Created by ITP312 on 21/6/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import Foundation
import UIKit
class Facility:Entity{
    
    var slot:[String]
    var fee:Double
    var feeType:String
    var image:UIImage?
    var imageName:String?
    
    
    
    
    init(_ id: Int, _ name: String,fee:Double,feeType:String,slot:[String],imageName:String) {
        self.fee=fee
        self.feeType=feeType
        self.slot=slot
        self.imageName=imageName
        
        
       
        super.init(id, name)
    }
    func copy(with zone:NSZone?=nil)->Any{
        var newSLot=[String]()
        for item in slot{
            newSLot.append(item)
        }
        let copy=Facility(0,name,fee:fee,feeType:feeType,slot:newSLot,imageName:imageName!)
        return copy
    }
    
    
    
}
