//
//  APIManager.swift
//  EngineerSkillCheck
//
//  Created by Yuta Kawabe on 2018/03/16.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    static func seachGitHubUser(query: String, success: @escaping (GitHubSearchUserResponse) -> Void, failure: @escaping () -> Void) {
        let params = [
            "q": query,
        ]
        Alamofire.request(URL.seachGitHubUser, method: .get, parameters: params).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(GitHubSearchUserResponse.self, from: data)
                    success(response)
                }
                catch(_) {
                    failure()
                }
            case .failure(_):
                failure()
            }
        }
    }
}
