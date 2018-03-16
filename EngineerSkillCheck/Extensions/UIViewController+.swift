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

extension UIViewController {
    
    private var loadingViewTag: Int { return 610 }
    
    @objc
    func showActivityIndicator() {
        guard self.view.viewWithTag(self.loadingViewTag) == nil else {
            return
        }
        let loadingView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        loadingView.tag = self.loadingViewTag
        loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        indicator.center = CGPoint(x: loadingView.frame.size.width/2, y: loadingView.frame.size.height/4)
        loadingView.addSubview(indicator)
        indicator.startAnimating()
        self.view.addSubview(loadingView)
    }
    
    func hideActivityIndicator() {
        if let loadingView = self.view.viewWithTag(self.loadingViewTag) {
            loadingView.removeFromSuperview()
        }
    }
}
