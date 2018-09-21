//
//  ViewController.swift
//  WhatsApp
//
//  Created by kamalraj venkatesan on 19/09/18.
//  Copyright © 2018 Kamalraj. All rights reserved.
//

import UIKit
import Shared
import Chat
import RealmSwift

class ViewController: BaseTableViewController<ChatListTableViewCell, ChatListModel> {


  override func viewDidLoad() {
    super.viewDidLoad()

    // Search bar
    let searchBar = UISearchController(searchResultsController: nil)
    self.navigationItem.searchController = searchBar

    // Remove back button title.
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    // Bar button
    let newChatBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "New Chat"), style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    self.navigationItem.rightBarButtonItem = newChatBarButton

    let editBarButton = UIBarButtonItem(title: "Edit", style: .plain, target: nil, action: nil)
    self.navigationItem.leftBarButtonItem = editBarButton


    if !UserDefaults.standard.bool(forKey: "isExistingLogin") {
      UserDefaults.standard.set(true, forKey: "isExistingLogin")
      saveJsonIntoDataBase()
    }


    items = Array(try! Realm().objects(ChatListModel.self).sorted(byKeyPath: "recentInterationTime", ascending: true))

    }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    self.navigationController?.navigationBar.prefersLargeTitles = true
  }

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = ChatViewController()
    vc.chatId = items[indexPath.row]._id
    self.navigationController?.pushViewController(vc, animated: true)
    
  }

}
