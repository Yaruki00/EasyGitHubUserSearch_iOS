//
//  DetailViewController.swift
//  EngineerSkillCheck
//
//  Created by Yuta Kawabe on 2018/03/16.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak private var webFrameView: UIView!
    
    private var webView = WKWebView()
    private var urlString: String = "about:blank"
    
    static func instantiateWith(name: String, urlString: String) -> DetailViewController {
        let vc = DetailViewController.instantiate()
        vc.title = name
        if urlString.count > 0 {
            vc.urlString = urlString
        }
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
}

extension DetailViewController {
    
    private func setup() {
        self.setupWebView()
    }
    
    private func setupWebView() {
        self.webView.navigationDelegate = self
        self.webFrameView.addSubview(self.webView)
        self.webView.matchParent(self.webFrameView)
        let url = URL(string: self.urlString)!
        let request = URLRequest(url: url)
        self.showActivityIndicator()
        self.webView.load(request)
    }
}

extension DetailViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.hideActivityIndicator()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.hideActivityIndicator()
    }
}
