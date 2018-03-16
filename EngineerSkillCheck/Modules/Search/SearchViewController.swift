//
//  SearchViewController.swift
//  EngineerSkillCheck
//
//  Created by Yuta Kawabe on 2018/03/16.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var tableView: UITableView!
    
    private var userList: [GitHubUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text,
            query.count > 0 else {
                UIAlertController.showOkAlert(
                    vc      : self,
                    title   : "入力エラー",
                    message : "1文字以上入力してください。"
                )
                return
        }
        self.showActivityIndicator()
        APIManager.seachGitHubUser(
            query   : query,
            success : { response in
                self.userList = response.items
                self.tableView.reloadData()
                searchBar.resignFirstResponder()
                self.hideActivityIndicator()
        },
            failure : {
                UIAlertController.showOkAlert(
                    vc      : self,
                    title   : "通信エラー",
                    message : "ネットワーク接続を確認して\nもう一度お試したください"
                )
                self.hideActivityIndicator()
        })
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.name, for: indexPath) as! SearchCell
        cell.setData(self.userList[indexPath.row])
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        // TODO: move to detail
    }
}
