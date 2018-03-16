//
//  UIView+.swift
//  EngineerSkillCheck
//
//  Created by Yuta Kawabe on 2018/03/16.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func matchParent(_ parent: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
    }
    
    func systemLayoutFitToWidth(_ width: CGFloat) {
        var fittingSize = UILayoutFittingCompressedSize
        fittingSize.width = width
        let size = self.systemLayoutSizeFitting(fittingSize, withHorizontalFittingPriority: UILayoutPriority(rawValue: 1000), verticalFittingPriority: UILayoutPriority(rawValue: 250))
        self.bounds = CGRect(origin: .zero, size: size)
        self.sizeToFit()
    }
    
    func removeAllChildrenView() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
}

extension UIView {
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
