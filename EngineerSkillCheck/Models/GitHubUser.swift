//
//  GitHubUser.swift
//  EngineerSkillCheck
//
//  Created by Yuta Kawabe on 2018/03/16.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation

struct GitHubUser: Codable {
    var id        : Int
    var login     : String
    var avaterURL : String
    var type      : String
    var htmlURL   : String
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avaterURL = "avatar_url"
        case type
        case htmlURL = "html_url"
    }
}
