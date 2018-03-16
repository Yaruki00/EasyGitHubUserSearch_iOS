//
//  GitHubSearchUserResponse.swift
//  EngineerSkillCheck
//
//  Created by Yuta Kawabe on 2018/03/16.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation

struct GitHubSearchUserResponse: Codable {
    var totalCount : Int
    var items      : [GitHubUser]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
