//
//  CommunityDao.swift
//  SDDP
//
//  Created by hhf on 25/7/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import Foundation
import FirebaseDatabase

class CommunityCenterDao{
    var ref: DatabaseReference!
    var cc:CommunityCenter
    
    init() {
        ref = Database.database().reference()
        cc=CommunityCenter(1,"xx","169 hell week","123","xx.com","00:8888")
    }
    
    func writeCCData(cc:CommunityCenter){
        var dataDict=[String:Any]()
        dataDict.updateValue(cc.address, forKey: "address")
        dataDict.updateValue(cc.email, forKey: "email")
        dataDict.updateValue(cc.operatingHour,forKey: "openHour")
        dataDict.updateValue(cc.phoneNo, forKey: "tel")
        dataDict.updateValue(cc.name, forKey: "name")
        let dataBaseref=ref.child("cc").child("\(cc.name)")
        dataBaseref.updateChildValues(dataDict)
    }

    func getCCInfo(ccName:String)->CommunityCenter{
        
        ref.child("cc").child("\(ccName)").observe(.value, with: { (snapshot) in
            print("retrive data")
            let value=snapshot.value as? NSDictionary
            let address=value?["address"] as? String
            let tel=value?["tel"] as? String
            let openHour=value?["openHour"] as? String
            let email=value?["email"] as? String
            let name=value?["name"] as? String
            
            
            
            self.cc.address=address!
            self.cc.email=email!
            self.cc.operatingHour=openHour!
            self.cc.phoneNo=tel!
            self.cc.name=name!
            
            
            
        })
        print(cc.name)
        print("return data")
        return cc
        
    }
}
