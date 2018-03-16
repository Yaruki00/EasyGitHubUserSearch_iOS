//
//  UITableViewCell+.swift
//  EngineerSkillCheck
//
//  Created by Yuta Kawabe on 2018/03/16.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static var nib: UINib { return UINib(nibName: String(describing: self.self), bundle: nil) }
    
    static var name: String { return String(describing: self.self) }
}
