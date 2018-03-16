//
//  TransitionManager.swift
//  EngineerSkillCheck
//
//  Created by Yuta Kawabe on 2018/03/16.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation
import UIKit

class TransitionManager {
    
    static func pushDeail(vc: UIViewController, name: String, urlString: String) {
        let detail = DetailViewController.instantiateWith(name: name, urlString: urlString)
        vc.navigationController?.pushViewController(detail, animated: true)
    }
}
