//
//  SearchCell.swift
//  EngineerSkillCheck
//
//  Created by Yuta Kawabe on 2018/03/16.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class SearchCell: UITableViewCell {
    
    @IBOutlet weak private var avatarImageView: UIImageView!
    @IBOutlet weak private var loginLabel: UILabel!
    @IBOutlet weak private var typeLabel: UILabel!
    
    func setData(_ data: GitHubUser) {
        self.avatarImageView.sd_setImage(with: URL(string: data.avaterURL), placeholderImage: nil)
        self.loginLabel.text = data.login
        self.typeLabel.text = data.type
    }
}
