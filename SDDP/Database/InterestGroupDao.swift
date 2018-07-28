//
//  InterestGroupDao.swift
//  SDDP
//
//  Created by ITP312 on 26/6/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import Foundation

protocol InterestGroupDatabaseInterface{
    static func getAllGroups(community:CommunityCenter)->[InterestGroup]
    static func getJoinedGroups(user:User)->[InterestGroup]
    static func joinGroup(user:User,group:InterestGroup)->Bool
    static func quitGroup(user:User,group:InterestGroup)->Bool
    static func addGroup(group:InterestGroup)->Bool
    static func getGroupDetail(group:InterestGroup)->InterestGroup
}

class InterestGroupFirebaseDao:InterestGroupDatabaseInterface{
    static func getAllGroups(community: CommunityCenter) -> [InterestGroup] {
        let groupList=[InterestGroup]()
        
        //
        
        return groupList
        
    }

    static func getJoinedGroups(user: User) -> [InterestGroup] {
        
        var groupList=[InterestGroup]()
        let contactPerson = ContactPerson(12,"Tom","98765432")
        groupList.append(InterestGroup(1,"Ray","Room12","13:00-15:00",contactPerson))
        groupList.append(InterestGroup(2,"Xinyu","Room14","14:00-16:00",contactPerson))
        return groupList
        
        
    }
    static func joinGroup(user: User, group: InterestGroup) -> Bool {
        
        return true
        
    }
    static func quitGroup(user: User, group: InterestGroup) -> Bool {
        
        return true
    }
    static func addGroup(group: InterestGroup) -> Bool {
        
        
        return true
    }
    static func getGroupDetail(group: InterestGroup) -> InterestGroup {
        let contactPerson=ContactPerson(1,"","")
        let group=InterestGroup(1,"","","",contactPerson)
        
        return group
        
    }
}
class InterestGroupMySQLDao{
    
}
