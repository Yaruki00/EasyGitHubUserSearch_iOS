//
//  UIViewController+.swift
//  EngineerSkillCheck
//
//  Created by Yuta Kawabe on 2018/03/16.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    @IBAction func dismiss(_ sender: Any? = nil) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pop(_ sender: Any? = nil) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UIViewController: StoryBoardInstantiatable {}

protocol StoryBoardInstantiatable {}
extension StoryBoardInstantiatable where Self: UIViewController {
    
    static func instantiate() -> Self {
        let bundle = Bundle(for: self.self)
        let name = String(describing: self.self)
        
        guard let vc = UIStoryboard(name: name, bundle: bundle).instantiateInitialViewController() as? Self else {
            fatalError("UIViewController.instantiate() failed: \(name)")
        }
        
        return vc
    }
}
