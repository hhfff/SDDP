//
//  CourseDao.swift
//  SDDP
//
//  Created by ITP312 on 26/6/18.
//  Copyright © 2018 ITP312. All rights reserved.
//

import Foundation

protocol CourseDatabaseInterface {
    static func getCourseByCategoryAndCommunity(community:CommunityCenter,category:CourseCategory)->[Course]
    static func getJoindCourse(user:User,course:Course)->[Course]
    static func joinCourse(user:User,course:Course)->Bool
    static func quitCourse(user:User,course:Course)->Bool
    static func addCreditCard()->Bool
    static func payment()->Bool
    
}

class CourseFirebaseDao:CourseDatabaseInterface{
    static func getJoindCourse(user: User, course: Course) -> [Course] {
        var courseList=[Course]()
        
        return courseList
        
    }
    static func getCourseByCategoryAndCommunity(community: CommunityCenter, category: CourseCategory) -> [Course] {
        var courseList=[Course]()
        
        return courseList
        
    }
    static func joinCourse(user: User, course: Course) -> Bool {
        
        
        return true
        
    }
    static func quitCourse(user: User, course: Course) -> Bool {
        return true
        
    }
    static func addCreditCard() -> Bool {
        return true
        
    }
    static func payment() -> Bool {
        
        return true
        
    }
    
}
