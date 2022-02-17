//
//  userInfomation.swift
//  iOS_SignUpPage
//
//  Created by Jooeun Kim on 2022/02/17.
//

import Foundation

class UserInfo{
    
    static let shared:UserInfo  = UserInfo()
    
    var id : String?
    var profilePhoto : String?
    var password :String?
    var name : String?
    var adult : String?
    var phoneNumber : Int?
    var termsOfUse : Bool?
    var termsOfPrivacy : Bool?
    
    private init() { }
    
    
}
